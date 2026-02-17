import '/components/empty_list_view_display/empty_list_view_display_widget.dart';
import '/components/scan_button/scan_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
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

  ///  State fields for stateful widgets in this page.

  // State field(s) for EnterSSCC widget.
  FocusNode? enterSSCCFocusNode;
  TextEditingController? enterSSCCTextController;
  String? Function(BuildContext, String?)? enterSSCCTextControllerValidator;
  // Model for ScanButton component.
  late ScanButtonModel scanButtonModel;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Model for EmptyListViewDisplay component.
  late EmptyListViewDisplayModel emptyListViewDisplayModel;

  @override
  void initState(BuildContext context) {
    scanButtonModel = createModel(context, () => ScanButtonModel());
    emptyListViewDisplayModel =
        createModel(context, () => EmptyListViewDisplayModel());
  }

  @override
  void dispose() {
    enterSSCCFocusNode?.dispose();
    enterSSCCTextController?.dispose();

    scanButtonModel.dispose();
    emptyListViewDisplayModel.dispose();
  }
}
