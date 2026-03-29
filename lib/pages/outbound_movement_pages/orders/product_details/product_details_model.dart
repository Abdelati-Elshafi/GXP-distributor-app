import '/backend/api_requests/api_calls.dart';
import '/components/loading/loading_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'product_details_widget.dart' show ProductDetailsWidget;
import 'package:flutter/material.dart';

class ProductDetailsModel extends FlutterFlowModel<ProductDetailsWidget> {
  ///  Local state fields for this page.

  List<dynamic> serialsdata = [];
  void addToSerialsdata(dynamic item) => serialsdata.add(item);
  void removeFromSerialsdata(dynamic item) => serialsdata.remove(item);
  void removeAtIndexFromSerialsdata(int index) => serialsdata.removeAt(index);
  void insertAtIndexInSerialsdata(int index, dynamic item) =>
      serialsdata.insert(index, item);
  void updateSerialsdataAtIndex(int index, Function(dynamic) updateFn) =>
      serialsdata[index] = updateFn(serialsdata[index]);

  bool loading = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (ProductSerialsDetails)] action in ProductDetails widget.
  ApiCallResponse? productSerialsDetailsApiResult;
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
