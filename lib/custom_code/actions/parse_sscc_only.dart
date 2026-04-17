// Automatic FlutterFlow imports
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/custom_code/actions/index.dart';

Future<dynamic> parseSsccOnly(String? rawScan) async {
  if (rawScan == null || rawScan.trim().isEmpty) {
    return {
      'success': false,
      'message': 'Empty scan data',
      'sscc': '',
      'raw': rawScan ?? '',
      'cleaned': '',
    };
  }

  String data = rawScan.trim();

  // Remove common symbology identifiers مثل ]C1 / ]d2 / ]Q3
  if (data.startsWith(']') && data.length >= 3) {
    data = data.substring(3);
  }

  // Replace common GS/FNC1 representations
  data = data
      .replaceAll('<GS>', '')
      .replaceAll('[GS]', '')
      .replaceAll('{GS}', '')
      .replaceAll(r'\u001D', '')
      .replaceAll(String.fromCharCode(29), '');

  // Keep digits only
  String digitsOnly = data.replaceAll(RegExp(r'[^0-9]'), '');

  String sscc = '';

  // الحالة الأساسية: GS1 AI 00 + 18 digits = 20 digits total
  final matchWithAI = RegExp(r'00(\d{18})').firstMatch(digitsOnly);
  if (matchWithAI != null) {
    sscc = matchWithAI.group(1) ?? '';
  } else {
    // لو الداتا نفسها 18 رقم فقط بدون AI 00
    final exact18 = RegExp(r'^\d{18}$').firstMatch(digitsOnly);
    if (exact18 != null) {
      sscc = digitsOnly;
    }
  }

  return {
    'success': sscc.isNotEmpty,
    'message': sscc.isNotEmpty ? 'SSCC parsed successfully' : 'SSCC not found',
    'sscc': sscc,
    'raw': rawScan,
    'cleaned': digitsOnly,
    'isValidSsccLength': sscc.length == 18,
  };
}
