import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'exceptions_model.dart';
export 'exceptions_model.dart';

class ExceptionsWidget extends StatefulWidget {
  const ExceptionsWidget({super.key});

  static String routeName = 'Exceptions';
  static String routePath = '/exceptions';

  @override
  State<ExceptionsWidget> createState() => _ExceptionsWidgetState();
}

class _ExceptionsWidgetState extends State<ExceptionsWidget> {
  late ExceptionsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExceptionsModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [],
          ),
        ),
      ),
    );
  }
}
