import '/backend/api_requests/api_calls.dart';
import '/components/loading/loading_widget.dart';
import '/components/scan_button/scan_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'shipping_widget.dart' show ShippingWidget;
import 'package:flutter/material.dart';

class ShippingModel extends FlutterFlowModel<ShippingWidget> {
  ///  Local state fields for this page.

  bool loading = false;

  List<dynamic> orderProducts = [];
  void addToOrderProducts(dynamic item) => orderProducts.add(item);
  void removeFromOrderProducts(dynamic item) => orderProducts.remove(item);
  void removeAtIndexFromOrderProducts(int index) =>
      orderProducts.removeAt(index);
  void insertAtIndexInOrderProducts(int index, dynamic item) =>
      orderProducts.insert(index, item);
  void updateOrderProductsAtIndex(int index, Function(dynamic) updateFn) =>
      orderProducts[index] = updateFn(orderProducts[index]);

  List<String> ordersNO = [];
  void addToOrdersNO(String item) => ordersNO.add(item);
  void removeFromOrdersNO(String item) => ordersNO.remove(item);
  void removeAtIndexFromOrdersNO(int index) => ordersNO.removeAt(index);
  void insertAtIndexInOrdersNO(int index, String item) =>
      ordersNO.insert(index, item);
  void updateOrdersNOAtIndex(int index, Function(String) updateFn) =>
      ordersNO[index] = updateFn(ordersNO[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (GetOrderByUser)] action in Shipping widget.
  ApiCallResponse? getOrderByUser;
  // State field(s) for OrdersDropDown widget.
  String? ordersDropDownValue;
  FormFieldController<String>? ordersDropDownValueController;
  // State field(s) for EnterSSCC widget.
  FocusNode? enterSSCCFocusNode;
  TextEditingController? enterSSCCTextController;
  String? Function(BuildContext, String?)? enterSSCCTextControllerValidator;
  // Model for ScanButton component.
  late ScanButtonModel scanButtonModel;
  // Stores action output result for [Backend Call - API (Confirm Shipment)] action in Button widget.
  ApiCallResponse? confirmShipment;
  // Model for Loading component.
  late LoadingModel loadingModel;

  @override
  void initState(BuildContext context) {
    scanButtonModel = createModel(context, () => ScanButtonModel());
    loadingModel = createModel(context, () => LoadingModel());
  }

  @override
  void dispose() {
    enterSSCCFocusNode?.dispose();
    enterSSCCTextController?.dispose();

    scanButtonModel.dispose();
    loadingModel.dispose();
  }

  /// Action blocks.
  Future getOrderDetalis(
    BuildContext context, {
    String? orderNo,
  }) async {
    ApiCallResponse? orderrespnse;

    loading = true;
    orderrespnse = await OrdersAPIsGroup.getOrderDetailsCall.call(
      orderNO: orderNo,
    );

    if ((orderrespnse.succeeded ?? true)) {
      loading = false;
    } else {
      loading = false;
    }

    loading = false;
  }
}
