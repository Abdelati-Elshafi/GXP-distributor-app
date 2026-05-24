import '/backend/api_requests/api_calls.dart';
import '/components/empty_list_view_display/empty_list_view_display_widget.dart';
import '/components/loading/loading_widget.dart';
import '/components/product_data_component/product_data_component_widget.dart';
import '/components/scan_button/scan_button_widget.dart';
import '/components/text_field_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'return_shipping_model.dart';
export 'return_shipping_model.dart';

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
class ReturnShippingWidget extends StatefulWidget {
  const ReturnShippingWidget({super.key});

  static String routeName = 'ReturnShipping';
  static String routePath = '/returnShipping';

  @override
  State<ReturnShippingWidget> createState() => _ReturnShippingWidgetState();
}

class _ReturnShippingWidgetState extends State<ReturnShippingWidget> {
  late ReturnShippingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReturnShippingModel());
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
                'kdcruz8i' /* Return Shipping  */,
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
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(
                    FlutterFlowTheme.of(context).designToken.spacing.sm),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1.0, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  '15bhrale' /* Scan Shipment */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      font: GoogleFonts.interTight(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 56.0,
                            decoration: BoxDecoration(
                              color: Color(0xFF04113D),
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
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    size: 24.0,
                                  ),
                                  Expanded(
                                    child: wrapWithModel(
                                      model: _model.textFieldModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: TextFieldWidget(
                                        changeAction: () async {
                                          _model.loading = true;
                                          safeSetState(() {});
                                          _model.getOrderDetails =
                                              await OrdersAPIsGroup
                                                  .getOrderDetailsCall
                                                  .call(
                                            orderNO: _model.textFieldModel
                                                .enterSSCCTextController.text,
                                          );

                                          if ((_model
                                                  .getOrderDetails?.succeeded ??
                                              true)) {
                                            _model.products = OrdersAPIsGroup
                                                .getOrderDetailsCall
                                                .productsData(
                                                  (_model.getOrderDetails
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                .toList()
                                                .cast<dynamic>();
                                            safeSetState(() {});
                                          }
                                          _model.loading = false;
                                          safeSetState(() {});

                                          safeSetState(() {});
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
                                      _model.scannedCode =
                                          await FlutterBarcodeScanner
                                              .scanBarcode(
                                        '#C62828', // scanning line color
                                        FFLocalizations.of(context).getText(
                                          '5zlki9yx' /* Cancel */,
                                        ), // cancel button text
                                        true, // whether to show the torch (camera LED) toggle icon
                                        ScanMode.QR,
                                      );

                                      await _model.getSSCCOrderData(
                                        context,
                                        serial: 'scannedCode',
                                      );

                                      safeSetState(() {});
                                    },
                                    child: wrapWithModel(
                                      model: _model.scanButtonModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: ScanButtonWidget(),
                                    ),
                                  ),
                                ].divide(SizedBox(width: 12.0)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'j792rer1' /* Select Reason */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .fontStyle,
                                  ),
                            ),
                          ),
                          FlutterFlowDropDown<String>(
                            controller: _model.dropDownValueController ??=
                                FormFieldController<String>(
                              _model.dropDownValue ??= '',
                            ),
                            options: List<String>.from([
                              'S01',
                              'S02',
                              'S03',
                              'S04',
                              'S05',
                              'S06',
                              'S07',
                              'S08',
                              'S09',
                              'S10',
                              'S11'
                            ]),
                            optionLabels: [
                              FFLocalizations.of(context).getText(
                                'i7xhir0s' /* Sample for Doctors */,
                              ),
                              FFLocalizations.of(context).getText(
                                'u7kkrgih' /* Packaging Review */,
                              ),
                              FFLocalizations.of(context).getText(
                                'xhsaa2xi' /* Laboratory Sample */,
                              ),
                              FFLocalizations.of(context).getText(
                                '7wgju90t' /* Criminal Investigation */,
                              ),
                              FFLocalizations.of(context).getText(
                                'jynth320' /* Prequalification */,
                              ),
                              FFLocalizations.of(context).getText(
                                '6dbbs0tl' /* Retention for future testing */,
                              ),
                              FFLocalizations.of(context).getText(
                                '0jhw1xhf' /* Consumer Report */,
                              ),
                              FFLocalizations.of(context).getText(
                                '8kojr2tk' /*  Product Documentation */,
                              ),
                              FFLocalizations.of(context).getText(
                                'uekhburr' /* PMS Sampling */,
                              ),
                              FFLocalizations.of(context).getText(
                                'dor36wx0' /*  Suspect Activity */,
                              ),
                              FFLocalizations.of(context).getText(
                                'fp9d94nu' /*  Storing Condition */,
                              )
                            ],
                            onChanged: (val) =>
                                safeSetState(() => _model.dropDownValue = val),
                            width: double.infinity,
                            height: 56.0,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context).alternate,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                            hintText: FFLocalizations.of(context).getText(
                              'nw4p9uit' /* Choose Reason */,
                            ),
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: FlutterFlowTheme.of(context).alternate,
                              size: 20.0,
                            ),
                            fillColor: Color(0xFF04113D),
                            elevation: 2.0,
                            borderColor: Color(0xFF64B4FF),
                            borderWidth: 1.0,
                            borderRadius: 16.0,
                            margin: EdgeInsetsDirectional.fromSTEB(
                                15.0, 0.0, 10.0, 0.0),
                            hidesUnderline: true,
                            isSearchable: false,
                            isMultiSelect: false,
                          ),
                        ].divide(SizedBox(height: 10.0)),
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  '2v2rcs9k' /* Products */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      font: GoogleFonts.interTight(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                            Stack(
                              children: [
                                Container(
                                  height: 300.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF04113D),
                                    boxShadow: [
                                      FlutterFlowTheme.of(context)
                                          .designToken
                                          .shadow
                                          .lg
                                    ],
                                    borderRadius: BorderRadius.circular(
                                        FlutterFlowTheme.of(context)
                                            .designToken
                                            .radius
                                            .lg),
                                    border: Border.all(
                                      color: Color(0xFF1A2E6B),
                                      width: 2.0,
                                    ),
                                  ),
                                  child: Builder(
                                    builder: (context) {
                                      final itemInList =
                                          _model.products.toList();

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
                                          return ProductDataComponentWidget(
                                            key: Key(
                                                'Key2pq_${itemInListIndex}_of_${itemInList.length}'),
                                            itemsNo: getJsonField(
                                              _model.products.elementAtOrNull(
                                                  itemInListIndex),
                                              r'''$.scannedQty''',
                                            ),
                                            text: getJsonField(
                                              _model.products.elementAtOrNull(
                                                  itemInListIndex),
                                              r'''$.productName''',
                                            ).toString(),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                                if (true)
                                  wrapWithModel(
                                    model: _model.emptyListViewDisplayModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: EmptyListViewDisplayWidget(
                                      listContent: _model.products
                                          .map((e) => e.toString())
                                          .toList(),
                                    ),
                                  ),
                              ],
                            ),
                          ].divide(SizedBox(height: 12.0)),
                        ),
                      ),
                    ),
                  ].divide(SizedBox(height: 15.0)),
                ),
              ),
              if (_model.loading)
                wrapWithModel(
                  model: _model.loadingModel,
                  updateCallback: () => safeSetState(() {}),
                  child: LoadingWidget(),
                ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 20.0),
                  child: FFButtonWidget(
                    onPressed: ((_model.textFieldModel.enterSSCCTextController
                                        .text ==
                                    '') ||
                            (_model.dropDownValue == null ||
                                _model.dropDownValue == ''))
                        ? null
                        : () async {
                            _model.confirmShipment =
                                await ShipmentsGroup.confirmShipmentCall.call(
                              orderNo: _model
                                  .textFieldModel.enterSSCCTextController.text,
                              shippingType: 'Return',
                              reason: _model.dropDownValue,
                            );

                            if ((_model.confirmShipment?.succeeded ?? true)) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    ShipmentsGroup.confirmShipmentCall.message(
                                      (_model.confirmShipment?.jsonBody ?? ''),
                                    )!,
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).secondary,
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    ShipmentsGroup.confirmShipmentCall.message(
                                      (_model.confirmShipment?.jsonBody ?? ''),
                                    )!,
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).error,
                                ),
                              );
                            }

                            safeSetState(() {
                              _model.dropDownValueController?.reset();
                              _model.dropDownValue = null;
                            });
                            safeSetState(() {
                              _model.textFieldModel.enterSSCCTextController
                                  ?.clear();
                            });
                            _model.products = [];
                            safeSetState(() {});

                            safeSetState(() {});
                          },
                    text: FFLocalizations.of(context).getText(
                      'm742i5sy' /* Return */,
                    ),
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 52.0,
                      padding: EdgeInsets.all(8.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: Color(0x05323394),
                      textStyle:
                          FlutterFlowTheme.of(context).titleMedium.override(
                                font: GoogleFonts.interTight(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontStyle,
                                ),
                                color: Colors.white,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                                fontStyle: FlutterFlowTheme.of(context)
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
