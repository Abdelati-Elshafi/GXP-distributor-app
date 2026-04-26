import '/components/empty_list_view_display/empty_list_view_display_widget.dart';
import '/components/package_card/package_card_widget.dart';
import '/components/serial_card/serial_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package_operation_widget.dart' show PackageOperationWidget;
import 'package:flutter/material.dart';

class PackageOperationModel extends FlutterFlowModel<PackageOperationWidget> {
  ///  Local state fields for this page.

  List<String> serialsList = [];
  void addToSerialsList(String item) => serialsList.add(item);
  void removeFromSerialsList(String item) => serialsList.remove(item);
  void removeAtIndexFromSerialsList(int index) => serialsList.removeAt(index);
  void insertAtIndexInSerialsList(int index, String item) =>
      serialsList.insert(index, item);
  void updateSerialsListAtIndex(int index, Function(String) updateFn) =>
      serialsList[index] = updateFn(serialsList[index]);

  ///  State fields for stateful widgets in this page.

  // Model for PackageCard component.
  late PackageCardModel packageCardModel;
  // Models for SerialCard dynamic component.
  late FlutterFlowDynamicModels<SerialCardModel> serialCardModels;
  // Model for EmptyListViewDisplay component.
  late EmptyListViewDisplayModel emptyListViewDisplayModel;

  @override
  void initState(BuildContext context) {
    packageCardModel = createModel(context, () => PackageCardModel());
    serialCardModels = FlutterFlowDynamicModels(() => SerialCardModel());
    emptyListViewDisplayModel =
        createModel(context, () => EmptyListViewDisplayModel());
  }

  @override
  void dispose() {
    packageCardModel.dispose();
    serialCardModels.dispose();
    emptyListViewDisplayModel.dispose();
  }
}
