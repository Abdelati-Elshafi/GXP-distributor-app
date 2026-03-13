import '/backend/api_requests/api_calls.dart';
import '/components/empty_list_view_display/empty_list_view_display_widget.dart';
import '/components/scan_button/scan_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import 'sample_decommission_widget.dart' show SampleDecommissionWidget;
import 'package:flutter/material.dart';

class SampleDecommissionModel
    extends FlutterFlowModel<SampleDecommissionWidget> {
  ///  Local state fields for this page.

  List<String> scannedSerialToDecommission = ['k'];
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

  ///  State fields for stateful widgets in this page.

  // State field(s) for EnterSSCC widget.
  FocusNode? enterSSCCFocusNode;
  TextEditingController? enterSSCCTextController;
  String? Function(BuildContext, String?)? enterSSCCTextControllerValidator;
  // Model for ScanButton component.
  late ScanButtonModel scanButtonModel;
  var scannedcode = '';
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Model for EmptyListViewDisplay component.
  late EmptyListViewDisplayModel emptyListViewDisplayModel;

  @override
  void initState(BuildContext context) {
    scanButtonModel = createModel(context, () => ScanButtonModel());
    emptyListViewDisplayModel =
        createModel(context, () => EmptyListViewDisplayModel());
  }

  @override
  void dispose() {
    enterSSCCFocusNode?.dispose();
    enterSSCCTextController?.dispose();

    scanButtonModel.dispose();
    emptyListViewDisplayModel.dispose();
  }

  /// Action blocks.
  Future getSerialStatus(
    BuildContext context, {
    required String? serial,
  }) async {
    bool? alreadyScanned;
    ApiCallResponse? checkSerialStatusApiResult;

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
                    child: Text('adcscsd'),
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
      }
    }
  }
}
