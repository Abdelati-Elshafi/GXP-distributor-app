import '/flutter_flow/flutter_flow_util.dart';
import 'text_field_widget.dart' show TextFieldWidget;
import 'package:flutter/material.dart';

class TextFieldModel extends FlutterFlowModel<TextFieldWidget> {
  ///  Local state fields for this component.

  bool looping = true;

  ///  State fields for stateful widgets in this component.

  // State field(s) for EnterSSCC widget.
  FocusNode? enterSSCCFocusNode;
  TextEditingController? enterSSCCTextController;
  String? Function(BuildContext, String?)? enterSSCCTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    enterSSCCFocusNode?.dispose();
    enterSSCCTextController?.dispose();
  }
}
