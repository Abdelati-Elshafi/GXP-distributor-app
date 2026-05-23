import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start SerialStatusUpdate Group Code

class SerialStatusUpdateGroup {
  static String getBaseUrl() =>
      'https://nonrepentantly-noblest-jacki.ngrok-free.dev/api_test/api/v1/status';
  static Map<String, String> headers = {};
  static CheckSerialStatusCall checkSerialStatusCall = CheckSerialStatusCall();
  static UpdateSerialStatusCall updateSerialStatusCall =
      UpdateSerialStatusCall();
  static UnpackSSCCCall unpackSSCCCall = UnpackSSCCCall();
  static UnpackAllSSCCCall unpackAllSSCCCall = UnpackAllSSCCCall();
}

class CheckSerialStatusCall {
  Future<ApiCallResponse> call({
    String? serial = '',
  }) async {
    final baseUrl = SerialStatusUpdateGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "serial": "${escapeStringForJson(serial)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CheckSerialStatus',
      apiUrl: '${baseUrl}/check-serial',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? currentStatus(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.currentStatus''',
      ));
  int? itemsCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.ItemsCount''',
      ));
  String? serialType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.SerialType''',
      ));
}

class UpdateSerialStatusCall {
  Future<ApiCallResponse> call({
    String? status = '',
    String? reason = '',
    List<String>? serialsList,
    String? userName = '',
  }) async {
    final baseUrl = SerialStatusUpdateGroup.getBaseUrl();
    final serials = _serializeList(serialsList);

    final ffApiRequestBody = '''
{
  "statusType": "DAMAGED${escapeStringForJson(status)}",
  "reasonCode": "D03${escapeStringForJson(reason)}",
  "reasonDescription": "Torn packaging${escapeStringForJson(reason)}",
  "operatorId": "USER-001${escapeStringForJson(userName)}",
  "SerialList": [
    ${serials}
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'UpdateSerialStatus',
      apiUrl: '${baseUrl}/update',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UnpackSSCCCall {
  Future<ApiCallResponse> call({
    List<String>? ssccList,
  }) async {
    final baseUrl = SerialStatusUpdateGroup.getBaseUrl();
    final sscc = _serializeList(ssccList);

    final ffApiRequestBody = '''
{
  "SSCC": "${sscc}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'UnpackSSCC',
      apiUrl: '${baseUrl}/Unpack',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  String? sscc(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.SSCC''',
      ));
}

class UnpackAllSSCCCall {
  Future<ApiCallResponse> call({
    String? sscc = '',
  }) async {
    final baseUrl = SerialStatusUpdateGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "SSCC": "${escapeStringForJson(sscc)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'UnpackAllSSCC',
      apiUrl: '${baseUrl}/UnpackAll',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  String? sscc(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.SSCC''',
      ));
}

/// End SerialStatusUpdate Group Code

/// Start UserAccessMangment Group Code

class UserAccessMangmentGroup {
  static String getBaseUrl() =>
      'https://nonrepentantly-noblest-jacki.ngrok-free.dev/api_test';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static GetAllUsersCall getAllUsersCall = GetAllUsersCall();
  static UserLoginCall userLoginCall = UserLoginCall();
}

class GetAllUsersCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = UserAccessMangmentGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'GetAllUsers',
      apiUrl: '${baseUrl}/GetAllUsers',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'ngrok-skip-browser-warning': 'true',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? name(dynamic response) => getJsonField(
        response,
        r'''$[:].username''',
        true,
      ) as List?;
  List? role(dynamic response) => getJsonField(
        response,
        r'''$[:].role''',
        true,
      ) as List?;
}

class UserLoginCall {
  Future<ApiCallResponse> call({
    String? username = '',
    String? password = '',
  }) async {
    final baseUrl = UserAccessMangmentGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "username": "${escapeStringForJson(username)}",
  "password": "${escapeStringForJson(password)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'UserLogin',
      apiUrl: '${baseUrl}/UserLogin',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End UserAccessMangment Group Code

/// Start OrdersAPIs Group Code

class OrdersAPIsGroup {
  static String getBaseUrl() =>
      'https://nonrepentantly-noblest-jacki.ngrok-free.dev/api_test/api/v1/orders';
  static Map<String, String> headers = {};
  static GetOrderByUserCall getOrderByUserCall = GetOrderByUserCall();
  static GetOrderDetailsCall getOrderDetailsCall = GetOrderDetailsCall();
  static ProductSerialsDetailsCall productSerialsDetailsCall =
      ProductSerialsDetailsCall();
  static UpdateOrderProductsSerialsCall updateOrderProductsSerialsCall =
      UpdateOrderProductsSerialsCall();
}

class GetOrderByUserCall {
  Future<ApiCallResponse> call({
    String? username = '',
    String? orderStatus = '',
  }) async {
    final baseUrl = OrdersAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "username": "${escapeStringForJson(username)}",
  "Status": "${escapeStringForJson(orderStatus)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetOrderByUser',
      apiUrl: '${baseUrl}/GetOrderByUser',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? ordersData(dynamic response) => getJsonField(
        response,
        r'''$.data.items''',
        true,
      ) as List?;
  List<String>? ordersNO(dynamic response) => (getJsonField(
        response,
        r'''$.data.items[:].orderNo''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetOrderDetailsCall {
  Future<ApiCallResponse> call({
    String? orderNO = '',
  }) async {
    final baseUrl = OrdersAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "orderNo": "${escapeStringForJson(orderNO)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetOrderDetails',
      apiUrl: '${baseUrl}/GetOrderDetails',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? productsData(dynamic response) => getJsonField(
        response,
        r'''$.products''',
        true,
      ) as List?;
  String? gln(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.gln''',
      ));
  String? orderSSCC(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.sscc''',
      ));
  String? customer(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.customer''',
      ));
  String? orderNO(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.orderNo''',
      ));
}

class ProductSerialsDetailsCall {
  Future<ApiCallResponse> call({
    String? orderNo = '',
    String? gtin = '',
    String? sscc = '',
  }) async {
    final baseUrl = OrdersAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "orderNo": "${escapeStringForJson(orderNo)}",
  "gtin": "${escapeStringForJson(gtin)}",
  "SSCC": "${escapeStringForJson(sscc)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ProductSerialsDetails',
      apiUrl: '${baseUrl}/ProductSerialsDetails',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? productSerialsData(dynamic response) => getJsonField(
        response,
        r'''$.data.nodes''',
        true,
      ) as List?;
  List<String>? serials(dynamic response) => (getJsonField(
        response,
        r'''$.data.nodes[:].serial''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class UpdateOrderProductsSerialsCall {
  Future<ApiCallResponse> call({
    String? orderNO = '',
    String? product = '',
    String? gtin = '',
    List<String>? newSerialsList,
  }) async {
    final baseUrl = OrdersAPIsGroup.getBaseUrl();
    final newSerials = _serializeList(newSerialsList);

    final ffApiRequestBody = '''
{
  "OrderNo": "${escapeStringForJson(orderNO)}",
  "Product": "${escapeStringForJson(product)}",
  "GTIN": "${escapeStringForJson(gtin)}",
  "Serials": [
    ${newSerials}
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'UpdateOrderProductsSerials',
      apiUrl: '${baseUrl}/UpdateOrderProductsSerials',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End OrdersAPIs Group Code

/// Start Shipments Group Code

class ShipmentsGroup {
  static String getBaseUrl() =>
      'https://nonrepentantly-noblest-jacki.ngrok-free.dev/api_test/api/v1/shipments';
  static Map<String, String> headers = {};
  static CancelShippedCall cancelShippedCall = CancelShippedCall();
  static ConfirmShipmentCall confirmShipmentCall = ConfirmShipmentCall();
  static ReceivingShipmentCall receivingShipmentCall = ReceivingShipmentCall();
}

class CancelShippedCall {
  Future<ApiCallResponse> call({
    String? orderNo = 'SO-7781',
    String? reason = '',
  }) async {
    final baseUrl = ShipmentsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "order": "${escapeStringForJson(orderNo)}",
  "Reason": "${escapeStringForJson(reason)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Cancel Shipped',
      apiUrl: '${baseUrl}/CancelShipped',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  String? order(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.order''',
      ));
}

class ConfirmShipmentCall {
  Future<ApiCallResponse> call({
    String? orderNo = 'SO-7781',
    String? shippingType = '',
    String? reason = '',
  }) async {
    final baseUrl = ShipmentsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "order": "${escapeStringForJson(orderNo)}",
  "Type": "${escapeStringForJson(shippingType)}",
  "Reason": "${escapeStringForJson(reason)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Confirm Shipment',
      apiUrl: '${baseUrl}/ConfirmShipment',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  String? order(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.order''',
      ));
}

class ReceivingShipmentCall {
  Future<ApiCallResponse> call({
    List<String>? shipmentSSCCList,
    String? shipmentType = '',
  }) async {
    final baseUrl = ShipmentsGroup.getBaseUrl();
    final shipmentSSCC = _serializeList(shipmentSSCCList);

    final ffApiRequestBody = '''
{
  "ShipmentSSCC": "${shipmentSSCC}",
  "ShipmentType": "${escapeStringForJson(shipmentType)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Receiving Shipment',
      apiUrl: '${baseUrl}/ReceivingShipment',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  String? sscc(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.SSCC''',
      ));
}

/// End Shipments Group Code

/// Start SSCCOperations Group Code

class SSCCOperationsGroup {
  static String getBaseUrl() =>
      'https://nonrepentantly-noblest-jacki.ngrok-free.dev/api_test/api/v1/ssccoperations';
  static Map<String, String> headers = {};
  static GetPackedSSCCSerialsCall getPackedSSCCSerialsCall =
      GetPackedSSCCSerialsCall();
  static GetPackedSSCCListCall getPackedSSCCListCall = GetPackedSSCCListCall();
  static SavePackedSSCCSerialsCall savePackedSSCCSerialsCall =
      SavePackedSSCCSerialsCall();
  static GenerateSSCCCall generateSSCCCall = GenerateSSCCCall();
}

class GetPackedSSCCSerialsCall {
  Future<ApiCallResponse> call({
    String? sscc = '',
  }) async {
    final baseUrl = SSCCOperationsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "SSCC": "${escapeStringForJson(sscc)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetPackedSSCCSerials',
      apiUrl: '${baseUrl}/GetPackedSSCCSerials',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetPackedSSCCListCall {
  Future<ApiCallResponse> call({
    String? status = '',
  }) async {
    final baseUrl = SSCCOperationsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "Status": "${escapeStringForJson(status)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetPackedSSCCList',
      apiUrl: '${baseUrl}/GetPackedSSCClist',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? packedSSCCData(dynamic response) => getJsonField(
        response,
        r'''$.data.items''',
        true,
      ) as List?;
}

class SavePackedSSCCSerialsCall {
  Future<ApiCallResponse> call({
    String? sscc = '',
    List<String>? serial1List,
    List<String>? serial2List,
  }) async {
    final baseUrl = SSCCOperationsGroup.getBaseUrl();
    final serial1 = _serializeList(serial1List);
    final serial2 = _serializeList(serial2List);

    final ffApiRequestBody = '''
{
  "SSCC": "${escapeStringForJson(sscc)}",
  "NewSerials": [
    "${serial1}",
    "${serial2}"
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SavePackedSSCCSerials',
      apiUrl: '${baseUrl}/SavePackedSSCCSerials',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GenerateSSCCCall {
  Future<ApiCallResponse> call({
    String? type = '',
  }) async {
    final baseUrl = SSCCOperationsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "Type": "${escapeStringForJson(type)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GenerateSSCC',
      apiUrl: '${baseUrl}/GenerateSSCC',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? geteratedSSCC(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.SSCC''',
      ));
}

/// End SSCCOperations Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
