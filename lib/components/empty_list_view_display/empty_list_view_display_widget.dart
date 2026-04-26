import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'empty_list_view_display_model.dart';
export 'empty_list_view_display_model.dart';

class EmptyListViewDisplayWidget extends StatefulWidget {
  const EmptyListViewDisplayWidget({
    super.key,
    this.listContent,
  });

  final List<String>? listContent;

  @override
  State<EmptyListViewDisplayWidget> createState() =>
      _EmptyListViewDisplayWidgetState();
}

class _EmptyListViewDisplayWidgetState
    extends State<EmptyListViewDisplayWidget> {
  late EmptyListViewDisplayModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyListViewDisplayModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible:
          (widget.listContent != null && (widget.listContent)!.isNotEmpty) ==
              false,
      child: Container(
        width: double.infinity,
        height: 129.97,
        decoration: BoxDecoration(),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Icon(
                Icons.description_outlined,
                color: Color(0xFFF3601F),
                size: 48.0,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'zomk0l7m' /* There are no items to display ... */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.inter(
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        color: Color(0xFFF3601F),
                        fontSize: () {
                          if (MediaQuery.sizeOf(context).width <
                              kBreakpointSmall) {
                            return 10.0;
                          } else if (MediaQuery.sizeOf(context).width <
                              kBreakpointMedium) {
                            return 12.0;
                          } else if (MediaQuery.sizeOf(context).width <
                              kBreakpointLarge) {
                            return 14.0;
                          } else {
                            return 14.0;
                          }
                        }(),
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
