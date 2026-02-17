import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'scanned_serials_to_decommission_model.dart';
export 'scanned_serials_to_decommission_model.dart';

class ScannedSerialsToDecommissionWidget extends StatefulWidget {
  const ScannedSerialsToDecommissionWidget({
    super.key,
    required this.scannedSerial,
    required this.index,
    required this.deletAction,
  });

  final String? scannedSerial;
  final int? index;
  final Future Function(int index)? deletAction;

  @override
  State<ScannedSerialsToDecommissionWidget> createState() =>
      _ScannedSerialsToDecommissionWidgetState();
}

class _ScannedSerialsToDecommissionWidgetState
    extends State<ScannedSerialsToDecommissionWidget> {
  late ScannedSerialsToDecommissionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScannedSerialsToDecommissionModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x1A000000),
              offset: Offset(
                0.0,
                2.0,
              ),
            )
          ],
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: Color(0xFFD7D1E3),
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(2.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                  child: Text(
                    valueOrDefault<String>(
                      widget.scannedSerial,
                      'Serial',
                    ),
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                          font: GoogleFonts.inter(
                            fontWeight: FontWeight.bold,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .fontStyle,
                          ),
                          color: Color(0xFF323394),
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                        ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    await widget.deletAction?.call(
                      widget.index!,
                    );
                  },
                  child: Icon(
                    Icons.delete_forever,
                    color: Color(0xFFFF0006),
                    size: 35.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
