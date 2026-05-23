import '/backend/api_requests/api_calls.dart';
import '/components/empty_list_view_display/empty_list_view_display_widget.dart';
import '/components/loading/loading_widget.dart';
import '/components/scan_button/scan_button_widget.dart';
import '/components/text_field_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'decommission_widget.dart' show DecommissionWidget;
import 'package:flutter/material.dart';

class DecommissionModel extends FlutterFlowModel<DecommissionWidget> {
  ///  Local state fields for this page.

  List<String> scannedSerialToDecommission = [];
  void addToScannedSerialToDecommission(String item) =>
      scannedSerialToDecommission.add(item);
  void removeFromScannedSerialToDecommission(String item) =>
      scannedSerialToDecommission.remove(item);
  void removeAtIndexFromScannedSerialToDecommission(int index) =>
      scannedSerialToDecommission.removeAt(index);
  void insertAtIndexInScannedSerialToDecommission(int index, String item) =>
      scannedSerialToDecommission.insert(index, item);
  void updateScannedSerialToDecommissionAtIndex(
          int index, Function(String) updateFn) =>
      scannedSerialToDecommission[index] =
          updateFn(scannedSerialToDecommission[index]);

  bool loading = false;

  ///  State fields for stateful widgets in this page.

  // Model for TextField component.
  late TextFieldModel textFieldModel;
  // Stores action output result for [Custom Action - checkStringInList] action in TextField widget.
  bool? alreadyScanned;
  // Stores action output result for [Backend Call - API (CheckSerialStatus)] action in TextField widget.
  ApiCallResponse? checkSerialStatusApiResult;
  // Model for ScanButton component.
  late ScanButtonModel scanButtonModel;
  var scannedcode = '';
  // Model for EmptyListViewDisplay component.
  late EmptyListViewDisplayModel emptyListViewDisplayModel;
  // Model for Loading component.
  late LoadingModel loadingModel;
  // Stores action output result for [Backend Call - API (UpdateSerialStatus)] action in ConfirmColumn widget.
  ApiCallResponse? updateSerialStatusApiResult;

  @override
  void initState(BuildContext context) {
    textFieldModel = createModel(context, () => TextFieldModel());
    scanButtonModel = createModel(context, () => ScanButtonModel());
    emptyListViewDisplayModel =
        createModel(context, () => EmptyListViewDisplayModel());
    loadingModel = createModel(context, () => LoadingModel());
  }

  @override
  void dispose() {
    textFieldModel.dispose();
    scanButtonModel.dispose();
    emptyListViewDisplayModel.dispose();
    loadingModel.dispose();
  }
}
