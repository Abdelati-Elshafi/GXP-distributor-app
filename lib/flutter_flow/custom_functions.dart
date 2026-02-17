import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';

String? generateSSCC(
  String? extensionDigit,
  String? companyPrefix,
  String? serialReference,
) {
  // تحقق من أن القيم مش null
  if (extensionDigit == null ||
      companyPrefix == null ||
      serialReference == null) {
    return null;
  }

  // تأكد أن القيم كلها أرقام
  final digitsOnly = RegExp(r'^\d+$');
  if (!digitsOnly.hasMatch(extensionDigit) ||
      !digitsOnly.hasMatch(companyPrefix) ||
      !digitsOnly.hasMatch(serialReference)) {
    return null;
  }

  // extensionDigit لازم يكون رقم واحد
  if (extensionDigit.length != 1) {
    return null;
  }

  const int totalLengthWithoutCheckDigit = 17;
  String baseWithoutSerial = extensionDigit + companyPrefix;

  // لو طول extension+prefix أكبر من 17 يبقى خطأ
  if (baseWithoutSerial.length > totalLengthWithoutCheckDigit) {
    return null;
  }

  // نعمل padding للـ serialReference بحيث يكمّل الطول لـ 17
  int remainingLength = totalLengthWithoutCheckDigit - baseWithoutSerial.length;
  String paddedSerial = serialReference.padLeft(remainingLength, '0');

  String base = baseWithoutSerial + paddedSerial; // طول = 17 رقم

  // دالة داخلية لحساب check digit (GS1 Modulo 10)
  int calculateCheckDigit(String number) {
    int sum = 0;
    bool multiplyBy3 = true; // نبدأ من أقصى اليمين

    for (int i = number.length - 1; i >= 0; i--) {
      int digit = int.parse(number[i]);
      sum += digit * (multiplyBy3 ? 3 : 1);
      multiplyBy3 = !multiplyBy3;
    }

    int mod = sum % 10;
    return (mod == 0) ? 0 : (10 - mod);
  }

  int checkDigit = calculateCheckDigit(base);
  return base + checkDigit.toString(); // طول = 18 رقم
}

bool checkStringInLis(
  String input,
  String list,
) {
  bool x = list.contains(input);
  return x;
}
