import '/backend/api_requests/api_calls.dart';
import '/components/addnewsscc/addnewsscc_widget.dart';
import '/components/empty_list_view_display/empty_list_view_display_widget.dart';
import '/components/loading/loading_widget.dart';
import '/components/package_card/package_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'packages_list_model.dart';
export 'packages_list_model.dart';

/// Create a modern subpage "Packing Options" under Unpack & Repack.
///
/// - AppBar: Primary Blue (#323394), title "Unpack & Repack", left back
/// arrow.
/// - Background: White.
///
/// - Centered card:
///    - Circle icon (Primary Blue background, white box 📦 icon)
///    - Title: "Packing Options" in bold #323394
///    - Subtitle: "Choose how you want to pack products" in #8181BC
///
/// - Two large buttons stacked vertically:
///    1. "Pack New SSCC" → background #323394, white text, rounded 16px, left
/// icon ➕
///    2. "Pack Into Existing SSCC" → background #F3601F, white text, rounded
/// 16px, left icon 🔄
///
/// - Small caption under buttons: "Packing links scanned products into a
/// shipping container (SSCC)." in #8181BC
class PackagesListWidget extends StatefulWidget {
  const PackagesListWidget({super.key});

  static String routeName = 'PackagesList';
  static String routePath = '/packagesList';

  @override
  State<PackagesListWidget> createState() => _PackagesListWidgetState();
}

class _PackagesListWidgetState extends State<PackagesListWidget> {
  late PackagesListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PackagesListModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.loading = true;
      safeSetState(() {});
      _model.getPackedSSCCListApiResult =
          await SSCCOperationsGroup.getPackedSSCCListCall.call(
        status: 'All',
      );

      if ((_model.getPackedSSCCListApiResult?.succeeded ?? true)) {
        _model.packages = SSCCOperationsGroup.getPackedSSCCListCall
            .packedSSCCData(
              (_model.getPackedSSCCListApiResult?.jsonBody ?? ''),
            )!
            .toList()
            .cast<dynamic>();
        safeSetState(() {});
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
                context.pushNamed(PackAndRepackWidget.routeName);
              },
            ),
          ),
          title: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
            child: Text(
              FFLocalizations.of(context).getText(
                'uukv59ly' /* Packages List */,
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
            Padding(
              padding: EdgeInsets.all(7.0),
              child: Builder(
                builder: (context) {
                  final itemAtIndex = _model.packages.toList();

                  return ListView.separated(
                    padding: EdgeInsets.fromLTRB(
                      0,
                      16.0,
                      0,
                      80.0,
                    ),
                    scrollDirection: Axis.vertical,
                    itemCount: itemAtIndex.length,
                    separatorBuilder: (_, __) => SizedBox(height: 12.0),
                    itemBuilder: (context, itemAtIndexIndex) {
                      final itemAtIndexItem = itemAtIndex[itemAtIndexIndex];
                      return wrapWithModel(
                        model: _model.packageCardModels.getModel(
                          itemAtIndexItem.toString(),
                          itemAtIndexIndex,
                        ),
                        updateCallback: () => safeSetState(() {}),
                        updateOnChange: true,
                        child: PackageCardWidget(
                          key: Key(
                            'Key0ut_${itemAtIndexItem.toString()}',
                          ),
                          sSCC: getJsonField(
                            _model.packages.elementAtOrNull(itemAtIndexIndex),
                            r'''$.SSCC''',
                          ).toString(),
                          itemsNO: 0,
                          updateViability: false,
                          serials: _model.addnewssccModel.emptylist,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            if (true)
              Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: wrapWithModel(
                  model: _model.addnewssccModel,
                  updateCallback: () => safeSetState(() {}),
                  child: AddnewssccWidget(),
                ),
              ),
            if (true)
              wrapWithModel(
                model: _model.emptyListViewDisplayModel,
                updateCallback: () => safeSetState(() {}),
                child: EmptyListViewDisplayWidget(
                  listContent:
                      _model.packages.map((e) => e.toString()).toList(),
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
