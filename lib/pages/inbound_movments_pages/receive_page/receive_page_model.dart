import '/components/empty_list_view_display/empty_list_view_display_widget.dart';
import '/components/scan_button/scan_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'receive_page_widget.dart' show ReceivePageWidget;
import 'package:flutter/material.dart';

class ReceivePageModel extends FlutterFlowModel<ReceivePageWidget> {
  ///  Local state fields for this page.

  List<String> scannedSSCC = [];
  void addToScannedSSCC(String item) => scannedSSCC.add(item);
  void removeFromScannedSSCC(String item) => scannedSSCC.remove(item);
  void removeAtIndexFromScannedSSCC(int index) => scannedSSCC.removeAt(index);
  void insertAtIndexInScannedSSCC(int index, String item) =>
      scannedSSCC.insert(index, item);
  void updateScannedSSCCAtIndex(int index, Function(String) updateFn) =>
      scannedSSCC[index] = updateFn(scannedSSCC[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for EnterSSCC widget.
  FocusNode? enterSSCCFocusNode;
  TextEditingController? enterSSCCTextController;
  String? Function(BuildContext, String?)? enterSSCCTextControllerValidator;
  // Model for ScanButton component.
  late ScanButtonModel scanButtonModel;
  var scannedSSCCAction = '';
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
