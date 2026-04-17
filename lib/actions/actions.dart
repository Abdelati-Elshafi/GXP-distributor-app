import '/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

Future serverConnectionFail(BuildContext context) async {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        'Faild To Connect The Server',
        style: TextStyle(
          fontWeight: FontWeight.w300,
        ),
      ),
      duration: Duration(milliseconds: 4900),
      backgroundColor: FlutterFlowTheme.of(context).error,
    ),
  );
}
