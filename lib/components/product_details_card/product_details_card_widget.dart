import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'product_details_card_model.dart';
export 'product_details_card_model.dart';

class ProductDetailsCardWidget extends StatefulWidget {
  const ProductDetailsCardWidget({
    super.key,
    String? productname,
    String? productGTIN,
    int? requiredQTY,
    int? scannedQTY,
    required this.orderNO,
    required this.orderSSCC,
  })  : this.productname = productname ?? 'Paracetamol 500mg',
        this.productGTIN = productGTIN ?? '123456789',
        this.requiredQTY = requiredQTY ?? 80,
        this.scannedQTY = scannedQTY ?? 15;

  final String productname;
  final String productGTIN;
  final int requiredQTY;
  final int scannedQTY;
  final String? orderNO;
  final String? orderSSCC;

  @override
  State<ProductDetailsCardWidget> createState() =>
      _ProductDetailsCardWidgetState();
}

class _ProductDetailsCardWidgetState extends State<ProductDetailsCardWidget> {
  late ProductDetailsCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductDetailsCardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          context.pushNamed(
            ProductDetailsWidget.routeName,
            queryParameters: {
              'productname': serializeParam(
                widget.productname,
                ParamType.String,
              ),
              'productGTIN': serializeParam(
                widget.productGTIN,
                ParamType.String,
              ),
              'requiredQTY': serializeParam(
                widget.requiredQTY,
                ParamType.int,
              ),
              'scannedQTY': serializeParam(
                widget.scannedQTY,
                ParamType.int,
              ),
              'orderNO': serializeParam(
                widget.orderNO,
                ParamType.String,
              ),
              'orderSSCC': serializeParam(
                widget.orderSSCC,
                ParamType.String,
              ),
            }.withoutNulls,
          );
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 8.0,
                color: Color(0x1A000000),
                offset: Offset(
                  0.0,
                  2.0,
                ),
              )
            ],
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          '8wnu9fxc' /* Paracetamol 500mg Tablets */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.inter(
                                fontWeight: FontWeight.bold,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color: Color(0xFF14181B),
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                      Text(
                        'GTIN: ${widget.productGTIN} | ${valueOrDefault<String>(
                          widget.scannedQTY.toString(),
                          '0',
                        )} / ${widget.requiredQTY.toString()}',
                        style: FlutterFlowTheme.of(context).labelSmall.override(
                              font: GoogleFonts.inter(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .fontStyle,
                            ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              '6ptvtq11' /* Registered */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: Color(0xFF10B981),
                                  fontSize: 13.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ],
                      ),
                    ].divide(SizedBox(height: 10.0)),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 8.0,
                      height: 8.0,
                      decoration: BoxDecoration(
                        color: widget.scannedQTY == widget.requiredQTY
                            ? FlutterFlowTheme.of(context).success
                            : FlutterFlowTheme.of(context).error,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 20.0,
                    ),
                  ].divide(SizedBox(width: 8.0)),
                ),
              ].divide(SizedBox(width: 12.0)),
            ),
          ),
        ),
      ),
    );
  }
}
