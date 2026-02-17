import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'scan_button_model.dart';
export 'scan_button_model.dart';

class ScanButtonWidget extends StatefulWidget {
  const ScanButtonWidget({super.key});

  @override
  State<ScanButtonWidget> createState() => _ScanButtonWidgetState();
}

class _ScanButtonWidgetState extends State<ScanButtonWidget> {
  late ScanButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScanButtonModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.0,
      height: 50.0,
      decoration: BoxDecoration(
        color: Color(0xFFF3601F),
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.qr_code_scanner,
        color: FlutterFlowTheme.of(context).primaryText,
        size: 24.0,
      ),
    );
  }
}
