import '/components/empty_list_view_display/empty_list_view_display_widget.dart';
import '/components/scan_button/scan_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'decommission_widget.dart' show DecommissionWidget;
import 'package:flutter/material.dart';

class DecommissionModel extends FlutterFlowModel<DecommissionWidget> {
  ///  Local state fields for this page.

  List<String> scannedSerialToDecommission = ['11'];
  void addToScannedSerialToDecommission(String item) =>
      scannedSerialToDecommission.add(item);
  void removeFromScannedSerialToDecommission(String item) =>
      scannedSerialToDecommission.remove(item);
  void removeAtIndexFromScannedSerialToDecommission(int index) =>
      scannedSerialToDecommission.removeAt(index);
  void insertAtIndexInScannedSerialToDecommission(int index, String item) =>
      scannedSerialToDecommission.insert(index, item);
  void updateScannedSerialToDecommissionAtIndex(
          int index, Function(String) updateFn) =>
      scannedSerialToDecommission[index] =
          updateFn(scannedSerialToDecommission[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for EnterSSCC widget.
  FocusNode? enterSSCCFocusNode;
  TextEditingController? enterSSCCTextController;
  String? Function(BuildContext, String?)? enterSSCCTextControllerValidator;
  // Stores action output result for [Custom Action - checkStringInList] action in EnterSSCC widget.
  bool? alreadyScanned;
  // Model for ScanButton component.
  late ScanButtonModel scanButtonModel;
  var scannedcode = '';
  // Stores action output result for [Custom Action - checkStringInList] action in ScanButton widget.
  bool? alreadyScannedQr;
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
