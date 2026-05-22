import '/backend/api_requests/api_calls.dart';
import '/components/empty_list_view_display/empty_list_view_display_widget.dart';
import '/components/loading/loading_widget.dart';
import '/components/scan_button/scan_button_widget.dart';
import '/components/text_field_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'receive_page_widget.dart' show ReceivePageWidget;
import 'package:flutter/material.dart';

class ReceivePageModel extends FlutterFlowModel<ReceivePageWidget> {
  ///  Local state fields for this page.

  List<String> scannedSSCC = [];
  void addToScannedSSCC(String item) => scannedSSCC.add(item);
  void removeFromScannedSSCC(String item) => scannedSSCC.remove(item);
  void removeAtIndexFromScannedSSCC(int index) => scannedSSCC.removeAt(index);
  void insertAtIndexInScannedSSCC(int index, String item) =>
      scannedSSCC.insert(index, item);
  void updateScannedSSCCAtIndex(int index, Function(String) updateFn) =>
      scannedSSCC[index] = updateFn(scannedSSCC[index]);

  bool loading = false;

  ///  State fields for stateful widgets in this page.

  // Model for TextField component.
  late TextFieldModel textFieldModel;
  // Model for ScanButton component.
  late ScanButtonModel scanButtonModel;
  var scannedSSCCAction = '';
  // Model for EmptyListViewDisplay component.
  late EmptyListViewDisplayModel emptyListViewDisplayModel;
  // Stores action output result for [Backend Call - API (Receiving Shipment)] action in ConfirmReceive widget.
  ApiCallResponse? receivingShipmentApiResult;
  // Stores action output result for [Backend Call - API (Receiving Shipment)] action in ReturnRecive widget.
  ApiCallResponse? returnReceivingShipmentApiResult;
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
  Future checkSerialStatus(
    BuildContext context, {
    required String? serial,
    bool? fromscanner,
  }) async {
    dynamic parseSSCCData;
    bool? alreadyScanned;
    ApiCallResponse? checkSerialStatus;

    loading = true;
    parseSSCCData = await actions.parseStrictSscc(
      serial,
    );
    if (getJsonField(
      parseSSCCData,
      r'''$.success''',
    )) {
      alreadyScanned = await actions.checkStringInList(
        getJsonField(
          parseSSCCData,
          r'''$.sscc''',
        ).toString(),
        scannedSSCC.toList(),
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
                      child: Text('Cancel'),
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
        checkSerialStatus =
            await SerialStatusUpdateGroup.checkSerialStatusCall.call(
          serial: getJsonField(
            parseSSCCData,
            r'''$.sscc''',
          ).toString(),
        );

        if ((checkSerialStatus.succeeded ?? true)) {
          addToScannedSSCC(getJsonField(
            parseSSCCData,
            r'''$.sscc''',
          ).toString());
        }
      }
    } else {
      var confirmDialogResponse = await showDialog<bool>(
            context: context,
            builder: (alertDialogContext) {
              return AlertDialog(
                title: Text('SSCC'),
                content: Text('Not GS1 SSCC'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext, false),
                    child: Text('Cancel'),
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
    }

    loading = false;
  }
}
