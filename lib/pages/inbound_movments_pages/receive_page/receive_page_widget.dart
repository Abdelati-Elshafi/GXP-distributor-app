import '/backend/api_requests/api_calls.dart';
import '/components/empty_list_view_display/empty_list_view_display_widget.dart';
import '/components/loading/loading_widget.dart';
import '/components/s_s_c_c_details_card/s_s_c_c_details_card_widget.dart';
import '/components/scan_button/scan_button_widget.dart';
import '/components/text_field_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'receive_page_model.dart';
export 'receive_page_model.dart';

/// Create a clean modern page "Receive Shipment".
///
/// AppBar: Primary Blue (#323394), title white, back arrow.
///
/// Background: White.
///
/// Body:
/// - Scan Section: large rounded input field with placeholder "Scan or enter
/// SSCC", border #D7D1E3, left barcode icon, right button "Scan" in Accent
/// Orange (#F3601F).
/// - After scan: show white card, rounded 16px, subtle shadow. Title: "SSCC:
/// [number]" bold (#323394). Subtitle: "Cases: X | Items: Y" (#8181BC).
/// - Product List: vertical list of modern cards. Each shows Product Name /
/// GTIN (bold, #323394), subtitle "Batch [batch] | Expiry [date] | Serials
/// [count]" (#8181BC), left 📦 icon.
/// - Bottom: full-width button "Confirm Receive", background Primary Blue,
/// white bold text, rounded 16px.
class ReceivePageWidget extends StatefulWidget {
  const ReceivePageWidget({
    super.key,
    required this.inboundType,
  });

  final String? inboundType;

  static String routeName = 'ReceivePage';
  static String routePath = '/receivePage';

  @override
  State<ReceivePageWidget> createState() => _ReceivePageWidgetState();
}

