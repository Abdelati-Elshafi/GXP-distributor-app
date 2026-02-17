import '/components/order_card/order_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'orders_list_model.dart';
export 'orders_list_model.dart';

/// Create a page "Orders".
///
/// AppBar: title "Orders", background Primary Blue (#323394), white text.
///
/// Body:
/// - Vertical list of cards. Each card displays:
///    - Title: "Order #12345" bold in #323394
///    - Subtitle: "Customer: Pharmacy A | Date: 2025-09-04"
///    - Right side: Status chip (Pending = gray, In Progress = orange,
/// Completed = green)
///    - Trailing: Icon button ⋮ (more options)
/// - On tap ⋮ open bottom sheet with 3 buttons:
///    1. "Complete Order" (Primary Blue background, white text)
///    2. "Print SSCC" (Accent Orange #F3601F background, white text)
///    3. "Edit" (outlined button with border #D7D1E3, text #323394)
/// - Cards have rounded corners (16px), soft shadow, white background.
class OrdersListWidget extends StatefulWidget {
  const OrdersListWidget({super.key});

  static String routeName = 'OrdersList';
  static String routePath = '/ordersList';

  @override
  State<OrdersListWidget> createState() => _OrdersListWidgetState();
}

class _OrdersListWidgetState extends State<OrdersListWidget> {
  late OrdersListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OrdersListModel());
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
            borderColor: Colors.transparent,
            borderRadius: 24.0,
            borderWidth: 1.0,
            buttonSize: 48.0,
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
              'yacs3hj4' /* Order List */,
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
            child: ListView(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              children: [
                wrapWithModel(
                  model: _model.orderCardModel,
                  updateCallback: () => safeSetState(() {}),
                  child: OrderCardWidget(),
                ),
              ].divide(SizedBox(height: 16.0)),
            ),
          ),
        ),
      ),
    );
  }
}
