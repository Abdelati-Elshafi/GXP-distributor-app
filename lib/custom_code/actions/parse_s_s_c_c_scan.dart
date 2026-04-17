// Automatic FlutterFlow imports
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<dynamic> parseSSCCScan(String? rawScan) async {
  if (rawScan == null || rawScan.trim().isEmpty) {
    return {
      'success': false,
      'message': 'Empty scan data',
      'sscc': '',
      'raw': rawScan ?? '',
    };
  }

  String data = rawScan.trim();

  // Remove common scanner prefix like ]C1
  if (data.startsWith(']') && data.length >= 3) {
    data = data.substring(3);
  }

  // Normalize GS / FNC1 representations
  data = data
      .replaceAll('<GS>', String.fromCharCode(29))
      .replaceAll('[GS]', String.fromCharCode(29))
      .replaceAll('{GS}', String.fromCharCode(29))
      .replaceAll(r'\u001D', String.fromCharCode(29));

  String sscc = '';

  int i = 0;

  while (i < data.length) {
    // Skip separator if found
    if (data.codeUnitAt(i) == 29) {
      i++;
      continue;
    }

    if (i + 2 > data.length) break;

    final ai = data.substring(i, i + 2);

    // AI 00 = SSCC (18 digits fixed)
    if (ai == '00') {
      if (i + 20 <= data.length) {
        sscc = data.substring(i + 2, i + 20);

        return {
          'success': true,
          'message': 'SSCC parsed successfully',
          'sscc': sscc,
          'raw': rawScan,
        };
      } else {
        return {
          'success': false,
          'message': 'Invalid SSCC length',
          'sscc': '',
          'raw': rawScan,
        };
      }
    }

    // Move forward if current chars are not recognized AI
    i++;
  }

  return {
    'success': false,
    'message': 'No SSCC found',
    'sscc': '',
    'raw': rawScan,
  };
}
