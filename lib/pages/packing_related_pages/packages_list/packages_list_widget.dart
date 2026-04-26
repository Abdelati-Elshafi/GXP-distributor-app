import '/components/addnewsscc/addnewsscc_widget.dart';
import '/components/empty_list_view_display/empty_list_view_display_widget.dart';
import '/components/package_card/package_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
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
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Builder(
                  builder: (context) {
                    final itemInlist = _model.packages.toList();

                    return ListView.separated(
                      padding: EdgeInsets.fromLTRB(
                        0,
                        16.0,
                        0,
                        80.0,
                      ),
                      scrollDirection: Axis.vertical,
                      itemCount: itemInlist.length,
                      separatorBuilder: (_, __) => SizedBox(height: 12.0),
                      itemBuilder: (context, itemInlistIndex) {
                        final itemInlistItem = itemInlist[itemInlistIndex];
                        return wrapWithModel(
                          model: _model.packageCardModels.getModel(
                            itemInlistItem,
                            itemInlistIndex,
                          ),
                          updateCallback: () => safeSetState(() {}),
                          child: PackageCardWidget(
                            key: Key(
                              'Key0ut_${itemInlistItem}',
                            ),
                            updateViability: false,
                          ),
                        );
                      },
                    );
                  },
                ),
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
                      listContent: _model.packages,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
