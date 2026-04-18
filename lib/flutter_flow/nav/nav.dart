import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  bool showSplashImage = true;

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) => appStateNotifier.showSplashImage
          ? Builder(
              builder: (context) => Container(
                color: Colors.transparent,
                child: Image.asset(
                  'assets/images/20251003_1701_GXPTrace_Tech_Logo_simple_compose_01k6n603kefk1rxdd16z5es9n8.png',
                  fit: BoxFit.contain,
                ),
              ),
            )
          : LoginWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.showSplashImage
              ? Builder(
                  builder: (context) => Container(
                    color: Colors.transparent,
                    child: Image.asset(
                      'assets/images/20251003_1701_GXPTrace_Tech_Logo_simple_compose_01k6n603kefk1rxdd16z5es9n8.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              : LoginWidget(),
        ),
        FFRoute(
          name: MainWidget.routeName,
          path: MainWidget.routePath,
          builder: (context, params) => MainWidget(),
        ),
        FFRoute(
          name: StatusUpdateWidget.routeName,
          path: StatusUpdateWidget.routePath,
          builder: (context, params) => StatusUpdateWidget(),
        ),
        FFRoute(
          name: InboundMovementWidget.routeName,
          path: InboundMovementWidget.routePath,
          builder: (context, params) => InboundMovementWidget(),
        ),
        FFRoute(
          name: OutboundMovementWidget.routeName,
          path: OutboundMovementWidget.routePath,
          builder: (context, params) => OutboundMovementWidget(),
        ),
        FFRoute(
          name: PackAndRepackWidget.routeName,
          path: PackAndRepackWidget.routePath,
          builder: (context, params) => PackAndRepackWidget(),
        ),
        FFRoute(
          name: UnpackAllWidget.routeName,
          path: UnpackAllWidget.routePath,
          builder: (context, params) => UnpackAllWidget(),
        ),
        FFRoute(
          name: PackagesListWidget.routeName,
          path: PackagesListWidget.routePath,
          builder: (context, params) => PackagesListWidget(),
        ),
        FFRoute(
          name: PackageOperationWidget.routeName,
          path: PackageOperationWidget.routePath,
          builder: (context, params) => PackageOperationWidget(
            sSCC: params.getParam(
              'sSCC',
              ParamType.String,
            ),
            product: params.getParam(
              'product',
              ParamType.String,
            ),
            caseno: params.getParam(
              'caseno',
              ParamType.int,
            ),
            itemsno: params.getParam(
              'itemsno',
              ParamType.int,
            ),
            ssccproductserials: params.getParam<String>(
              'ssccproductserials',
              ParamType.String,
              isList: true,
            ),
          ),
        ),
        FFRoute(
          name: CasePackingWidget.routeName,
          path: CasePackingWidget.routePath,
          builder: (context, params) => CasePackingWidget(
            lastSavedCodes: params.getParam<String>(
              'lastSavedCodes',
              ParamType.String,
              isList: true,
            ),
            sscc: params.getParam(
              'sscc',
              ParamType.String,
            ),
            product: params.getParam(
              'product',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ReceivePageWidget.routeName,
          path: ReceivePageWidget.routePath,
          builder: (context, params) => ReceivePageWidget(
            inboundType: params.getParam(
              'inboundType',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: DecommissionWidget.routeName,
          path: DecommissionWidget.routePath,
          builder: (context, params) => DecommissionWidget(
            decommissionReason: params.getParam(
              'decommissionReason',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: OrdersListWidget.routeName,
          path: OrdersListWidget.routePath,
          builder: (context, params) => OrdersListWidget(),
        ),
        FFRoute(
          name: OrderDetailsWidget.routeName,
          path: OrderDetailsWidget.routePath,
          builder: (context, params) => OrderDetailsWidget(
            ordernumber: params.getParam(
              'ordernumber',
              ParamType.String,
            ),
            customer: params.getParam(
              'customer',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ProductDetailsWidget.routeName,
          path: ProductDetailsWidget.routePath,
          builder: (context, params) => ProductDetailsWidget(
            productname: params.getParam(
              'productname',
              ParamType.String,
            ),
            productGTIN: params.getParam(
              'productGTIN',
              ParamType.String,
            ),
            requiredQTY: params.getParam(
              'requiredQTY',
              ParamType.int,
            ),
            scannedQTY: params.getParam(
              'scannedQTY',
              ParamType.int,
            ),
            orderNO: params.getParam(
              'orderNO',
              ParamType.String,
            ),
            orderSSCC: params.getParam(
              'orderSSCC',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ShippingWidget.routeName,
          path: ShippingWidget.routePath,
          builder: (context, params) => ShippingWidget(),
        ),
        FFRoute(
          name: SampleDecommissionWidget.routeName,
          path: SampleDecommissionWidget.routePath,
          builder: (context, params) => SampleDecommissionWidget(
            decommissionReason: params.getParam(
              'decommissionReason',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: DamagedDecommissionWidget.routeName,
          path: DamagedDecommissionWidget.routePath,
          builder: (context, params) => DamagedDecommissionWidget(
            decommissionReason: params.getParam(
              'decommissionReason',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: UnpackWidget.routeName,
          path: UnpackWidget.routePath,
          builder: (context, params) => UnpackWidget(),
        ),
        FFRoute(
          name: ReturnShippingWidget.routeName,
          path: ReturnShippingWidget.routePath,
          builder: (context, params) => ReturnShippingWidget(),
        ),
        FFRoute(
          name: DestructionDecommissionWidget.routeName,
          path: DestructionDecommissionWidget.routePath,
          builder: (context, params) => DestructionDecommissionWidget(
            decommissionReason: params.getParam(
              'decommissionReason',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: LoginWidget.routeName,
          path: LoginWidget.routePath,
          builder: (context, params) => LoginWidget(),
        ),
        FFRoute(
          name: QueriesWidget.routeName,
          path: QueriesWidget.routePath,
          builder: (context, params) => QueriesWidget(),
        ),
        FFRoute(
          name: ReportsWidget.routeName,
          path: ReportsWidget.routePath,
          builder: (context, params) => ReportsWidget(),
        ),
        FFRoute(
          name: ExceptionsWidget.routeName,
          path: ExceptionsWidget.routePath,
          builder: (context, params) => ExceptionsWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  name: state.name,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(
                  key: state.pageKey, name: state.name, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
