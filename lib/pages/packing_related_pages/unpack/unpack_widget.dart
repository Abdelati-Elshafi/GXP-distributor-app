import '/backend/api_requests/api_calls.dart';
import '/components/empty_list_view_display/empty_list_view_display_widget.dart';
import '/components/loading/loading_widget.dart';
import '/components/scan_button/scan_button_widget.dart';
import '/components/scanned_serials_to_decommission/scanned_serials_to_decommission_widget.dart';
import '/components/text_field_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
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
                'r2vbbwln' /* UnPack */,
              ),
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    font: GoogleFonts.interTight(
                      fontWeight: FontWeight.w600,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                    ),
                    color: Colors.white,
                    fontSize: 21.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
            ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, -1.06),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 40.0, 16.0, 10.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xFF04113D),
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
                                  color: Color(0xFF0D214D),
                                  borderRadius: BorderRadius.circular(16.0),
                                  border: Border.all(
                                    color: Color(0xFF1A2E6B),
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
                                                      .alternate,
                                              size: 24.0,
                                            ),
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
                                                  _model.alreadyScanned =
                                                      await actions
                                                          .checkStringInList(
                                                    _model
                                                        .textFieldModel
                                                        .enterSSCCTextController
                                                        .text,
                                                    _model.scannedSSCC.toList(),
                                                  );
                                                  if (_model.alreadyScanned!) {
                                                    var confirmDialogResponse =
                                                        await showDialog<bool>(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return AlertDialog(
                                                                  content: Text(
                                                                      'Already Scanned'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed: () => Navigator.pop(
                                                                          alertDialogContext,
                                                                          false),
                                                                      child: Text(
                                                                          'Cancel'),
                                                                    ),
                                                                    TextButton(
                                                                      onPressed: () => Navigator.pop(
                                                                          alertDialogContext,
                                                                          true),
                                                                      child: Text(
                                                                          'Confirm'),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            ) ??
                                                            false;
                                                  } else {
                                                    _model.checkSerialStatusApiResult =
                                                        await SerialStatusUpdateGroup
                                                            .checkSerialStatusCall
                                                            .call(
                                                      serial: _model
                                                          .textFieldModel
                                                          .enterSSCCTextController
                                                          .text,
                                                    );

                                                    if ((_model
                                                            .checkSerialStatusApiResult
                                                            ?.succeeded ??
                                                        true)) {
                                                      _model.addToScannedSSCC(_model
                                                          .textFieldModel
                                                          .enterSSCCTextController
                                                          .text);
                                                      safeSetState(() {});
                                                    }
                                                  }

                                                  _model.loading = false;
                                                  safeSetState(() {});

                                                  safeSetState(() {});
                                                },
                                              ),
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
                                                    'g4ou29ap' /* Cancel */,
                                                  ), // cancel button text
                                                  true, // whether to show the torch (camera LED) toggle icon
                                                  ScanMode.QR,
                                                );

                                                FFAppState().ScannedBarcode =
                                                    _model.scannedResult;
                                                safeSetState(() {});

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
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
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
                                        height: 350.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF04113D),
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
                                            color: Color(0xFF1A2E6B),
                                            width: 2.0,
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
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Padding(
                padding: EdgeInsets.all(14.0),
                child: FFButtonWidget(
                  onPressed: !(_model.scannedSSCC.isNotEmpty)
                      ? null
                      : () async {
                          _model.apiResult7cd =
                              await SerialStatusUpdateGroup.unpackSSCCCall.call(
                            ssccList: _model.scannedSSCC,
                          );

                          if ((_model.apiResult7cd?.succeeded ?? true)) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'SSCC Unpacked',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: Duration(milliseconds: 1000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).secondary,
                              ),
                            );
                          }
                          _model.scannedSSCC = [];
                          safeSetState(() {});
                          safeSetState(() {
                            _model.textFieldModel.enterSSCCTextController
                                ?.clear();
                          });

                          safeSetState(() {});
                        },
                  text: FFLocalizations.of(context).getText(
                    '2kx0bgfp' /* Unpack */,
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
                    disabledColor: FlutterFlowTheme.of(context).secondaryText,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
