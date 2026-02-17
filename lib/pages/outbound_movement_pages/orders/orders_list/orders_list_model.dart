import '/components/order_card/order_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'orders_list_widget.dart' show OrdersListWidget;
import 'package:flutter/material.dart';

class OrdersListModel extends FlutterFlowModel<OrdersListWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for OrderCard component.
  late OrderCardModel orderCardModel;

  @override
  void initState(BuildContext context) {
    orderCardModel = createModel(context, () => OrderCardModel());
  }

  @override
  void dispose() {
    orderCardModel.dispose();
  }
}
