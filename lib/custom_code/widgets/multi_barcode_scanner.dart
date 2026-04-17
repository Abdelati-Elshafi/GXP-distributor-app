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

import 'package:mobile_scanner/mobile_scanner.dart';

class MultiBarcodeScanner extends StatefulWidget {
  const MultiBarcodeScanner({
    Key? key,
    this.width,
    this.height,
    this.initialCodes = const [], // 👈 non-nullable
    required this.onSave,
    required this.onCancel,
  }) : super(key: key);

  final double? width;
  final double? height;

  /// الأكواد اللي جاية من FlutterFlow (لازم تبقى List of Text مش Nullable)
  final List<String> initialCodes;

  /// Action: لما تدوس Save
  final Future<void> Function(List<String> codes) onSave;

  /// Action: لما تدوس Cancel
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

  /// الأكواد الجديدة بس
  late List<String> _scannedCodes;

  /// الأكواد الكاملة (initial + new)
  late List<String> _allCodes;

  @override
  void initState() {
    super.initState();

    _scannedCodes = [];
    _allCodes = List<String>.from(widget.initialCodes);

    debugPrint("✅ initialCodes (init): ${widget.initialCodes}");
  }

  /// لو الـ initialCodes اتغيرت من FlutterFlow
  @override
  void didUpdateWidget(covariant MultiBarcodeScanner oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.initialCodes != oldWidget.initialCodes) {
      // اعمل Sync مع القيم الجديدة
      _allCodes = List<String>.from(widget.initialCodes)..addAll(_scannedCodes);

      debugPrint("🔄 initialCodes updated: ${widget.initialCodes}");
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // الكاميرا
        Positioned.fill(
          child: MobileScanner(
            controller: controller,
            onDetect: (BarcodeCapture capture) {
              final barcodes = capture.barcodes;
              bool updated = false;

              for (var barcode in barcodes) {
                final value = barcode.rawValue ?? "";
                // شرط: يكون مش فاضي + مش موجود في allCodes
                if (value.isNotEmpty && !_allCodes.contains(value)) {
                  _scannedCodes.add(value); // جديد
                  _allCodes.add(value); // ضيفه في الكل
                  updated = true;
                }
              }

              if (updated) {
                setState(() {});
              }
            },
          ),
        ),

        // زرار Cancel - أحمر
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

        // زرار Save - برتقالي #F3601F
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
              "Save (${_allCodes.length} | New: ${_scannedCodes.length})",
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
