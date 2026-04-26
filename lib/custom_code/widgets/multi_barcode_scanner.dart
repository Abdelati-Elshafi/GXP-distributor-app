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
  final List<String> initialCodes;

  /// يرجع Serials فقط
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
    formats: [BarcodeFormat.all],
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
      setState(() {});
    }
  }

  String _extractGs1Serial(String rawScan) {
    if (rawScan.trim().isEmpty) return '';

    String data = rawScan.trim();

    debugPrint("RAW SCAN: $data");

    // Remove GS1 DataMatrix prefix if exists
    if (data.startsWith(']C1')) {
      data = data.substring(3);
    }

    // Normalize GS / FNC1
    data = data
        .replaceAll('<GS>', String.fromCharCode(29))
        .replaceAll('[GS]', String.fromCharCode(29))
        .replaceAll('{GS}', String.fromCharCode(29))
        .replaceAll(r'\u001D', String.fromCharCode(29))
        .replaceAll('\\u001D', String.fromCharCode(29));

    debugPrint("CLEAN DATA: $data");

    final gs = String.fromCharCode(29);

    // Best case: find AI 21 directly
    final index21 = data.indexOf('21');

    if (index21 == -1) {
      debugPrint("❌ AI 21 not found");
      return '';
    }

    int start = index21 + 2;
    int end = data.length;

    // Serial ends at GS separator if found
    final gsIndex = data.indexOf(gs, start);
    if (gsIndex != -1) {
      end = gsIndex;
    }

    String serial = data.substring(start, end).trim();

    // Safety clean if another known AI appears after serial
    final knownAIs = ['01', '17', '10', '11', '15', '30', '37'];
    for (final ai in knownAIs) {
      final idx = serial.indexOf(ai);
      if (idx > 0) {
        // سيبه زي ما هو غالبًا لأن السيريال ممكن يحتوي أرقام شبه AI
        // مش هنقصه إلا لو محتاجين بعد التجربة
      }
    }

    debugPrint("✅ SERIAL FOUND: $serial");

    return serial;
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
                bool updated = false;

                for (final barcode in capture.barcodes) {
                  final rawValue = barcode.rawValue ?? '';
                  final serial = _extractGs1Serial(rawValue);

                  if (serial.isNotEmpty && !_allCodes.contains(serial)) {
                    _scannedCodes.add(serial);
                    _allCodes.add(serial);
                    updated = true;

                    debugPrint("✅ Serial added: $serial");
                  }
                }

                if (updated && mounted) {
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
              onPressed: () async {
                await widget.onCancel();
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
                await widget.onSave(_allCodes);
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
