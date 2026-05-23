import '/backend/api_requests/api_calls.dart';
import '/components/empty_list_view_display/empty_list_view_display_widget.dart';
import '/components/loading/loading_widget.dart';
import '/components/scan_button/scan_button_widget.dart';
import '/components/scanned_serials_to_decommission/scanned_serials_to_decommission_widget.dart';
import '/components/text_field_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'damaged_decommission_model.dart';
export 'damaged_decommission_model.dart';

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
class DamagedDecommissionWidget extends StatefulWidget {
  const DamagedDecommissionWidget({
    super.key,
    required this.decommissionReason,
  });

  final String? decommissionReason;

  static String routeName = 'DamagedDecommission';
  static String routePath = '/damagedDecommission';

  @override
  State<DamagedDecommissionWidget> createState() =>
      _DamagedDecommissionWidgetState();
}

class _DamagedDecommissionWidgetState extends State<DamagedDecommissionWidget> {
  late DamagedDecommissionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DamagedDecommissionModel());
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
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                                  10.0, 0.0, 0.0, 3.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'bp8peuxd' /* Scan Items */,
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
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  5.0, 0.0, 5.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xFF04113D),
                                  borderRadius: BorderRadius.circular(16.0),
                                  border: Border.all(
                                    color: Color(0xFF64B4FF),
                                    width: 1.0,
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
                                                  safeSetState(() {});
                                                  var confirmDialogResponse =
                                                      await showDialog<bool>(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return AlertDialog(
                                                                title: Text(
                                                                    'test'),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext,
                                                                            false),
                                                                    child: Text(
                                                                        'Cancel'),
                                                                  ),
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
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
                                                  _model.alreadyScanned =
                                                      await actions
                                                          .checkStringInList(
                                                    _model
                                                        .textFieldModel
                                                        .enterSSCCTextController
                                                        .text,
                                                    _model
                                                        .scannedSerialToDecommission
                                                        .toList(),
                                                  );
                                                  if (_model.alreadyScanned!) {
                                                    confirmDialogResponse =
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
                                                      _model.addToScannedSerialToDecommission(
                                                          _model
                                                              .textFieldModel
                                                              .enterSSCCTextController
                                                              .text);
                                                      safeSetState(() {});
                                                    } else {
                                                      await action_blocks
                                                          .serverConnectionFail(
                                                              context);
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
                                                _model.scannedcode =
                                                    await FlutterBarcodeScanner
                                                        .scanBarcode(
                                                  '#C62828', // scanning line color
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '2mncwvuj' /* Cancel */,
                                                  ), // cancel button text
                                                  true, // whether to show the torch (camera LED) toggle icon
                                                  ScanMode.BARCODE,
                                                );

                                                if (!(_model.scannedcode == '-1'
                                                    ? true
                                                    : false)) {
                                                  FFAppState().ScannedBarcode =
                                                      _model.scannedcode;
                                                  safeSetState(() {});
                                                  var confirmDialogResponse =
                                                      await showDialog<bool>(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return AlertDialog(
                                                                title: Text(_model
                                                                    .scannedcode),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext,
                                                                            false),
                                                                    child: Text(
                                                                        'Cancel'),
                                                                  ),
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
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
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ].divide(SizedBox(height: 4.0)),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 3.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'srh2u3yg' /* Select Reason */,
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
                                'D01',
                                'D02',
                                'D03',
                                'D04',
                                'D05',
                                'D06',
                                'D07'
                              ]),
                              optionLabels: [
                                FFLocalizations.of(context).getText(
                                  'al87z6c1' /* Broken */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '6akzx73g' /* Unfolded */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'wyma91l3' /* Torn */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'cs44nr7j' /* 2D Matrix not readable  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'seq7zh8w' /* Smashed */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'shlwul9n' /* Damage due To liquid spill  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'ti3jboe4' /* Other */,
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
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
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
                                'l5glqqwp' /* Choose Reason */,
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
                              borderRadius: 8.0,
                              margin: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 10.0, 0.0),
                              hidesUnderline: true,
                              isSearchable: false,
                              isMultiSelect: false,
                            ),
                          ),
                        ].divide(SizedBox(height: 4.0)),
                      ),
                      Stack(
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 3.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'fcr735ur' /* Scanned Items */,
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
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 0.0, 5.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 280.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF0D214D),
                                    boxShadow: [
                                      FlutterFlowTheme.of(context)
                                          .designToken
                                          .shadow
                                          .lg
                                    ],
                                    borderRadius: BorderRadius.circular(20.0),
                                    border: Border.all(
                                      color: Color(0xFF1A2E6B),
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
                                                  'Keyt34_${itemInListIndex}_of_${itemInList.length}'),
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
                            ].divide(SizedBox(height: 4.0)),
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FFButtonWidget(
                            onPressed: !((_model.scannedSerialToDecommission
                                        .isNotEmpty) &&
                                    (_model.reasonDropDownValue != null &&
                                        _model.reasonDropDownValue != ''))
                                ? null
                                : () async {
                                    _model.loading = true;
                                    safeSetState(() {});
                                    _model.updateSerialStatusApiResult =
                                        await SerialStatusUpdateGroup
                                            .updateSerialStatusCall
                                            .call(
                                      status: widget.decommissionReason,
                                      reason: _model.reasonDropDownValue,
                                      serialsList:
                                          _model.scannedSerialToDecommission,
                                      userName: FFAppState().userName,
                                    );

                                    if ((_model.updateSerialStatusApiResult
                                            ?.succeeded ??
                                        true)) {
                                      _model.scannedSerialToDecommission = [];
                                      safeSetState(() {});
                                      safeSetState(() {
                                        _model.reasonDropDownValueController
                                            ?.reset();
                                        _model.reasonDropDownValue = null;
                                      });
                                      safeSetState(() {
                                        _model.textFieldModel
                                            .enterSSCCTextController
                                            ?.clear();
                                      });
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Serials Statues Updated ',
                                            style: TextStyle(
                                              color: Color(0xFFDDDDDD),
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                        ),
                                      );
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Faild To Connect The Server',
                                            style: TextStyle(
                                              color: Color(0xFFDDDDDD),
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .error,
                                        ),
                                      );
                                    }

                                    _model.loading = false;
                                    safeSetState(() {});

                                    safeSetState(() {});
                                  },
                            text: FFLocalizations.of(context).getText(
                              'zsrlf346' /* Confirm Decommission */,
                            ),
                            options: FFButtonOptions(
                              width: 300.0,
                              height: 52.0,
                              padding: EdgeInsets.all(8.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Color(0x711A8267),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
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
                                color: Color(0xFF1A8267),
                              ),
                              borderRadius: BorderRadius.circular(16.0),
                              disabledColor:
                                  FlutterFlowTheme.of(context).alternate,
                            ),
                          ),
                        ].divide(SizedBox(height: 16.0)),
                      ),
                    ].divide(SizedBox(height: 24.0)),
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
