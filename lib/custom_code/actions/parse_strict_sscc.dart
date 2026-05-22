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
import '/flutter_flow/custom_functions.dart';

import '/custom_code/actions/index.dart';

Future<dynamic> parseStrictSscc(String? rawScan) async {
  if (rawScan == null || rawScan.trim().isEmpty) {
    return {"success": false, "message": "Empty scan", "sscc": ""};
  }

  String original = rawScan.trim();
  String data = original;

  // لو فيه ]C1 شيله
  if (data.startsWith(']C1')) {
    data = data.substring(3);
  }

  // Remove GS / FNC1 separators
  data = data
      .replaceAll(String.fromCharCode(29), '')
      .replaceAll('', '')
      .replaceAll('<GS>', '')
      .replaceAll('[GS]', '')
      .replaceAll('{GS}', '');

  // Keep digits only
  data = data.replaceAll(RegExp(r'[^0-9]'), '');

  // لازم يبدأ بـ AI 00
  if (!data.startsWith('00')) {
    return {
      "success": false,
      "message": "SSCC AI (00) not found",
      "sscc": "",
      "raw": rawScan,
      "cleaned": data
    };
  }

  // لازم يكون فيه 18 رقم بعد الـ 00
  if (data.length < 20) {
    return {
      "success": false,
      "message": "Invalid SSCC length",
      "sscc": "",
      "raw": rawScan,
      "cleaned": data
    };
  }

  String sscc = data.substring(2, 20);

  return {
    "success": true,
    "message": "Valid GS1 SSCC",
    "sscc": sscc,
    "raw": rawScan,
    "cleaned": data
  };
}
