import '/backend/api_requests/api_calls.dart';
import '/components/empty_list_view_display/empty_list_view_display_widget.dart';
import '/components/loading/loading_widget.dart';
import '/components/scan_button/scan_button_widget.dart';
import '/components/text_field_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import 'sample_decommission_widget.dart' show SampleDecommissionWidget;
import 'package:flutter/material.dart';

class SampleDecommissionModel
    extends FlutterFlowModel<SampleDecommissionWidget> {
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

  bool loadingIsVisable = false;

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
  // State field(s) for ReasonDropDown widget.
  String? reasonDropDownValue;
  FormFieldController<String>? reasonDropDownValueController;
  // Model for EmptyListViewDisplay component.
  late EmptyListViewDisplayModel emptyListViewDisplayModel;
  // Stores action output result for [Backend Call - API (UpdateSerialStatus)] action in ConfirmButton widget.
  ApiCallResponse? updateSerialStatusApiResult;
  // Model for Loading component.
  late LoadingModel loadingModel;

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

  /// Action blocks.
  Future getSerialStatus(
    BuildContext context, {
    required String? serial,
  }) async {
    bool? alreadyScanned;
    ApiCallResponse? checkSerialStatusApiResult;

    loadingIsVisable = true;
    alreadyScanned = await actions.checkStringInList(
      serial!,
      scannedSerialToDecommission.toList(),
    );
    if (alreadyScanned) {
      var confirmDialogResponse = await showDialog<bool>(
            context: context,
            builder: (alertDialogContext) {
              return AlertDialog(
                content: Text('Already Scanned'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext, false),
                    child: Text('cancel'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext, true),
                    child: Text('Confirm'),
                  ),
                ],
              );
            },
          ) ??
          false;
    } else {
      checkSerialStatusApiResult =
          await SerialStatusUpdateGroup.checkSerialStatusCall.call(
        serial: serial,
      );

      if ((checkSerialStatusApiResult.succeeded ?? true)) {
        addToScannedSerialToDecommission(serial);
      } else {
        await action_blocks.serverConnectionFail(context);
      }
    }

    loadingIsVisable = false;
  }
}
