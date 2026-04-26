// Automatic FlutterFlow imports
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/custom_code/widgets/index.dart';
import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';

import 'package:mobile_scanner/mobile_scanner.dart';

class MultiBarcodeScanner extends StatefulWidget {
  const MultiBarcodeScanner({
    Key? key,
    this.width,
    this.height,
    this.initialCodes = const [],
    this.onSave,
    this.onCancel,
  }) : super(key: key);

  final double? width;
  final double? height;
  final List<String> initialCodes;

  final Future<dynamic> Function(List<String> codes)? onSave;
  final Future<dynamic> Function()? onCancel;

  @override
  State<MultiBarcodeScanner> createState() => _MultiBarcodeScannerState();
}

class _MultiBarcodeScannerState extends State<MultiBarcodeScanner> {
  final MobileScannerController controller = MobileScannerController(
    facing: CameraFacing.back,
    detectionSpeed: DetectionSpeed.noDuplicates,
    returnImage: false,
    formats: [BarcodeFormat.all],
  );

  final Set<String> _newSerials = {};
  final Set<String> _allSerials = {};
  DateTime? _lastScanTime;

  final String gs = String.fromCharCode(29);

  @override
  void initState() {
    super.initState();

    _allSerials.addAll(
      widget.initialCodes.where((e) => e.trim().isNotEmpty),
    );

    debugPrint("✅ initial serials: ${widget.initialCodes}");
  }

  @override
  void didUpdateWidget(covariant MultiBarcodeScanner oldWidget) {
    super.didUpdateWidget(oldWidget);

    _allSerials
      ..clear()
      ..addAll(widget.initialCodes.where((e) => e.trim().isNotEmpty))
      ..addAll(_newSerials);

    if (mounted) setState(() {});
  }

  String _cleanRaw(String rawScan) {
    String data = rawScan.trim();

    if (data.startsWith(']C1')) {
      data = data.substring(3);
    }

    data = data
        .replaceAll('<GS>', gs)
        .replaceAll('[GS]', gs)
        .replaceAll('{GS}', gs)
        .replaceAll(r'\u001D', gs)
        .replaceAll('\\u001D', gs);

    return data;
  }

  String _readVariableField(String data, int start) {
    int end = data.indexOf(gs, start);
    if (end == -1) end = data.length;
    return data.substring(start, end);
  }

  String _extractGs1Serial(String rawScan) {
    if (rawScan.trim().isEmpty) return '';

    final data = _cleanRaw(rawScan);

    debugPrint("RAW SCAN: $rawScan");
    debugPrint("CLEAN DATA: $data");

    String gtin = '';
    String expiry = '';
    String batch = '';
    String serial = '';

    int i = 0;

    while (i < data.length) {
      if (data[i] == gs) {
        i++;
        continue;
      }

      // AI 01 = GTIN fixed 14 digits
      if (i + 2 <= data.length && data.substring(i, i + 2) == '01') {
        if (i + 16 <= data.length) {
          gtin = data.substring(i + 2, i + 16);
          i += 16;
          continue;
        } else {
          break;
        }
      }

      // AI 17 = Expiry fixed 6 digits
      if (i + 2 <= data.length && data.substring(i, i + 2) == '17') {
        if (i + 8 <= data.length) {
          expiry = data.substring(i + 2, i + 8);
          i += 8;
          continue;
        } else {
          break;
        }
      }

      // AI 21 = Serial variable length
      if (i + 2 <= data.length && data.substring(i, i + 2) == '21') {
        serial = _readVariableField(data, i + 2).trim();
        debugPrint("✅ GTIN: $gtin");
        debugPrint("✅ EXPIRY: $expiry");
        debugPrint("✅ BATCH: $batch");
        debugPrint("✅ SERIAL FOUND: $serial");
        return serial;
      }

      // AI 10 = Batch variable length
      if (i + 2 <= data.length && data.substring(i, i + 2) == '10') {
        batch = _readVariableField(data, i + 2).trim();

        int end = data.indexOf(gs, i + 2);
        if (end == -1) {
          i = data.length;
        } else {
          i = end + 1;
        }

        continue;
      }

      // AI 422 = Country fixed 3 digits
      if (i + 3 <= data.length && data.substring(i, i + 3) == '422') {
        if (i + 6 <= data.length) {
          final country = data.substring(i + 3, i + 6);
          debugPrint("✅ COUNTRY 422: $country");
          i += 6;
          continue;
        } else {
          break;
        }
      }

      // AI 00 = SSCC fixed 18 digits
      if (i + 2 <= data.length && data.substring(i, i + 2) == '00') {
        if (i + 20 <= data.length) {
          final sscc = data.substring(i + 2, i + 20);
          debugPrint("📦 SSCC detected, ignored: $sscc");
          i += 20;
          continue;
        } else {
          break;
        }
      }

      i++;
    }

    debugPrint("❌ No AI 21 Serial found");
    debugPrint("GTIN: $gtin | EXPIRY: $expiry | BATCH: $batch");

    return '';
  }

  void _handleBarcode(String rawValue) {
    final now = DateTime.now();

    if (_lastScanTime != null &&
        now.difference(_lastScanTime!).inMilliseconds < 700) {
      return;
    }

    _lastScanTime = now;

    final serial = _extractGs1Serial(rawValue);

    if (serial.isEmpty) return;

    if (!_allSerials.contains(serial)) {
      setState(() {
        _newSerials.add(serial);
        _allSerials.add(serial);
      });

      debugPrint("✅ Added Serial: $serial");
      debugPrint("✅ All Serials: ${_allSerials.toList()}");
    } else {
      debugPrint("⚠️ Duplicate ignored: $serial");
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final allList = _allSerials.toList();
    final newList = _newSerials.toList();

    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Stack(
        children: [
          Positioned.fill(
            child: MobileScanner(
              controller: controller,
              onDetect: (BarcodeCapture capture) {
                for (final barcode in capture.barcodes) {
                  final rawValue = barcode.rawValue ?? '';
                  if (rawValue.isNotEmpty) {
                    _handleBarcode(rawValue);
                  }
                }
              },
            ),
          ),
          Positioned(
            top: 16,
            left: 16,
            right: 16,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.60),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                "Total: ${allList.length} | New: ${newList.length}",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            child: FloatingActionButton(
              heroTag: "cancel_btn",
              backgroundColor: Colors.red,
              onPressed: () async {
                await controller.stop();
                await widget.onCancel?.call();
              },
              child: const Icon(Icons.close, color: Colors.white),
            ),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: FloatingActionButton.extended(
              heroTag: "save_btn",
              backgroundColor: const Color(0xFFF3601F),
              onPressed: () async {
                await controller.stop();
                await widget.onSave?.call(_allSerials.toList());
              },
              icon: const Icon(Icons.save, color: Colors.white),
              label: Text(
                "Save (${allList.length})",
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
