import '/components/bottom_bar/bottom_bar_widget.dart';
import '/components/side_bar/side_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'main_widget.dart' show MainWidget;
import 'package:flutter/material.dart';

class MainModel extends FlutterFlowModel<MainWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for BottomBar component.
  late BottomBarModel bottomBarModel;
  // Model for SideBar component.
  late SideBarModel sideBarModel;

  @override
  void initState(BuildContext context) {
    bottomBarModel = createModel(context, () => BottomBarModel());
    sideBarModel = createModel(context, () => SideBarModel());
  }

  @override
  void dispose() {
    bottomBarModel.dispose();
    sideBarModel.dispose();
  }
}
