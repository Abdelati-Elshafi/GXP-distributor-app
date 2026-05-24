import '/backend/api_requests/api_calls.dart';
import '/components/empty_list_view_display/empty_list_view_display_widget.dart';
import '/components/loading/loading_widget.dart';
import '/components/scan_button/scan_button_widget.dart';
import '/components/text_field_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import 'return_shipping_widget.dart' show ReturnShippingWidget;
import 'package:flutter/material.dart';

class ReturnShippingModel extends FlutterFlowModel<ReturnShippingWidget> {
  ///  Local state fields for this page.

  List<dynamic> products = [];
  void addToProducts(dynamic item) => products.add(item);
  void removeFromProducts(dynamic item) => products.remove(item);
  void removeAtIndexFromProducts(int index) => products.removeAt(index);
  void insertAtIndexInProducts(int index, dynamic item) =>
      products.insert(index, item);
  void updateProductsAtIndex(int index, Function(dynamic) updateFn) =>
      products[index] = updateFn(products[index]);

  String? scannedSSCC;

  bool loading = false;

  ///  State fields for stateful widgets in this page.

  // Model for TextField component.
  late TextFieldModel textFieldModel;
  // Stores action output result for [Backend Call - API (GetOrderDetails)] action in TextField widget.
  ApiCallResponse? getOrderDetails;
  // Model for ScanButton component.
  late ScanButtonModel scanButtonModel;
  var scannedCode = '';
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Model for EmptyListViewDisplay component.
  late EmptyListViewDisplayModel emptyListViewDisplayModel;
  // Model for Loading component.
  late LoadingModel loadingModel;
  // Stores action output result for [Backend Call - API (Confirm Shipment)] action in ReturnRecive widget.
  ApiCallResponse? confirmShipment;

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
  Future getSSCCOrderData(
    BuildContext context, {
    required String? serial,
  }) async {
    dynamic parseSSCCData;
    ApiCallResponse? getOrderDetails;

    loading = true;
    parseSSCCData = await actions.parseStrictSscc(
      serial,
    );
    if (getJsonField(
      parseSSCCData,
      r'''$.success''',
    )) {
      getOrderDetails = await OrdersAPIsGroup.getOrderDetailsCall.call(
        orderNO: getJsonField(
          parseSSCCData,
          r'''$.sscc''',
        ).toString(),
      );

      if ((getOrderDetails.succeeded ?? true)) {
        products = OrdersAPIsGroup.getOrderDetailsCall
            .productsData(
              (getOrderDetails.jsonBody ?? ''),
            )!
            .toList()
            .cast<dynamic>();
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
