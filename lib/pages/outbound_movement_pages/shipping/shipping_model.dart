import '/components/product_details_card/product_details_card_widget.dart';
import '/components/scan_button/scan_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'shipping_widget.dart' show ShippingWidget;
import 'package:flutter/material.dart';

class ShippingModel extends FlutterFlowModel<ShippingWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for EnterSSCC widget.
  FocusNode? enterSSCCFocusNode;
  TextEditingController? enterSSCCTextController;
  String? Function(BuildContext, String?)? enterSSCCTextControllerValidator;
  // Model for ScanButton component.
  late ScanButtonModel scanButtonModel;
  // Model for ProductDetailsCard component.
  late ProductDetailsCardModel productDetailsCardModel;

  @override
  void initState(BuildContext context) {
    scanButtonModel = createModel(context, () => ScanButtonModel());
    productDetailsCardModel =
        createModel(context, () => ProductDetailsCardModel());
  }

  @override
  void dispose() {
    enterSSCCFocusNode?.dispose();
    enterSSCCTextController?.dispose();

    scanButtonModel.dispose();
    productDetailsCardModel.dispose();
  }
}
