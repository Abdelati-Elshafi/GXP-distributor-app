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
    required this.onSave,
    required this.onCancel,
  }) : super(key: key);

  final double? width;
  final double? height;

  /// Serials القديمة اللي جاية من FlutterFlow
  final List<String> initialCodes;

  /// بيرجع Serials فقط
  final Future<void> Function(List<String> codes) onSave;

  final Future<void> Function() onCancel;

  @override
  State<MultiBarcodeScanner> createState() => _MultiBarcodeScannerState();
}

class _MultiBarcodeScannerState extends State<MultiBarcodeScanner> {
  final MobileScannerController controller = MobileScannerController(
    facing: CameraFacing.back,
    detectionSpeed: DetectionSpeed.normal,
    returnImage: false,
    formats: [BarcodeFormat.dataMatrix],
  );

  late List<String> _scannedCodes;
  late List<String> _allCodes;

  @override
  void initState() {
    super.initState();

    _scannedCodes = [];
    _allCodes = List<String>.from(widget.initialCodes);

    debugPrint("✅ initial serials: ${widget.initialCodes}");
  }

  @override
  void didUpdateWidget(covariant MultiBarcodeScanner oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.initialCodes != oldWidget.initialCodes) {
      _allCodes = List<String>.from(widget.initialCodes)..addAll(_scannedCodes);
      debugPrint("🔄 initial serials updated: ${widget.initialCodes}");
      setState(() {});
    }
  }

  String _extractGs1Serial(String rawScan) {
    if (rawScan.trim().isEmpty) return '';

    String data = rawScan.trim();

    // يقبل GS1 DataMatrix فقط
    if (!data.startsWith(']C1')) {
      return '';
    }

    // Remove ]C1 prefix
    data = data.substring(3);

    // Normalize GS / FNC1 separators
    data = data
        .replaceAll('<GS>', String.fromCharCode(29))
        .replaceAll('[GS]', String.fromCharCode(29))
        .replaceAll('{GS}', String.fromCharCode(29))
        .replaceAll(r'\u001D', String.fromCharCode(29));

    int i = 0;

    while (i < data.length) {
      if (data.codeUnitAt(i) == 29) {
        i++;
        continue;
      }

      if (i + 2 > data.length) break;

      final ai = data.substring(i, i + 2);

      // AI 01 = GTIN fixed 14 digits
      if (ai == '01') {
        if (i + 16 <= data.length) {
          i += 16;
          continue;
        } else {
          break;
        }
      }

      // AI 17 = Expiry fixed 6 digits
      if (ai == '17') {
        if (i + 8 <= data.length) {
          i += 8;
          continue;
        } else {
          break;
        }
      }

      // AI 10 = Batch variable length
      if (ai == '10') {
        i += 2;
        while (i < data.length && data.codeUnitAt(i) != 29) {
          i++;
        }
        continue;
      }

      // AI 21 = Serial variable length
      if (ai == '21') {
        i += 2;
        final start = i;

        while (i < data.length && data.codeUnitAt(i) != 29) {
          i++;
        }

        return data.substring(start, i).trim();
      }

      i++;
    }

    return '';
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Stack(
        children: [
          Positioned.fill(
            child: MobileScanner(
              controller: controller,
              onDetect: (BarcodeCapture capture) {
                final barcodes = capture.barcodes;
                bool updated = false;

                for (var barcode in barcodes) {
                  final rawValue = barcode.rawValue ?? '';
                  final serial = _extractGs1Serial(rawValue);

                  if (serial.isNotEmpty && !_allCodes.contains(serial)) {
                    _scannedCodes.add(serial);
                    _allCodes.add(serial);
                    updated = true;

                    debugPrint("✅ Serial added: $serial");
                  }
                }

                if (updated) {
                  setState(() {});
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
                color: Colors.black.withOpacity(0.55),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                "Total Serials: ${_allCodes.length} | New: ${_scannedCodes.length}",
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
              onPressed: () {
                widget.onCancel();
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
              onPressed: () {
                widget.onSave(_allCodes);
              },
              icon: const Icon(Icons.save, color: Colors.white),
              label: Text(
                "Save (${_allCodes.length})",
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
