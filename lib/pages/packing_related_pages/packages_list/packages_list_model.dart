import '/backend/api_requests/api_calls.dart';
import '/components/addnewsscc/addnewsscc_widget.dart';
import '/components/empty_list_view_display/empty_list_view_display_widget.dart';
import '/components/loading/loading_widget.dart';
import '/components/package_card/package_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'packages_list_widget.dart' show PackagesListWidget;
import 'package:flutter/material.dart';

class PackagesListModel extends FlutterFlowModel<PackagesListWidget> {
  ///  Local state fields for this page.

  List<dynamic> packages = [];
  void addToPackages(dynamic item) => packages.add(item);
  void removeFromPackages(dynamic item) => packages.remove(item);
  void removeAtIndexFromPackages(int index) => packages.removeAt(index);
  void insertAtIndexInPackages(int index, dynamic item) =>
      packages.insert(index, item);
  void updatePackagesAtIndex(int index, Function(dynamic) updateFn) =>
      packages[index] = updateFn(packages[index]);

  bool loading = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (GetPackedSSCCList)] action in PackagesList widget.
  ApiCallResponse? getPackedSSCCListApiResult;
  // Models for PackageCard dynamic component.
  late FlutterFlowDynamicModels<PackageCardModel> packageCardModels;
  // Model for addnewsscc component.
  late AddnewssccModel addnewssccModel;
  // Model for EmptyListViewDisplay component.
  late EmptyListViewDisplayModel emptyListViewDisplayModel;
  // Model for Loading component.
  late LoadingModel loadingModel;

  @override
  void initState(BuildContext context) {
    packageCardModels = FlutterFlowDynamicModels(() => PackageCardModel());
    addnewssccModel = createModel(context, () => AddnewssccModel());
    emptyListViewDisplayModel =
        createModel(context, () => EmptyListViewDisplayModel());
    loadingModel = createModel(context, () => LoadingModel());
  }

  @override
  void dispose() {
    packageCardModels.dispose();
    addnewssccModel.dispose();
    emptyListViewDisplayModel.dispose();
    loadingModel.dispose();
  }
}
