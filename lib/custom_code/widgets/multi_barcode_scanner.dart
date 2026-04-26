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

  /// القديمة
  final List<String> initialCodes;

  /// FlutterFlow Action
  final Future<dynamic> Function(List<String> codes)? onSave;

  /// FlutterFlow Action
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

    if (mounted) {
      setState(() {});
    }
  }

  String _extractGs1Serial(String rawScan) {
    if (rawScan.trim().isEmpty) return '';

    String data = rawScan.trim();

    debugPrint("RAW SCAN: $data");

    // remove ]C1
    if (data.startsWith(']C1')) {
      data = data.substring(3);
    }

    // remove leading D if scanner adds it
    if (data.startsWith('D01')) {
      data = data.substring(1);
    }

    // normalize GS
    data = data
        .replaceAll('<GS>', String.fromCharCode(29))
        .replaceAll('[GS]', String.fromCharCode(29))
        .replaceAll('{GS}', String.fromCharCode(29))
        .replaceAll(r'\u001D', String.fromCharCode(29))
        .replaceAll('\\u001D', String.fromCharCode(29));

    debugPrint("CLEAN DATA: $data");

    // get last AI 21
    final ai21 = data.lastIndexOf('21');

    if (ai21 == -1) {
      debugPrint("❌ AI 21 not found");
      return '';
    }

    String serial = data.substring(ai21 + 2).trim();

    // stop at GS if exists
    final gs = serial.indexOf(String.fromCharCode(29));
    if (gs != -1) {
      serial = serial.substring(0, gs).trim();
    }

    // remove extra D
    if (serial.startsWith('D') && serial.length > 1) {
      serial = serial.substring(1);
    }

    debugPrint("✅ SERIAL FOUND: $serial");

    return serial;
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

      debugPrint("✅ Added: $serial");
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
                color: Colors.black.withOpacity(0.6),
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
