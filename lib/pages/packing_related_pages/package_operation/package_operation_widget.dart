import '/components/empty_list_view_display/empty_list_view_display_widget.dart';
import '/components/package_card/package_card_widget.dart';
import '/components/serial_card/serial_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package_operation_model.dart';
export 'package_operation_model.dart';

/// Create a modern gradient-style page called "Pack New SSCC".
///
/// - AppBar:
///    - Transparent, no elevation
///    - Back arrow icon in white
///
/// - Header Section (top):
///    - Full-width gradient background (from Primary Blue #323394 to Accent
/// Orange #F3601F, diagonal)
///    - Rounded bottom corners 24px
///    - Centered content:
///        - Large bold white text: show generated SSCC number
///        - Small subtitle below in semi-transparent white (#FFFFFFCC):
/// "Cases: [X] | Items: [Y]"
///    - Height ~ 160px
///
/// - Body:
///    - White background
///    - Vertical ListView of scanned cases
///    - Each row styled as:
///        - Left: Case ID (bold, #323394)
///        - Middle: small rounded tag "Items: [count]" with light gray
/// background
///        - Right: status icon (✅ green or ⚠️ orange)
///    - Dividers (#D7D1E3) between rows
///
/// - Floating Action Button:
///    - Large circular button, slightly floating above list, positioned
/// bottom right
///    - Background: Accent Orange (#F3601F)
///    - White scanner/camera icon
///    - On tap: open scanner and add case to list
///
/// - Bottom Actions:
///    - Full-width gradient button (from Blue #323394 to Orange #F3601F),
/// white bold text: "Confirm Pack"
///    - Below: small text button "Cancel Pack" in gray (#8181BC), centered
class PackageOperationWidget extends StatefulWidget {
  const PackageOperationWidget({
    super.key,
    String? sSCC,
    String? product,
    int? caseno,
    int? itemsno,
    required this.ssccproductserials,
  })  : this.sSCC = sSCC ?? 'SSCC',
        this.product = product ?? 'GXP-Pharma',
        this.caseno = caseno ?? 0,
        this.itemsno = itemsno ?? 0;

  final String sSCC;
  final String product;
  final int caseno;
  final int itemsno;
  final List<String>? ssccproductserials;

  static String routeName = 'PackageOperation';
  static String routePath = '/packageOperation';

  @override
  State<PackageOperationWidget> createState() => _PackageOperationWidgetState();
}

class _PackageOperationWidgetState extends State<PackageOperationWidget> {
  late PackageOperationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PackageOperationModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.serialsList = widget.ssccproductserials!.toList().cast<String>();
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
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            context.pushNamed(
              CasePackingWidget.routeName,
              queryParameters: {
                'lastSavedCodes': serializeParam(
                  _model.serialsList,
                  ParamType.String,
                  isList: true,
                ),
                'sscc': serializeParam(
                  widget.sSCC,
                  ParamType.String,
                ),
                'product': serializeParam(
                  widget.product,
                  ParamType.String,
                ),
              }.withoutNulls,
            );
          },
          backgroundColor: Color(0xFFF15B29),
          elevation: 3.0,
          child: Icon(
            Icons.qr_code_scanner,
            color: Colors.white,
            size: 24.0,
          ),
        ),
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
            FFLocalizations.of(context).getText(
              'yu0f6bmp' /* Pack Process */,
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
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            8.0, 10.0, 8.0, 20.0),
                        child: wrapWithModel(
                          model: _model.packageCardModel,
                          updateCallback: () => safeSetState(() {}),
                          child: PackageCardWidget(
                            sSCC: widget.sSCC,
                            itemsNO: valueOrDefault<int>(
                              _model.serialsList.length,
                              9,
                            ),
                            updateViability: true,
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 2.0,
                        color: FlutterFlowTheme.of(context).mainButtons,
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(5.0, 10.0, 5.0, 0.0),
                        child: Container(
                          width: 387.9,
                          height: 537.99,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Stack(
                                    children: [
                                      Builder(
                                        builder: (context) {
                                          final iteminlist =
                                              _model.serialsList.toList();

                                          return ListView.separated(
                                            padding: EdgeInsets.fromLTRB(
                                              0,
                                              10.0,
                                              0,
                                              0,
                                            ),
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: iteminlist.length,
                                            separatorBuilder: (_, __) =>
                                                SizedBox(height: 3.0),
                                            itemBuilder:
                                                (context, iteminlistIndex) {
                                              final iteminlistItem =
                                                  iteminlist[iteminlistIndex];
                                              return wrapWithModel(
                                                model: _model.serialCardModels
                                                    .getModel(
                                                  iteminlistIndex.toString(),
                                                  iteminlistIndex,
                                                ),
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: SerialCardWidget(
                                                  key: Key(
                                                    'Keyx67_${iteminlistIndex.toString()}',
                                                  ),
                                                  no: iteminlistIndex,
                                                  serial: _model.serialsList
                                                      .elementAtOrNull(
                                                          iteminlistIndex)!,
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                      if (true)
                                        wrapWithModel(
                                          model:
                                              _model.emptyListViewDisplayModel,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: EmptyListViewDisplayWidget(
                                            listContent: _model.serialsList,
                                          ),
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
