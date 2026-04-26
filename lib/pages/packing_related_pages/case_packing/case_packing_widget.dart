import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'case_packing_model.dart';
export 'case_packing_model.dart';

class CasePackingWidget extends StatefulWidget {
  const CasePackingWidget({
    super.key,
    this.lastSavedCodes,
    required this.sscc,
    required this.product,
  });

  final List<String>? lastSavedCodes;
  final String? sscc;
  final String? product;

  static String routeName = 'CasePacking';
  static String routePath = '/casePacking';

  @override
  State<CasePackingWidget> createState() => _CasePackingWidgetState();
}

class _CasePackingWidgetState extends State<CasePackingWidget> {
  late CasePackingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CasePackingModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.initialCodes = widget.lastSavedCodes!.toList().cast<String>();
      safeSetState(() {});
    });
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
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                child: Container(
                  width: double.infinity,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 800.0,
                    child: custom_widgets.MultiBarcodeScanner(
                      width: double.infinity,
                      height: 800.0,
                      initialCodes: _model.initialCodes,
                      onSave: (codes) async {
                        context.goNamed(
                          PackageOperationWidget.routeName,
                          queryParameters: {
                            'sSCC': serializeParam(
                              widget.sscc,
                              ParamType.String,
                            ),
                            'product': serializeParam(
                              '',
                              ParamType.String,
                            ),
                            'caseno': serializeParam(
                              0,
                              ParamType.int,
                            ),
                            'itemsno': serializeParam(
                              0,
                              ParamType.int,
                            ),
                            'ssccproductserials': serializeParam(
                              codes,
                              ParamType.String,
                              isList: true,
                            ),
                          }.withoutNulls,
                        );
                      },
                      onCancel: () async {
                        context.goNamed(
                          PackageOperationWidget.routeName,
                          queryParameters: {
                            'sSCC': serializeParam(
                              '555',
                              ParamType.String,
                            ),
                            'product': serializeParam(
                              '',
                              ParamType.String,
                            ),
                            'caseno': serializeParam(
                              0,
                              ParamType.int,
                            ),
                            'itemsno': serializeParam(
                              0,
                              ParamType.int,
                            ),
                            'ssccproductserials': serializeParam(
                              _model.initialCodes,
                              ParamType.String,
                              isList: true,
                            ),
                          }.withoutNulls,
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
