import '/backend/api_requests/api_calls.dart';
import '/components/loading/loading_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'unpack_all_widget.dart' show UnpackAllWidget;
import 'package:flutter/material.dart';

class UnpackAllModel extends FlutterFlowModel<UnpackAllWidget> {
  ///  Local state fields for this page.

  String? scannedSSCC = '####';

  bool loading = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for ssccManual widget.
  FocusNode? ssccManualFocusNode;
  TextEditingController? ssccManualTextController;
  String? Function(BuildContext, String?)? ssccManualTextControllerValidator;
  var scannedCode = '';
  // Stores action output result for [Custom Action - parseGs1Scan] action in Button widget.
  dynamic parsedGs1Scan;
  // Model for Loading component.
  late LoadingModel loadingModel;

  @override
  void initState(BuildContext context) {
    loadingModel = createModel(context, () => LoadingModel());
  }

  @override
  void dispose() {
    ssccManualFocusNode?.dispose();
    ssccManualTextController?.dispose();

    loadingModel.dispose();
  }

  /// Action blocks.
  Future checkSerialStatus(
    BuildContext context, {
    required String? serial,
  }) async {
    ApiCallResponse? checkSerialStatusApiResult;

    loading = true;
    checkSerialStatusApiResult =
        await SerialStatusUpdateGroup.checkSerialStatusCall.call(
      serial: serial,
    );

    if ((checkSerialStatusApiResult.succeeded ?? true)) {
      scannedSSCC = serial;
    }
    loading = false;
  }
}
