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
import 'dart:io';
import 'package:scanwedge/scanwedge.dart';

Scanwedge? scanwedge;
StreamSubscription<ScanResult>? scanSubscription;

Future<void> initializeScanWedge() async {
  if (!Platform.isAndroid) {
    print('ScanWedge works on Android only');
    return;
  }

  try {
    // Initialize plugin
    scanwedge ??= await Scanwedge.initialize();

    // Check if device is supported
    if (!scanwedge!.isDeviceSupported) {
      print('Device not supported');
      return;
    }

    print(
      'Supported device: ${scanwedge!.manufacturer} - ${scanwedge!.deviceName}',
    );

    // Create profile based on device manufacturer
    await scanwedge!.createScanProfile(
      switch (scanwedge!.manufacturer) {
        'Honeywell' => HoneywellProfileModel(
            profileName: 'GXPTrace Profile',
            enableEanCheckDigitTransmission: true,
            enabledBarcodes: [
              BarcodeConfig(barcodeType: BarcodeTypes.code39),
              BarcodeConfig(barcodeType: BarcodeTypes.code128),
              BarcodeConfig(barcodeType: BarcodeTypes.ean8),
              BarcodeConfig(barcodeType: BarcodeTypes.ean13),
              BarcodeConfig(barcodeType: BarcodeTypes.datamatrix),
              BarcodeConfig(barcodeType: BarcodeTypes.qrCode),
            ],
          ),
        'ZEBRA' => ZebraProfileModel(
            profileName: 'GXPTrace Profile',
            enabledBarcodes: [
              BarcodeConfig(barcodeType: BarcodeTypes.code39),
              BarcodeConfig(barcodeType: BarcodeTypes.code128),
              BarcodeConfig(barcodeType: BarcodeTypes.ean8),
              BarcodeConfig(barcodeType: BarcodeTypes.ean13),
              BarcodeConfig(barcodeType: BarcodeTypes.datamatrix),
              BarcodeConfig(barcodeType: BarcodeTypes.qrCode),
            ],
            enableKeyStroke: false,
          ),
        _ => ProfileModel(
            profileName: 'GXPTrace Profile',
            enabledBarcodes: [
              BarcodeTypes.code39.create(),
              BarcodeTypes.code128.create(),
              BarcodeTypes.ean8.create(),
              BarcodeTypes.ean13.create(),
              BarcodeTypes.datamatrix.create(),
              BarcodeTypes.qrCode.create(),
            ],
            keepDefaults: false,
          ),
      },
    );

    // Enable scanner
    await scanwedge!.enableScanner();

    // Cancel previous subscription
    await scanSubscription?.cancel();

    // Listen for scan results
    scanSubscription = scanwedge!.stream.listen(
      (ScanResult scanResult) {
        final scannedCode = scanResult.barcode;

        if (scannedCode.isNotEmpty) {
          FFAppState().update(() {
            FFAppState().ScannedBarcode = scannedCode;
          });

          print('SCANWEDGE SCANNED: $scannedCode');
        }
      },
      onError: (error) {
        print('SCANWEDGE ERROR: $error');
      },
    );

    print('ScanWedge initialized successfully');
  } catch (e) {
    print('Initialize ScanWedge Error: $e');
  }
}
