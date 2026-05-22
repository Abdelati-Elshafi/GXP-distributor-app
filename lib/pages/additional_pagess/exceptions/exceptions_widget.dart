import '/components/bottom_bar/bottom_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        backgroundColor: Color(0xFF04113D),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 300.0, 0.0, 0.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    '7zzztzo7' /* Coming 
Soon */
                    ,
                  ),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.inter(
                          fontWeight: FontWeight.bold,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        color: Color(0x1DE0E3E7),
                        fontSize: 64.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
              ),
              wrapWithModel(
                model: _model.bottomBarModel,
                updateCallback: () => safeSetState(() {}),
                child: BottomBarWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
