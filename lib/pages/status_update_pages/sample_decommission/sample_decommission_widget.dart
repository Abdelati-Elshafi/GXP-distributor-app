import '/backend/api_requests/api_calls.dart';
import '/components/empty_list_view_display/empty_list_view_display_widget.dart';
import '/components/loading/loading_widget.dart';
import '/components/scan_button/scan_button_widget.dart';
import '/components/scanned_serials_to_decommission/scanned_serials_to_decommission_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sample_decommission_model.dart';
export 'sample_decommission_model.dart';

/// Create a modern page called "Decommission".
///
/// - AppBar: title "Decommission", background Primary Blue (#323394), white
/// text, back arrow.
///
/// - Page background: White.
///
/// - Body:
///    - Reason section at top:
///        - If reason is preselected, show small banner "Reason:
/// [Lost/Stolen/Damaged/Sample/Export]" in Primary Blue with white text,
/// rounded corners.
///        - If no reason, show dropdown menu to select reason from options
/// [Lost, Stolen, Damaged, Sample, Export, Expired, Destroyed].
///    - Scan section:
///        - Large rounded input field with placeholder "Scan or enter
/// Serial/SSCC", border #D7D1E3, left barcode icon, right button "Scan" in
/// Accent Orange (#F3601F).
///    - List of scanned items:
///        - Each row shows Serial/SSCC ID (bold, #323394), optional product
/// name, right icon ✅ or ⚠️.
///    - Bottom actions:
///        - Full-width button "Confirm Decommission", background Primary Blue
/// (#323394), white bold text, rounded 16px.
///        - Text button "Cancel" in Accent Orange, centered below.
class SampleDecommissionWidget extends StatefulWidget {
  const SampleDecommissionWidget({
    super.key,
    required this.decommissionReason,
  });

  final String? decommissionReason;

  static String routeName = 'SampleDecommission';
  static String routePath = '/sampleDecommission';

  @override
  State<SampleDecommissionWidget> createState() =>
      _SampleDecommissionWidgetState();
}

