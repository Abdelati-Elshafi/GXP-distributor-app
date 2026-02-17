import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'case_packing_widget.dart' show CasePackingWidget;
import 'package:flutter/material.dart';

class CasePackingModel extends FlutterFlowModel<CasePackingWidget> {
  ///  Local state fields for this page.

  List<String> initialCodes = [];
  void addToInitialCodes(String item) => initialCodes.add(item);
  void removeFromInitialCodes(String item) => initialCodes.remove(item);
  void removeAtIndexFromInitialCodes(int index) => initialCodes.removeAt(index);
  void insertAtIndexInInitialCodes(int index, String item) =>
      initialCodes.insert(index, item);
  void updateInitialCodesAtIndex(int index, Function(String) updateFn) =>
      initialCodes[index] = updateFn(initialCodes[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
