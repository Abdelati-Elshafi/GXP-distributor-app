// Automatic FlutterFlow imports
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';

Future<String> getDeviceType() async {
  try {
    final deviceInfo = DeviceInfoPlugin();

    if (!Platform.isAndroid) {
      return 'Other';
    }

    final androidInfo = await deviceInfo.androidInfo;

    final manufacturer = androidInfo.manufacturer.toLowerCase();
    final brand = androidInfo.brand.toLowerCase();
    final model = androidInfo.model.toLowerCase();

    // Zebra Devices
    if (manufacturer.contains('zebra') ||
        brand.contains('zebra') ||
        model.contains('tc15') ||
        model.contains('tc21') ||
        model.contains('tc26') ||
        model.contains('tc27') ||
        model.contains('tc52') ||
        model.contains('mc33') ||
        model.contains('mc93')) {
      return 'Zebra';
    }

    // Honeywell Devices
    if (manufacturer.contains('honeywell') ||
        brand.contains('honeywell') ||
        model.contains('ct30') ||
        model.contains('ct40') ||
        model.contains('ct45') ||
        model.contains('ck65') ||
        model.contains('eda52')) {
      return 'Honeywell';
    }

    // Samsung Devices
    if (manufacturer.contains('samsung') || brand.contains('samsung')) {
      return 'Samsung';
    }

    // Datalogic Devices
    if (manufacturer.contains('datalogic') ||
        brand.contains('datalogic') ||
        model.contains('memor') ||
        model.contains('skorpio')) {
      return 'Datalogic';
    }

    // Unknown Android Device
    return androidInfo.manufacturer;
  } catch (e) {
    return 'Other';
  }
}