class _SampleDecommissionWidgetState extends State<SampleDecommissionWidget> {
  late SampleDecommissionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SampleDecommissionModel());

    _model.enterSSCCTextController ??= TextEditingController();
    _model.enterSSCCFocusNode ??= FocusNode();
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: Color(0xFF261D66),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 28.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            valueOrDefault<String>(
              widget.decommissionReason,
              'Reason',
            ),
            style: FlutterFlowTheme.of(context).titleLarge.override(
                  font: GoogleFonts.interTight(
                    fontWeight: FontWeight.bold,
                    fontStyle:
                        FlutterFlowTheme.of(context).titleLarge.fontStyle,
                  ),
                  color: Colors.white,
                  fontSize: 21.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.bold,
                  fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
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
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'tcklpsdr' /* Scan Items */,
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
                                          .primaryTextColor,
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontStyle,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  5.0, 0.0, 5.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16.0),
                                  border: Border.all(
                                    color: Color(0xFFD7D1E3),
                                    width: 2.0,
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            child: Icon(
                                              Icons.qr_code_scanner,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryTextColor,
                                              size: 24.0,
                                            ),
                                          ),
                                          Expanded(
                                            child: TextFormField(
                                              controller: _model
                                                  .enterSSCCTextController,
                                              focusNode:
                                                  _model.enterSSCCFocusNode,
                                              onFieldSubmitted: (_) async {
                                                _model.loadingIsVisable = true;
                                                safeSetState(() {});
                                                await _model.getSerialStatus(
                                                  context,
                                                  serial: _model
                                                      .enterSSCCTextController
                                                      .text,
                                                );
                                                safeSetState(() {});
                                                safeSetState(() {
                                                  _model.enterSSCCTextController
                                                      ?.clear();
                                                });
                                              },
                                              autofocus: false,
                                              textInputAction:
                                                  TextInputAction.done,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                hintText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'htchxdh3' /* Scan or enter Serial/SSCC */,
                                                ),
                                                hintStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color: Color(0xFF9E9E9E),
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                enabledBorder: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                focusedErrorBorder:
                                                    InputBorder.none,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            Color(0xFF14181B),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                              validator: _model
                                                  .enterSSCCTextControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 8.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                _model.scannedcode =
                                                    await FlutterBarcodeScanner
                                                        .scanBarcode(
                                                  '#C62828', // scanning line color
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'nrg78dy1' /* Cancel */,
                                                  ), // cancel button text
                                                  true, // whether to show the torch (camera LED) toggle icon
                                                  ScanMode.BARCODE,
                                                );

                                                if (!(_model.scannedcode == '-1'
                                                    ? true
                                                    : false)) {
                                                  _model.gS1ParsedData =
                                                      await actions
                                                          .parseGs1Scan(
                                                    _model.scannedcode,
                                                  );
                                                  safeSetState(() {
                                                    _model
                                                        .enterSSCCTextController
                                                        ?.text = getJsonField(
                                                      _model.gS1ParsedData,
                                                      r'''$.serial''',
                                                    ).toString();
                                                    _model.enterSSCCFocusNode
                                                        ?.requestFocus();
                                                    WidgetsBinding.instance
                                                        .addPostFrameCallback(
                                                            (_) {
                                                      _model.enterSSCCTextController
                                                              ?.selection =
                                                          TextSelection
                                                              .collapsed(
                                                        offset: _model
                                                            .enterSSCCTextController!
                                                            .text
                                                            .length,
                                                      );
                                                    });
                                                  });
                                                  await _model.getSerialStatus(
                                                    context,
                                                    serial: _model
                                                        .enterSSCCTextController
                                                        .text,
                                                  );
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
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ].divide(SizedBox(height: 8.0)),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'm7744z82' /* Select Reason */,
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
                                        .primaryTextColor,
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .fontStyle,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                5.0, 0.0, 5.0, 0.0),
                            child: FlutterFlowDropDown<String>(
                              controller:
                                  _model.reasonDropDownValueController ??=
                                      FormFieldController<String>(
                                _model.reasonDropDownValue ??= '',
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
                                  'n72oiock' /* Sample for Doctors */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '7cki0c63' /* Packaging Review */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'pqzegnzs' /* Laboratory Sample */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'axgvfmor' /* Criminal Investigation */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '2deldfxq' /* Prequalification */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'ge7udvgs' /* Retention for future testing */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '24w2j7ub' /* Consumer Report */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'txnwi9p7' /*  Product Documentation */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'h58uc1go' /* PMS Sampling */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '5nukxh23' /*  Suspect Activity */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '4p73ydhj' /*  Storing Condition */,
                                )
                              ],
                              onChanged: (val) => safeSetState(
                                  () => _model.reasonDropDownValue = val),
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
                                    color: Color(0xFF454444),
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
                                'y5gy94y7' /* Choose Reason */,
                              ),
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: Color(0xFF14181B),
                                size: 24.0,
                              ),
                              fillColor: Colors.white,
                              elevation: 2.0,
                              borderColor: Color(0xFFE0E0E0),
                              borderWidth: 1.0,
                              borderRadius: 8.0,
                              margin: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 10.0, 0.0),
                              hidesUnderline: true,
                              isSearchable: false,
                              isMultiSelect: false,
                            ),
                          ),
                        ].divide(SizedBox(height: 16.0)),
                      ),
                      Stack(
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'inbdn836' /* Scanned Items */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLarge
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .primaryTextColor,
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontStyle,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 0.0, 5.0, 0.0),
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 2.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Container(
                                    width: double.infinity,
                                    height: 280.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      boxShadow: [
                                        FlutterFlowTheme.of(context)
                                            .designToken
                                            .shadow
                                            .lg
                                      ],
                                      borderRadius: BorderRadius.circular(20.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .outline,
                                        width: 2.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 20.0, 8.0, 0.0),
                                      child: Builder(
                                        builder: (context) {
                                          final itemInList = _model
                                              .scannedSerialToDecommission
                                              .toList();

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
                                              return ScannedSerialsToDecommissionWidget(
                                                key: Key(
                                                    'Keyqbq_${itemInListIndex}_of_${itemInList.length}'),
                                                scannedSerial: _model
                                                    .scannedSerialToDecommission
                                                    .elementAtOrNull(
                                                        itemInListIndex)!,
                                                index: itemInListIndex,
                                                deletAction: (index) async {
                                                  _model
                                                      .removeAtIndexFromScannedSerialToDecommission(
                                                          index);
                                                  safeSetState(() {});
                                                },
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(height: 12.0)),
                          ),
                          wrapWithModel(
                            model: _model.emptyListViewDisplayModel,
                            updateCallback: () => safeSetState(() {}),
                            child: EmptyListViewDisplayWidget(
                              listContent: _model.scannedSerialToDecommission,
                            ),
                          ),
                        ],
                      ),
                    ].divide(SizedBox(height: 24.0)),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding: EdgeInsets.all(
                      FlutterFlowTheme.of(context).designToken.spacing.sm),
                  child: FFButtonWidget(
                    onPressed: !((_model
                                .scannedSerialToDecommission.isNotEmpty) &&
                            (_model.reasonDropDownValue != null &&
                                _model.reasonDropDownValue != ''))
                        ? null
                        : () async {
                            _model.loadingIsVisable = true;
                            safeSetState(() {});
                            _model.updateSerialStatusApiResult =
                                await SerialStatusUpdateGroup
                                    .updateSerialStatusCall
                                    .call(
                              status: widget.decommissionReason,
                              reason: _model.reasonDropDownValue,
                              serialsList: _model.scannedSerialToDecommission,
                              userName: FFAppState().userName,
                            );

                            if ((_model
                                    .updateSerialStatusApiResult?.succeeded ??
                                true)) {
                              _model.scannedSerialToDecommission = [];
                              safeSetState(() {});
                              safeSetState(() {
                                _model.reasonDropDownValueController?.reset();
                                _model.reasonDropDownValue = null;
                              });
                              safeSetState(() {
                                _model.enterSSCCTextController?.clear();
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Serials Statues Updated ',
                                    style: TextStyle(
                                      color: Color(0xFFDDDDDD),
                                    ),
                                    textAlign: TextAlign.center,
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
                                    'Faild To Connect The Server',
                                    style: TextStyle(
                                      color: Color(0xFFDDDDDD),
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).error,
                                ),
                              );
                            }

                            _model.loadingIsVisable = false;
                            safeSetState(() {});

                            safeSetState(() {});
                          },
                    text: FFLocalizations.of(context).getText(
                      'z3c0g4t5' /* Confirm Decommission */,
                    ),
                    options: FFButtonOptions(
                      width: 300.0,
                      height: 52.0,
                      padding: EdgeInsets.all(8.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primaryTextColor,
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
                      elevation: 2.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(16.0),
                      disabledColor: FlutterFlowTheme.of(context).alternate,
                    ),
                  ),
                ),
              ),
              if (_model.loadingIsVisable)
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: wrapWithModel(
                    model: _model.loadingModel,
                    updateCallback: () => safeSetState(() {}),
                    child: LoadingWidget(),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