class _ReceivePageWidgetState extends State<ReceivePageWidget> {
  late ReceivePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReceivePageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFF04113D),
        appBar: AppBar(
          backgroundColor: Color(0xFF0D214D),
          automaticallyImplyLeading: false,
          leading: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
            child: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 20.0,
              ),
              onPressed: () async {
                context.pop();
              },
            ),
          ),
          title: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
            child: Text(
              FFLocalizations.of(context).getText(
                'inu0b5h5' /* Shipment Receive  */,
              ),
              style: FlutterFlowTheme.of(context).titleLarge.override(
                    font: GoogleFonts.interTight(
                      fontWeight: FontWeight.w600,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleLarge.fontStyle,
                    ),
                    color: Colors.white,
                    fontSize: 21.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                    fontStyle:
                        FlutterFlowTheme.of(context).titleLarge.fontStyle,
                  ),
            ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(
                  FlutterFlowTheme.of(context).designToken.spacing.sm),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      '6f75ego2' /* Scan SSCC */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          font: GoogleFonts.interTight(
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    FFAppState().ScannedBarcode = 'tttttttttt';
                                    safeSetState(() {});
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 58.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF0D214D),
                                      borderRadius: BorderRadius.circular(16.0),
                                      border: Border.all(
                                        color: Color(0xFF64B4FF),
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            Icons.qr_code_scanner,
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            size: 24.0,
                                          ),
                                          Expanded(
                                            child: wrapWithModel(
                                              model: _model.textFieldModel,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: TextFieldWidget(
                                                changeAction: () async {
                                                  _model.loading = true;
                                                  safeSetState(() {});
                                                  await _model
                                                      .checkSerialStatus(
                                                    context,
                                                    serial: _model
                                                        .textFieldModel
                                                        .enterSSCCTextController
                                                        .text,
                                                  );
                                                  safeSetState(() {});
                                                  safeSetState(() {
                                                    _model.textFieldModel
                                                        .enterSSCCTextController
                                                        ?.clear();
                                                  });
                                                },
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              _model.scannedSSCCAction =
                                                  await FlutterBarcodeScanner
                                                      .scanBarcode(
                                                '#C62828', // scanning line color
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'py4acxlu' /* Cancel */,
                                                ), // cancel button text
                                                true, // whether to show the torch (camera LED) toggle icon
                                                ScanMode.BARCODE,
                                              );

                                              if (!(_model.scannedSSCCAction ==
                                                      '-1'
                                                  ? true
                                                  : false)) {
                                                await _model.checkSerialStatus(
                                                  context,
                                                  serial:
                                                      _model.scannedSSCCAction,
                                                );
                                                safeSetState(() {});
                                              }

                                              safeSetState(() {});
                                            },
                                            child: wrapWithModel(
                                              model: _model.scanButtonModel,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: ScanButtonWidget(),
                                            ),
                                          ),
                                        ].divide(SizedBox(width: 12.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(height: 16.0)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'np2bh3pb' /* Products */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          font: GoogleFonts.interTight(
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          fontSize: 20.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                                Stack(
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: 425.54,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF04113D),
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 8.0,
                                            color: Color(0x33000000),
                                            offset: Offset(
                                              0.0,
                                              2.0,
                                            ),
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            6.0, 10.0, 6.0, 0.0),
                                        child: Builder(
                                          builder: (context) {
                                            final itemInList =
                                                _model.scannedSSCC.toList();

                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              primary: false,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount: itemInList.length,
                                              itemBuilder:
                                                  (context, itemInListIndex) {
                                                final itemInListItem =
                                                    itemInList[itemInListIndex];
                                                return SSCCDetailsCardWidget(
                                                  key: Key(
                                                      'Keyywk_${itemInListIndex}_of_${itemInList.length}'),
                                                  sscc: _model.scannedSSCC
                                                      .elementAtOrNull(
                                                          itemInListIndex)!,
                                                  index: itemInListIndex,
                                                  deletefromsscclistaction:
                                                      () async {
                                                    _model
                                                        .removeAtIndexFromScannedSSCC(
                                                            itemInListIndex);
                                                    safeSetState(() {});
                                                  },
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    if (true)
                                      wrapWithModel(
                                        model: _model.emptyListViewDisplayModel,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: EmptyListViewDisplayWidget(
                                          listContent: _model.scannedSSCC,
                                        ),
                                      ),
                                  ],
                                ),
                              ].divide(SizedBox(height: 12.0)),
                            ),
                          ),
                          Stack(
                            children: [
                              if (widget.inboundType == '0')
                                Align(
                                  alignment: AlignmentDirectional(0.0, 1.0),
                                  child: FFButtonWidget(
                                    onPressed: !(_model.scannedSSCC.isNotEmpty)
                                        ? null
                                        : () async {
                                            _model.loading = true;
                                            safeSetState(() {});
                                            _model.receivingShipmentApiResult =
                                                await ShipmentsGroup
                                                    .receivingShipmentCall
                                                    .call(
                                              shipmentSSCCList:
                                                  _model.scannedSSCC,
                                              shipmentType: 'normal',
                                            );

                                            if ((_model
                                                    .receivingShipmentApiResult
                                                    ?.succeeded ??
                                                true)) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    '${ShipmentsGroup.receivingShipmentCall.message(
                                                      (_model.receivingShipmentApiResult
                                                              ?.jsonBody ??
                                                          ''),
                                                    )}',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                ),
                                              );
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    '${ShipmentsGroup.receivingShipmentCall.message(
                                                      (_model.receivingShipmentApiResult
                                                              ?.jsonBody ??
                                                          ''),
                                                    )}',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .error,
                                                ),
                                              );
                                            }

                                            _model.loading = false;
                                            _model.scannedSSCC = [];
                                            safeSetState(() {});

                                            safeSetState(() {});
                                          },
                                    text: FFLocalizations.of(context).getText(
                                      'pz6lm8qe' /* Confirm Receive */,
                                    ),
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 56.0,
                                      padding: EdgeInsets.all(8.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: Color(0x711A8267),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            font: GoogleFonts.interTight(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .fontStyle,
                                            ),
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontStyle,
                                          ),
                                      elevation: 0.0,
                                      borderSide: BorderSide(
                                        color: Color(0xFF1A8267),
                                      ),
                                      borderRadius: BorderRadius.circular(16.0),
                                      disabledColor: Color(0x711A8267),
                                    ),
                                  ),
                                ),
                              if (widget.inboundType == '1')
                                Align(
                                  alignment: AlignmentDirectional(0.0, 1.0),
                                  child: FFButtonWidget(
                                    onPressed: !(_model.scannedSSCC.isNotEmpty)
                                        ? null
                                        : () async {
                                            _model.loading = true;
                                            safeSetState(() {});
                                            _model.returnReceivingShipmentApiResult =
                                                await ShipmentsGroup
                                                    .receivingShipmentCall
                                                    .call(
                                              shipmentSSCCList:
                                                  _model.scannedSSCC,
                                              shipmentType: 'return receiving',
                                            );

                                            if ((_model
                                                    .returnReceivingShipmentApiResult
                                                    ?.succeeded ??
                                                true)) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    '${ShipmentsGroup.receivingShipmentCall.message(
                                                      (_model.receivingShipmentApiResult
                                                              ?.jsonBody ??
                                                          ''),
                                                    )}',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                ),
                                              );
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    '${ShipmentsGroup.receivingShipmentCall.message(
                                                      (_model.receivingShipmentApiResult
                                                              ?.jsonBody ??
                                                          ''),
                                                    )}',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .error,
                                                ),
                                              );
                                            }

                                            _model.loading = false;
                                            _model.scannedSSCC = [];
                                            safeSetState(() {});

                                            safeSetState(() {});
                                          },
                                    text: FFLocalizations.of(context).getText(
                                      'iem8iuzh' /* Return Receive */,
                                    ),
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 52.0,
                                      padding: EdgeInsets.all(8.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: Color(0x05323394),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            font: GoogleFonts.interTight(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .fontStyle,
                                            ),
                                            color: Colors.white,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontStyle,
                                          ),
                                      elevation: 0.0,
                                      borderSide: BorderSide(
                                        color: Color(0xFF1E90FF),
                                      ),
                                      borderRadius: BorderRadius.circular(16.0),
                                      disabledColor: Color(0x2E57636C),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ].divide(SizedBox(height: 15.0)),
                      ),
                    ),
                  ],
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
    );
  }
}
