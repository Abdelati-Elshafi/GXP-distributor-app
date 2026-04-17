// Automatic FlutterFlow imports
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';

Future<String> generateSSCCAction(
  String extensionDigit,
  String companyPrefix,
  String serialReference,
) async {
  const int totalLengthWithoutCheckDigit = 17;
  String baseWithoutSerial = extensionDigit + companyPrefix;

  if (baseWithoutSerial.length > totalLengthWithoutCheckDigit) {
    throw Exception("Company prefix + extension too long");
  }

  // نعمل padding للـ serialReference لحد ما نوصل 17 رقم
  int remainingLength = totalLengthWithoutCheckDigit - baseWithoutSerial.length;
  String paddedSerial = serialReference.padLeft(remainingLength, '0');

  String base = baseWithoutSerial + paddedSerial; // طول 17

  // حساب Check digit (GS1 Modulo 10)
  int sum = 0;
  bool multiplyBy3 = true;
  for (int i = base.length - 1; i >= 0; i--) {
    int digit = int.parse(base[i]);
    sum += digit * (multiplyBy3 ? 3 : 1);
    multiplyBy3 = !multiplyBy3;
  }
  int mod = sum % 10;
  int checkDigit = (mod == 0) ? 0 : (10 - mod);

  // نرجع الكود النهائي (18 digit)
  return base + checkDigit.toString();
}
// End custom action code
