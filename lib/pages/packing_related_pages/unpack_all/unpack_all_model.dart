import '/flutter_flow/flutter_flow_util.dart';
import 'unpack_all_widget.dart' show UnpackAllWidget;
import 'package:flutter/material.dart';

class UnpackAllModel extends FlutterFlowModel<UnpackAllWidget> {
  ///  Local state fields for this page.

  String? scannedSSCC = '####';

  ///  State fields for stateful widgets in this page.

  // State field(s) for ssccManual widget.
  FocusNode? ssccManualFocusNode;
  TextEditingController? ssccManualTextController;
  String? Function(BuildContext, String?)? ssccManualTextControllerValidator;
  var scannedCode = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    ssccManualFocusNode?.dispose();
    ssccManualTextController?.dispose();
  }
}
