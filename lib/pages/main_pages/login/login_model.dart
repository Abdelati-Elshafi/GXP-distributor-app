import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  Local state fields for this page.

  List<String> users = [];
  void addToUsers(String item) => users.add(item);
  void removeFromUsers(String item) => users.remove(item);
  void removeAtIndexFromUsers(int index) => users.removeAt(index);
  void insertAtIndexInUsers(int index, String item) =>
      users.insert(index, item);
  void updateUsersAtIndex(int index, Function(String) updateFn) =>
      users[index] = updateFn(users[index]);

  bool serverError = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (GetAllUsers)] action in Login widget.
  ApiCallResponse? getUsesResp;
  // State field(s) for UsernameDropDown widget.
  String? usernameDropDownValue;
  FormFieldController<String>? usernameDropDownValueController;
  // State field(s) for Password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  // Stores action output result for [Backend Call - API (UserLogin)] action in LoginButton widget.
  ApiCallResponse? userLoginResp;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
  }

  @override
  void dispose() {
    passwordFocusNode?.dispose();
    passwordTextController?.dispose();
  }
}
