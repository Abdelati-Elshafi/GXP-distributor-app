import '/backend/api_requests/api_calls.dart';
import '/components/loading/loading_widget.dart';
import '/components/s_s_c_c_details_card/s_s_c_c_details_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'product_details_model.dart';
export 'product_details_model.dart';

/// Create a page "Product Details".
///
/// Top: small white card with rounded corners and shadow. Inside show:
/// - Product Name bold
/// - GTIN
/// - Batch
/// - Expiry Date
/// - Required Qty
/// - Scanned Qty
///
/// Below: section title "Scanned Codes" in bold #323394.
/// Add vertical list of cards for each scanned item:
/// - Left: serial or SSCC number bold
/// - Right: small badge showing type (Case in blue, Pallet in orange)
///
/// Floating Action Button: bottom-right, circular, background orange
/// (#F3601F), white barcode icon, action = scan new code.
///
/// Bottom of page: horizontal row with two equal-width buttons.
/// - Left button: "Confirm", Primary Blue (#323394) background, bold white
/// text.
/// - Right button: "Cancel", light orange background (#FFE6DC), bold orange
/// text (#F3601F).
/// Both with rounded corners.
class ProductDetailsWidget extends StatefulWidget {
  const ProductDetailsWidget({
    super.key,
    this.productname,
    this.productGTIN,
    this.requiredQTY,
    this.scannedQTY,
    required this.orderNO,
    required this.orderSSCC,
  });

  final String? productname;
  final String? productGTIN;
  final int? requiredQTY;
  final int? scannedQTY;
  final String? orderNO;
  final String? orderSSCC;

  static String routeName = 'ProductDetails';
  static String routePath = '/productDetails';

  @override
  State<ProductDetailsWidget> createState() => _ProductDetailsWidgetState();
}

class _ProductDetailsWidgetState extends State<ProductDetailsWidget> {
  late ProductDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductDetailsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.loading = true;
      safeSetState(() {});
      _model.productSerialsDetailsApiResult =
          await OrdersAPIsGroup.productSerialsDetailsCall.call(
        gtin: widget.productGTIN,
        orderNo: widget.orderNO,
        sscc: widget.orderSSCC,
      );

      if ((_model.productSerialsDetailsApiResult?.succeeded ?? true)) {
        _model.orderProductserials = OrdersAPIsGroup.productSerialsDetailsCall
            .serials(
              (_model.productSerialsDetailsApiResult?.jsonBody ?? ''),
            )!
            .toList()
            .cast<String>();
        safeSetState(() {});
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Failed to connect to the server',
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
      }

