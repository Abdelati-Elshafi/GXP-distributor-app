import '/backend/api_requests/api_calls.dart';
import '/components/loading/loading_widget.dart';
import '/components/order_card/order_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
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

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.loading = true;
      safeSetState(() {});
      _model.getOrdersApiResults =
          await OrdersAPIsGroup.getOrderByUserCall.call(
        username: FFAppState().userName,
        orderStatus: 'All',
      );

      if ((_model.getOrdersApiResults?.succeeded ?? true)) {
        _model.ordersData = OrdersAPIsGroup.getOrderByUserCall
            .ordersData(
              (_model.getOrdersApiResults?.jsonBody ?? ''),
            )!
            .toList()
            .cast<dynamic>();
        safeSetState(() {});
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Fail to connect  the server',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
              textAlign: TextAlign.center,
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
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
              FFLocalizations.of(context).getText(
                'parl21z3' /* Order List */,
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
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Builder(
                builder: (context) {
                  final itemInList = _model.ordersData.toList();

                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    itemCount: itemInList.length,
                    itemBuilder: (context, itemInListIndex) {
                      final itemInListItem = itemInList[itemInListIndex];
                      return Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 20.0, 10.0, 0.0),
                        child: OrderCardWidget(
                          key: Key(
                              'Key9z4_${itemInListIndex}_of_${itemInList.length}'),
                          ordernumber: getJsonField(
                            _model.ordersData.elementAtOrNull(itemInListIndex),
                            r'''$.orderNo''',
                          ).toString(),
                          customer: getJsonField(
                            _model.ordersData.elementAtOrNull(itemInListIndex),
                            r'''$.customer''',
                          ).toString(),
                          permitNo: getJsonField(
                            _model.ordersData.elementAtOrNull(itemInListIndex),
                            r'''$.permitNo''',
                          ).toString(),
                          status: getJsonField(
                            _model.ordersData.elementAtOrNull(itemInListIndex),
                            r'''$.status''',
                          ).toString(),
                        ),
                      );
                    },
                  );
                },
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
