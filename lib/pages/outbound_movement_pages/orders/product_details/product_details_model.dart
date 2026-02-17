import '/components/s_s_c_c_details_card/s_s_c_c_details_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'product_details_widget.dart' show ProductDetailsWidget;
import 'package:flutter/material.dart';

class ProductDetailsModel extends FlutterFlowModel<ProductDetailsWidget> {
  ///  Local state fields for this page.

  List<int> serialsdata = [55, 2];
  void addToSerialsdata(int item) => serialsdata.add(item);
  void removeFromSerialsdata(int item) => serialsdata.remove(item);
  void removeAtIndexFromSerialsdata(int index) => serialsdata.removeAt(index);
  void insertAtIndexInSerialsdata(int index, int item) =>
      serialsdata.insert(index, item);
  void updateSerialsdataAtIndex(int index, Function(int) updateFn) =>
      serialsdata[index] = updateFn(serialsdata[index]);

  int test = 0;

  ///  State fields for stateful widgets in this page.

  // Model for SSCCDetailsCard component.
  late SSCCDetailsCardModel sSCCDetailsCardModel;

  @override
  void initState(BuildContext context) {
    sSCCDetailsCardModel = createModel(context, () => SSCCDetailsCardModel());
  }

  @override
  void dispose() {
    sSCCDetailsCardModel.dispose();
  }
}
