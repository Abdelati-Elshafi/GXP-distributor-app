import '/components/empty_list_view_display/empty_list_view_display_widget.dart';
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
    _model.enterSSCCFocusNode!.addListener(
      () async {
        await _model.getSerialStatus(
          context,
          serial: _model.enterSSCCTextController.text,
        );
      },
    );
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
        backgroundColor: Color(0xFFF8F8F8),
        appBar: AppBar(
          backgroundColor: Color(0xFF323394),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderRadius: 20.0,
            buttonSize: 40.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 24.0,
            ),
            onPressed: () async {
              context.safePop();
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              'o43vwrn2' /* Decommission */,
            ),
            style: FlutterFlowTheme.of(context).titleLarge.override(
                  font: GoogleFonts.interTight(
                    fontWeight: FontWeight.w600,
                    fontStyle:
                        FlutterFlowTheme.of(context).titleLarge.fontStyle,
                  ),
                  color: Colors.white,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                  fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsets.all(5.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xFF323394),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                            valueOrDefault<String>(
                              widget.decommissionReason,
                              'Reason',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  fontSize: 28.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'bwtya1xk' /* Scan Items */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontStyle,
                                    ),
                                    color: Color(0xFF323394),
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .fontStyle,
                                  ),
                        ),
                      ),
                      Container(
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
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 12.0, 0.0),
                                    child: Icon(
                                      Icons.qr_code_scanner,
                                      color: Color(0xFF323394),
                                      size: 24.0,
                                    ),
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      controller:
                                          _model.enterSSCCTextController,
                                      focusNode: _model.enterSSCCFocusNode,
                                      onFieldSubmitted: (_) async {
                                        await _model.getSerialStatus(
                                          context,
                                          serial: _model
                                              .enterSSCCTextController.text,
                                        );
                                      },
                                      autofocus: false,
                                      textInputAction: TextInputAction.done,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText:
                                            FFLocalizations.of(context).getText(
                                          'y4mzfixe' /* Scan or enter Serial/SSCC */,
                                        ),
                                        hintStyle: FlutterFlowTheme.of(context)
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
                                              color: Color(0xFF9E9E9E),
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
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        focusedErrorBorder: InputBorder.none,
                                      ),
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
                                            color: Color(0xFF14181B),
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
                                      validator: _model
                                          .enterSSCCTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      _model.scannedcode =
                                          await FlutterBarcodeScanner
                                              .scanBarcode(
                                        '#C62828', // scanning line color
                                        FFLocalizations.of(context).getText(
                                          'fh7xw2hi' /* Cancel */,
                                        ), // cancel button text
                                        true, // whether to show the flash icon
                                        ScanMode.BARCODE,
                                      );

                                      _model.gS1ParsedData =
                                          await actions.parseGs1Scan(
                                        _model.scannedcode,
                                      );
                                      safeSetState(() {
                                        _model.enterSSCCTextController?.text =
                                            getJsonField(
                                          _model.gS1ParsedData,
                                          r'''$.serial''',
                                        ).toString();
                                        _model.enterSSCCFocusNode
                                            ?.requestFocus();
                                        WidgetsBinding.instance
                                            .addPostFrameCallback((_) {
                                          _model.enterSSCCTextController
                                              ?.selection = TextSelection(
                                            baseOffset: 0,
                                            extentOffset: _model
                                                .enterSSCCTextController!
                                                .text
                                                .length,
                                          );
                                        });
                                      });

                                      safeSetState(() {});
                                    },
                                    child: wrapWithModel(
                                      model: _model.scanButtonModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: ScanButtonWidget(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ].divide(SizedBox(height: 8.0)),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            '5irsapa1' /* Select Reason */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontStyle,
                                    ),
                                    color: Color(0xFF323394),
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
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
                            'kf6rwyoz' /* Sample for Doctors */,
                          ),
                          FFLocalizations.of(context).getText(
                            'r5bshkz7' /* Packaging Review */,
                          ),
                          FFLocalizations.of(context).getText(
                            'j5cnjtas' /* Laboratory Sample */,
                          ),
                          FFLocalizations.of(context).getText(
                            'qihynmp4' /* Criminal Investigation */,
                          ),
                          FFLocalizations.of(context).getText(
                            '6kuxvddx' /* Prequalification */,
                          ),
                          FFLocalizations.of(context).getText(
                            '7quay46k' /* Retention for future testing */,
                          ),
                          FFLocalizations.of(context).getText(
                            'af89iia7' /* Consumer Report */,
                          ),
                          FFLocalizations.of(context).getText(
                            'lk4ad3pq' /*  Product Documentation */,
                          ),
                          FFLocalizations.of(context).getText(
                            'vv9ivfp2' /* PMS Sampling */,
                          ),
                          FFLocalizations.of(context).getText(
                            '86bnjxmi' /*  Suspect Activity */,
                          ),
                          FFLocalizations.of(context).getText(
                            'waam3ben' /*  Storing Condition */,
                          )
                        ],
                        onChanged: (val) =>
                            safeSetState(() => _model.dropDownValue = val),
                        width: double.infinity,
                        height: 56.0,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
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
                          'us610qpr' /* Choose Reason */,
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
                    ].divide(SizedBox(height: 16.0)),
                  ),
                  Stack(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'rueez56h' /* Scanned Items */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF323394),
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontStyle,
                                    ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 225.0,
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
                                borderRadius: BorderRadius.circular(20.0),
                                border: Border.all(
                                  color: Colors.white,
                                ),
                              ),
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
                                    itemBuilder: (context, itemInListIndex) {
                                      final itemInListItem =
                                          itemInList[itemInListIndex];
                                      return ScannedSerialsToDecommissionWidget(
                                        key: Key(
                                            'Keylfx_${itemInListIndex}_of_${itemInList.length}'),
                                        scannedSerial: _model
                                            .scannedSerialToDecommission
                                            .elementAtOrNull(itemInListIndex)!,
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
                          ].divide(SizedBox(height: 12.0)),
                        ),
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
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FFButtonWidget(
                        onPressed: () {
                          print('Button pressed ...');
                        },
                        text: FFLocalizations.of(context).getText(
                          'wkp4w9yg' /* Confirm Decommission */,
                        ),
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 56.0,
                          padding: EdgeInsets.all(8.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Color(0xFF323394),
                          textStyle:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    font: GoogleFonts.interTight(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
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
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              'wyx096o2' /* Cancel */,
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontStyle,
                                      ),
                                      color: Color(0xFFD61823),
                                      fontSize: 20.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontStyle,
                                    ),
                          ),
                        ],
                      ),
                    ].divide(SizedBox(height: 16.0)),
                  ),
                ].divide(SizedBox(height: 24.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
