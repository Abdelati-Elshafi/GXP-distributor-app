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

Future<dynamic> parseStrictSscc(String? rawScan) async {
  if (rawScan == null || rawScan.trim().isEmpty) {
    return {"success": false, "message": "Empty scan", "sscc": ""};
  }

  String original = rawScan.trim();

  // لازم يبدأ بـ ]C1
  if (!original.startsWith(']C1')) {
    return {
      "success": false,
      "message": "Not GS1-128 barcode",
      "sscc": "",
      "raw": rawScan
    };
  }

  // Remove ]C1
  String data = original.substring(3);

  // Remove FNC1 / separators
  data = data
      .replaceAll(String.fromCharCode(29), '')
      .replaceAll('', '')
      .replaceAll('<GS>', '')
      .replaceAll('[GS]', '')
      .replaceAll('{GS}', '');

  // Keep digits only
  data = data.replaceAll(RegExp(r'[^0-9]'), '');

  // لازم يكون AI 00 + 18 رقم
  if (data.length < 20 || !data.startsWith('00')) {
    return {
      "success": false,
      "message": "SSCC AI (00) not found",
      "sscc": "",
      "raw": rawScan
    };
  }

  String sscc = data.substring(2, 20);

  if (sscc.length != 18) {
    return {
      "success": false,
      "message": "Invalid SSCC length",
      "sscc": "",
      "raw": rawScan
    };
  }

  return {
    "success": true,
    "message": "Valid GS1 SSCC",
    "sscc": sscc,
    "raw": rawScan,
    "cleaned": data
  };
}
