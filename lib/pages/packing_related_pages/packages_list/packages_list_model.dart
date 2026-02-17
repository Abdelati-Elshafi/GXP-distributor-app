import '/components/addnewsscc/addnewsscc_widget.dart';
import '/components/empty_list_view_display/empty_list_view_display_widget.dart';
import '/components/package_card/package_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'packages_list_widget.dart' show PackagesListWidget;
import 'package:flutter/material.dart';

class PackagesListModel extends FlutterFlowModel<PackagesListWidget> {
  ///  Local state fields for this page.

  List<String> packages = [];
  void addToPackages(String item) => packages.add(item);
  void removeFromPackages(String item) => packages.remove(item);
  void removeAtIndexFromPackages(int index) => packages.removeAt(index);
  void insertAtIndexInPackages(int index, String item) =>
      packages.insert(index, item);
  void updatePackagesAtIndex(int index, Function(String) updateFn) =>
      packages[index] = updateFn(packages[index]);

  ///  State fields for stateful widgets in this page.

  // Models for PackageCard dynamic component.
  late FlutterFlowDynamicModels<PackageCardModel> packageCardModels;
  // Model for addnewsscc component.
  late AddnewssccModel addnewssccModel;
  // Model for EmptyListViewDisplay component.
  late EmptyListViewDisplayModel emptyListViewDisplayModel;

  @override
  void initState(BuildContext context) {
    packageCardModels = FlutterFlowDynamicModels(() => PackageCardModel());
    addnewssccModel = createModel(context, () => AddnewssccModel());
    emptyListViewDisplayModel =
        createModel(context, () => EmptyListViewDisplayModel());
  }

  @override
  void dispose() {
    packageCardModels.dispose();
    addnewssccModel.dispose();
    emptyListViewDisplayModel.dispose();
  }
}
