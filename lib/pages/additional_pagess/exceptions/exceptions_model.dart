import '/components/bottom_bar/bottom_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'exceptions_widget.dart' show ExceptionsWidget;
import 'package:flutter/material.dart';

class ExceptionsModel extends FlutterFlowModel<ExceptionsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for BottomBar component.
  late BottomBarModel bottomBarModel;

  @override
  void initState(BuildContext context) {
    bottomBarModel = createModel(context, () => BottomBarModel());
  }

  @override
  void dispose() {
    bottomBarModel.dispose();
  }
}
