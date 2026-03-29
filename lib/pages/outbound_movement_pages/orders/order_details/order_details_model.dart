import '/backend/api_requests/api_calls.dart';
import '/components/loading/loading_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'order_details_widget.dart' show OrderDetailsWidget;
import 'package:flutter/material.dart';

class OrderDetailsModel extends FlutterFlowModel<OrderDetailsWidget> {
  ///  Local state fields for this page.

  bool loading = false;

  List<dynamic> products = [];
  void addToProducts(dynamic item) => products.add(item);
  void removeFromProducts(dynamic item) => products.remove(item);
  void removeAtIndexFromProducts(int index) => products.removeAt(index);
  void insertAtIndexInProducts(int index, dynamic item) =>
      products.insert(index, item);
  void updateProductsAtIndex(int index, Function(dynamic) updateFn) =>
      products[index] = updateFn(products[index]);

  String? customer;

  String? orderno;

  String? sscc;

  String? gln;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (GetOrderDetails)] action in OrderDetails widget.
  ApiCallResponse? orderdetails;
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
}