      _model.loading = false;
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
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(4.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16.0),
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
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(
                            color: Color(0xFFF3601F),
                            width: 0.0,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 12.0, 0.0),
                                child: Container(
                                  width: 4.0,
                                  height: 115.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF3601F),
                                    borderRadius: BorderRadius.circular(2.0),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 8.0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          widget.productname,
                                          'Product Name',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .override(
                                              font: GoogleFonts.interTight(
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineMedium
                                                        .fontStyle,
                                              ),
                                              color: Color(0xFF14181B),
                                              fontSize: 20.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 8.0),
                                      child: Text(
                                        'GTIN: ${widget.productGTIN}',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            width: 120.0,
                                            height: 50.0,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF1D6CA),
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(8.0),
                                                topRight: Radius.circular(8.0),
                                                bottomLeft:
                                                    Radius.circular(8.0),
                                                bottomRight:
                                                    Radius.circular(8.0),
                                              ),
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsets.all(4.0),
                                                child: Text(
                                                  'Required Qty: ${valueOrDefault<String>(
                                                    widget.requiredQTY
                                                        ?.toString(),
                                                    '0',
                                                  )}',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            Color(0xFFF3601F),
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 120.0,
                                            height: 50.0,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFD1E5FA),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsets.all(4.0),
                                                child: Text(
                                                  'Scanned Qty: ${valueOrDefault<String>(
                                                    widget.scannedQTY
                                                        ?.toString(),
                                                    '0',
                                                  )}',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color: Colors.blue,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ]
                                      .divide(SizedBox(height: 10.0))
                                      .around(SizedBox(height: 10.0)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    LinearPercentIndicator(
                      percent: (widget.scannedQTY!) / (widget.requiredQTY!),
                      lineHeight: 8.0,
                      animation: true,
                      animateFromLastPercent: true,
                      progressColor: Color(0xFFF3601F),
                      backgroundColor: Color(0xCCFFFFFF),
                      barRadius: Radius.circular(4.0),
                      padding: EdgeInsets.zero,
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 10.0, 16.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'hm9wo4ix' /* Scanned Codes */,
                        ),
                        style: FlutterFlowTheme.of(context)
                            .titleMedium
                            .override(
                              font: GoogleFonts.interTight(
                                fontWeight: FontWeight.bold,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .fontStyle,
                              ),
                              color:
                                  FlutterFlowTheme.of(context).primaryTextColor,
                              fontSize: 22.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .fontStyle,
                            ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          height: 438.6,
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
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 10.0, 16.0, 0.0),
                                  child: Builder(
                                    builder: (context) {
                                      final itemInList =
                                          _model.orderProductserials.toList();

                                      return ListView.separated(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10.0),
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: itemInList.length,
                                        separatorBuilder: (_, __) =>
                                            SizedBox(height: 10.0),
                                        itemBuilder:
                                            (context, itemInListIndex) {
                                          final itemInListItem =
                                              itemInList[itemInListIndex];
                                          return SSCCDetailsCardWidget(
                                            key: Key(
                                                'Keyzt0_${itemInListIndex}_of_${itemInList.length}'),
                                            sscc: _model.orderProductserials
                                                .elementAtOrNull(
                                                    itemInListIndex)!,
                                            index: itemInListIndex,
                                            deletefromsscclistaction: () async {
                                              _model
                                                  .removeAtIndexFromOrderProductserials(
                                                      itemInListIndex);
                                              safeSetState(() {});
                                            },
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]
                      .divide(SizedBox(height: 16.0))
                      .addToStart(SizedBox(height: 16.0))
                      .addToEnd(SizedBox(height: 100.0)),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Container(
                  height: 80.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(),
                    border: Border.all(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: FFButtonWidget(
                            onPressed: () async {
                              context.safePop();
                            },
                            text: FFLocalizations.of(context).getText(
                              'fec4gw24' /* Confirm */,
                            ),
                            icon: Icon(
                              Icons.check,
                              size: 20.0,
                            ),
                            options: FFButtonOptions(
                              height: 48.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconColor: Colors.white,
                              color:
                                  FlutterFlowTheme.of(context).primaryTextColor,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font: GoogleFonts.interTight(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                              elevation: 2.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        ),
                        Expanded(
                          child: FFButtonWidget(
                            onPressed: () async {
                              context.safePop();
                            },
                            text: FFLocalizations.of(context).getText(
                              '7keun6vr' /* Cancel */,
                            ),
                            icon: Icon(
                              Icons.close,
                              size: 20.0,
                            ),
                            options: FFButtonOptions(
                              height: 48.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconColor: Colors.white,
                              color: Color(0xFFD32F2F),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font: GoogleFonts.interTight(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                              elevation: 2.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        ),
                      ].divide(SizedBox(width: 12.0)),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(1.0, 1.0),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 105.0),
                  child: Container(
                    width: 55.0,
                    height: 55.0,
                    decoration: BoxDecoration(
                      color: Color(0xFFF3601F),
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          _model.scannedcode =
                              await FlutterBarcodeScanner.scanBarcode(
                            '#C62828', // scanning line color
                            FFLocalizations.of(context).getText(
                              'eb5ppw2s' /* Cancel */,
                            ), // cancel button text
                            true, // whether to show the flash icon
                            ScanMode.BARCODE,
                          );

                          if (!(_model.scannedcode == '-1' ? true : false)) {
                            _model.parseSSCCData =
                                await actions.parseStrictSscc(
                              _model.scannedcode,
                            );
                            if (getJsonField(
                              _model.parseSSCCData,
                              r'''$.success''',
                            )) {
                              await _model.checkSerialStatus(
                                context,
                                serial: getJsonField(
                                  _model.parseSSCCData,
                                  r'''$.sscc''',
                                ).toString(),
                                scannedSerialList: _model.orderProductserials,
                              );
                              safeSetState(() {});
                            } else {
                              _model.gS1ParsedData = await actions.parseGs1Scan(
                                _model.scannedcode,
                              );
                              if (getJsonField(
                                _model.gS1ParsedData,
                                r'''$.success''',
                              )) {
                                if (getJsonField(
                                      _model.gS1ParsedData,
                                      r'''$.serial''',
                                    ) !=
                                    null) {
                                  await _model.checkSerialStatus(
                                    context,
                                    serial: getJsonField(
                                      _model.gS1ParsedData,
                                      r'''$.serial''',
                                    ).toString(),
                                    scannedSerialList:
                                        _model.orderProductserials,
                                  );
                                  safeSetState(() {});
                                }
                              } else {
                                var confirmDialogResponse =
                                    await showDialog<bool>(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text('Not GS1 Code'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          false),
                                                  child: Text('Cancel'),
                                                ),
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          true),
                                                  child: Text('Confirm'),
                                                ),
                                              ],
                                            );
                                          },
                                        ) ??
                                        false;
                              }
                            }
                          }

                          safeSetState(() {});
                        },
                        child: Icon(
                          Icons.qr_code_scanner,
                          color: Colors.white,
                          size: 30.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              if (_model.loading)
                wrapWithModel(
                  model: _model.loadingModel,
                  updateCallback: () => safeSetState(() {}),
                  child: LoadingWidget(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
