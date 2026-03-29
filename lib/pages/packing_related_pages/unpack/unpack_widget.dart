import '/components/empty_list_view_display/empty_list_view_display_widget.dart';
import '/components/loading/loading_widget.dart';
import '/components/scan_button/scan_button_widget.dart';
import '/components/scanned_serials_to_decommission/scanned_serials_to_decommission_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'unpack_model.dart';
export 'unpack_model.dart';

/// Design a modern Unpack All page for distributor operations.
///
/// - AppBar:    - Background: Primary Blue (#323394)    - Title: "Unpack All"
/// in bold, white    - Left: back arrow icon    - Right: scan barcode icon
/// (white) → shortcut to scan  - Page background: #FFFFFF  - Body layout
/// (vertical steps with modern cards):     Step 1: Scan SSCC    - Elevated
/// Card, rounded corners (20px), subtle shadow    - Inside:       - Row:
/// Barcode Icon (Primary Blue circle) + Text "Scan or Enter SSCC"       -
/// Below:            - Modern input field               - Placeholder: "Enter
/// SSCC manually"               - Border: rounded 12px, color #D7D1E3
///       - Left Icon: search           - TextButton (Accent Orange #F3601F)
/// with Barcode Icon, label: "Scan SSCC"     Step 2: SSCC Details    -
/// Appears after scanning    - Collapsible card (rounded 16px, light shadow)
///   - Title: "Items in SSCC"    - List of serials displayed as modern chips:
///         - Example chip: [📦 Serial 123456789]         - Chip background:
/// light grey #F8F8F8         - Text: #323394    - Option: "View All" small
/// text button     Step 3: Action - Unpack All    - Large modern action card
/// at bottom    - Centered content:        - Circle icon (Primary Blue
/// background, white "open box" icon)        - Title: "Unpack All" (24px,
/// bold, #323394)        - Subtitle: "Disassemble all items in this SSCC"
/// (#8181BC)        - Primary button:             - Full width             -
/// Label: "Confirm Unpack All"             - Background: gradient (#323394 →
/// #2B2B80)             - Text: white, bold             - Height: 54px,
/// border radius 16px
class UnpackWidget extends StatefulWidget {
  const UnpackWidget({super.key});

  static String routeName = 'Unpack';
  static String routePath = '/unpack';

  @override
  State<UnpackWidget> createState() => _UnpackWidgetState();
}

class _UnpackWidgetState extends State<UnpackWidget> {
  late UnpackModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UnpackModel());

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
          leading: Container(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.safePop();
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 24.0,
                ),
              ),
            ),
          ),
          title: Container(
            child: Text(
              FFLocalizations.of(context).getText(
                'uqyc29jn' /* UnPack */,
              ),
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    font: GoogleFonts.interTight(
                      fontWeight: FontWeight.w600,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                    ),
                    color: Colors.white,
                    fontSize: 23.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
            ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, -1.06),
              child: Padding(
                padding: EdgeInsets.all(6.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
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
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(
                            color: Colors.white,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(6.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            child: Icon(
                                              Icons.qr_code_scanner,
                                              color: Color(0xFF323394),
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
                                                _model.loading = true;
                                                safeSetState(() {});
                                                await _model.checkSerialStatus(
                                                  context,
                                                  serial: _model
                                                      .enterSSCCTextController
                                                      .text,
                                                );
                                                safeSetState(() {});
                                                _model.loading = false;
                                                safeSetState(() {});
                                              },
                                              autofocus: false,
                                              textInputAction:
                                                  TextInputAction.done,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                hintText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  's8llgy9z' /* Scan or enter Serial/SSCC */,
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
                                                _model.scannedResult =
                                                    await FlutterBarcodeScanner
                                                        .scanBarcode(
                                                  '#C62828', // scanning line color
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'tiaie4qg' /* Cancel */,
                                                  ), // cancel button text
                                                  true, // whether to show the flash icon
                                                  ScanMode.QR,
                                                );

                                                _model.parsedGs1Code =
                                                    await actions.parseGs1Scan(
                                                  _model.scannedResult,
                                                );
                                                safeSetState(() {
                                                  _model.enterSSCCTextController
                                                      ?.text = getJsonField(
                                                    _model.parsedGs1Code,
                                                    r'''$.serial''',
                                                  ).toString();
                                                  _model.enterSSCCFocusNode
                                                      ?.requestFocus();
                                                  WidgetsBinding.instance
                                                      .addPostFrameCallback(
                                                          (_) {
                                                    _model.enterSSCCTextController
                                                            ?.selection =
                                                        TextSelection.collapsed(
                                                      offset: _model
                                                          .enterSSCCTextController!
                                                          .text
                                                          .length,
                                                    );
                                                  });
                                                });
                                                await _model.checkSerialStatus(
                                                  context,
                                                  serial: getJsonField(
                                                    _model.parsedGs1Code,
                                                    r'''$.serial''',
                                                  ).toString(),
                                                );

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
                            ].divide(SizedBox(height: 16.0)),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                        child: Stack(
                          children: [
                            SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'mzp9dvp8' /* Scanned Items */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFF323394),
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLarge
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 6.0),
                                    child: Material(
                                      color: Colors.transparent,
                                      elevation: 2.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      child: Container(
                                        width: double.infinity,
                                        height: 518.56,
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
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          border: Border.all(
                                            color: Colors.white,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 20.0, 8.0, 0.0),
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
                                                      itemInList[
                                                          itemInListIndex];
                                                  return ScannedSerialsToDecommissionWidget(
                                                    key: Key(
                                                        'Keycs5_${itemInListIndex}_of_${itemInList.length}'),
                                                    scannedSerial: _model
                                                        .scannedSSCC
                                                        .elementAtOrNull(
                                                            itemInListIndex)!,
                                                    index: itemInListIndex,
                                                    deletAction: (index) async {
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
                                    ),
                                  ),
                                ].divide(SizedBox(height: 8.0)),
                              ),
                            ),
                            if (true)
                              wrapWithModel(
                                model: _model.emptyListViewDisplayModel,
                                updateCallback: () => safeSetState(() {}),
                                child: EmptyListViewDisplayWidget(
                                  listContent: _model.scannedSSCC,
                                ),
                              ),
                          ],
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () {
                          print('UnpackButton pressed ...');
                        },
                        text: FFLocalizations.of(context).getText(
                          '2kx0bgfp' /* Unpack */,
                        ),
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 54.0,
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
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                    ].divide(SizedBox(height: 8.0)),
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
    );
  }
}
