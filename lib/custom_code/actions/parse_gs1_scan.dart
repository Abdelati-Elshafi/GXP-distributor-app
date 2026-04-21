// Automatic FlutterFlow imports
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<dynamic> parseGs1Scan(String? rawScan) async {
  if (rawScan == null || rawScan.trim().isEmpty) {
    return {
      'success': false,
      'message': 'Empty scan data',
      'gtin': '',
      'serial': '',
      'batch': '',
      'expiry': '',
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

  String gtin = '';
  String serial = '';
  String batch = '';
  String expiry = '';

  int i = 0;

  while (i < data.length) {
    // Skip separator if found
    if (data.codeUnitAt(i) == 29) {
      i++;
      continue;
    }

    if (i + 2 > data.length) break;

    final ai = data.substring(i, i + 2);

    // AI 01 = GTIN
    if (ai == '01') {
      if (i + 16 <= data.length) {
        gtin = data.substring(i + 2, i + 16);
        i += 16;
        continue;
      } else {
        break;
      }
    }

    // AI 21 = Serial
    if (ai == '21') {
      i += 2;
      final start = i;

      while (i < data.length && data.codeUnitAt(i) != 29) {
        i++;
      }

      serial = data.substring(start, i);

      if (i < data.length && data.codeUnitAt(i) == 29) {
        i++;
      }
      continue;
    }

    // AI 17 = Expiry
    if (ai == '17') {
      if (i + 8 <= data.length) {
        expiry = data.substring(i + 2, i + 8);
        i += 8;
        continue;
      } else {
        break;
      }
    }

    // AI 10 = Batch
    if (ai == '10') {
      i += 2;
      final start = i;

      while (i < data.length && data.codeUnitAt(i) != 29) {
        i++;
      }

      batch = data.substring(start, i);

      if (i < data.length && data.codeUnitAt(i) == 29) {
        i++;
      }
      continue;
    }

    i++;
  }

  // لو مفيش Serial
  if (serial.trim().isEmpty) {
    return {
      'success': false,
      'message': 'Serial not found',
      'gtin': gtin,
      'serial': '',
      'batch': batch,
      'expiry': expiry,
      'raw': rawScan,
    };
  }

  return {
    'success': true,
    'message': 'Parsed successfully',
    'gtin': gtin,
    'serial': serial,
    'batch': batch,
    'expiry': expiry,
    'raw': rawScan,
  };
}
