import '/components/product_details_card/product_details_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'order_details_widget.dart' show OrderDetailsWidget;
import 'package:flutter/material.dart';

class OrderDetailsModel extends FlutterFlowModel<OrderDetailsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for ProductDetailsCard component.
  late ProductDetailsCardModel productDetailsCardModel;

  @override
  void initState(BuildContext context) {
    productDetailsCardModel =
        createModel(context, () => ProductDetailsCardModel());
  }

  @override
  void dispose() {
    productDetailsCardModel.dispose();
  }
}
