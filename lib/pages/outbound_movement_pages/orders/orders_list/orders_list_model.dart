import '/backend/api_requests/api_calls.dart';
import '/components/loading/loading_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'orders_list_widget.dart' show OrdersListWidget;
import 'package:flutter/material.dart';

class OrdersListModel extends FlutterFlowModel<OrdersListWidget> {
  ///  Local state fields for this page.

  List<dynamic> ordersData = [];
  void addToOrdersData(dynamic item) => ordersData.add(item);
  void removeFromOrdersData(dynamic item) => ordersData.remove(item);
  void removeAtIndexFromOrdersData(int index) => ordersData.removeAt(index);
  void insertAtIndexInOrdersData(int index, dynamic item) =>
      ordersData.insert(index, item);
  void updateOrdersDataAtIndex(int index, Function(dynamic) updateFn) =>
      ordersData[index] = updateFn(ordersData[index]);

  bool loading = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (GetOrderByUser)] action in OrdersList widget.
  ApiCallResponse? getOrdersApiResults;
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
