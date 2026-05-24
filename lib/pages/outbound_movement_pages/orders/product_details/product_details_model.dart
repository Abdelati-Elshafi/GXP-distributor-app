import '/backend/api_requests/api_calls.dart';
import '/components/loading/loading_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'product_details_widget.dart' show ProductDetailsWidget;
import 'package:flutter/material.dart';

class ProductDetailsModel extends FlutterFlowModel<ProductDetailsWidget> {
  ///  Local state fields for this page.

  List<String> orderProductserials = [];
  void addToOrderProductserials(String item) => orderProductserials.add(item);
  void removeFromOrderProductserials(String item) =>
      orderProductserials.remove(item);
  void removeAtIndexFromOrderProductserials(int index) =>
      orderProductserials.removeAt(index);
  void insertAtIndexInOrderProductserials(int index, String item) =>
      orderProductserials.insert(index, item);
  void updateOrderProductserialsAtIndex(int index, Function(String) updateFn) =>
      orderProductserials[index] = updateFn(orderProductserials[index]);

  bool loading = false;

  bool looping = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (ProductSerialsDetails)] action in ProductDetails widget.
  ApiCallResponse? productSerialsDetailsApiResult;
  // Stores action output result for [Custom Action - parseStrictSscc] action in ProductDetails widget.
  dynamic parseSSCCData;
  // Stores action output result for [Custom Action - parseGs1Scan] action in ProductDetails widget.
  dynamic gS1ParsedData;
  // Stores action output result for [Backend Call - API (UpdateOrderProductsSerials)] action in ConfirmButton widget.
  ApiCallResponse? updateOrderProductsSerialsResut;
  var scannedcode = '';
  // Model for Loading component.
  late LoadingModel loadingModel;

  @override
  void initState(BuildContext context) {
    loadingModel = createModel(context, () => LoadingModel());
  }

  @override
  void dispose() {
    loadingModel.dispose();
  }

  /// Action blocks.
  Future checkSerialStatus(
    BuildContext context, {
    String? serial,
    List<String>? scannedSerialList,
  }) async {
    bool? alreadyScanned;
    ApiCallResponse? checkSerialStatusApiResult;

    loading = true;
    alreadyScanned = await actions.checkStringInList(
      serial!,
      scannedSerialList!.toList(),
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
      checkSerialStatusApiResult =
          await SerialStatusUpdateGroup.checkSerialStatusCall.call(
        serial: serial,
      );

      if ((checkSerialStatusApiResult.succeeded ?? true)) {
        addToOrderProductserials(serial);
      } else {
        await action_blocks.serverConnectionFail(context);
      }
    }

    loading = false;
  }
}
