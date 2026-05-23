import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'text_field_model.dart';
export 'text_field_model.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({
    super.key,
    required this.changeAction,
  });

  final Future Function()? changeAction;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late TextFieldModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TextFieldModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.looping = true;
      safeSetState(() {});
      while (_model.looping) {
        await Future.delayed(
          Duration(
            milliseconds: 200,
          ),
        );
        if (FFAppState().ScannedBarcode != '') {
          _model.parsedGS1SSCC = await actions.parseStrictSscc(
            '',
          );
          if (getJsonField(
            _model.parsedGS1SSCC,
            r'''$.success''',
          )) {
            FFAppState().ScannedBarcode = getJsonField(
              _model.parsedGS1SSCC,
              r'''$.sscc''',
            ).toString();
            safeSetState(() {});
          } else {
            _model.parsedGs1Serial = await actions.parseGs1Scan(
              FFAppState().ScannedBarcode,
            );
            if (getJsonField(
              _model.parsedGs1Serial,
              r'''$.success''',
            )) {
              FFAppState().ScannedBarcode = getJsonField(
                _model.parsedGs1Serial,
                r'''$.serial''',
              ).toString();
              safeSetState(() {});
            } else {
              var confirmDialogResponse = await showDialog<bool>(
                    context: context,
                    builder: (alertDialogContext) {
                      return AlertDialog(
                        title: Text('Incorrect Data'),
                        content: Text(
                            'Please Scan GS1 DataMatrix or enter correct SSCC'),
                        actions: [
                          TextButton(
                            onPressed: () =>
                                Navigator.pop(alertDialogContext, false),
                            child: Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () =>
                                Navigator.pop(alertDialogContext, true),
                            child: Text('Confirm'),
                          ),
                        ],
                      );
                    },
                  ) ??
                  false;
              return;
            }
          }

          safeSetState(() {
            _model.enterSSCCTextController?.text = FFAppState().ScannedBarcode;
          });
          await widget.changeAction?.call();
          FFAppState().ScannedBarcode = '';
          safeSetState(() {});
        }
      }
    });

    _model.enterSSCCTextController ??= TextEditingController();
    _model.enterSSCCFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return TextFormField(
      controller: _model.enterSSCCTextController,
      focusNode: _model.enterSSCCFocusNode,
      onFieldSubmitted: (_) async {
        FFAppState().ScannedBarcode = _model.enterSSCCTextController.text;
        safeSetState(() {});
      },
      autofocus: false,
      textInputAction: TextInputAction.done,
      obscureText: false,
      decoration: InputDecoration(
        hintText: FFLocalizations.of(context).getText(
          'xo2v14b4' /* Scan or enter SSCC */,
        ),
        hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
              font: GoogleFonts.inter(
                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
              ),
              color: FlutterFlowTheme.of(context).alternate,
              fontSize: 16.0,
              letterSpacing: 0.0,
              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
            ),
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
      ),
      style: FlutterFlowTheme.of(context).bodyMedium.override(
            font: GoogleFonts.inter(
              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
            ),
            color: Color(0xFF14181B),
            fontSize: 16.0,
            letterSpacing: 0.0,
            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
          ),
      validator: _model.enterSSCCTextControllerValidator.asValidator(context),
    );
  }
}
