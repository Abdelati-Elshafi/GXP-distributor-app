import '/flutter_flow/flutter_flow_util.dart';
import 'addnewsscc_widget.dart' show AddnewssccWidget;
import 'package:flutter/material.dart';

class AddnewssccModel extends FlutterFlowModel<AddnewssccWidget> {
  ///  Local state fields for this component.

  bool scanTypeVisabilty = false;

  List<String> emptylist = [];
  void addToEmptylist(String item) => emptylist.add(item);
  void removeFromEmptylist(String item) => emptylist.remove(item);
  void removeAtIndexFromEmptylist(int index) => emptylist.removeAt(index);
  void insertAtIndexInEmptylist(int index, String item) =>
      emptylist.insert(index, item);
  void updateEmptylistAtIndex(int index, Function(String) updateFn) =>
      emptylist[index] = updateFn(emptylist[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - generateSSCCAction] action in Container widget.
  String? sscc;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
