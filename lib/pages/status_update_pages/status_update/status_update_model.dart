import '/components/side_bar/side_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'status_update_widget.dart' show StatusUpdateWidget;
import 'package:flutter/material.dart';

class StatusUpdateModel extends FlutterFlowModel<StatusUpdateWidget> {
  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? testController;
  // Model for SideBar component.
  late SideBarModel sideBarModel;

  @override
  void initState(BuildContext context) {
    sideBarModel = createModel(context, () => SideBarModel());
  }

  @override
  void dispose() {
    testController?.finish();
    sideBarModel.dispose();
  }
}
