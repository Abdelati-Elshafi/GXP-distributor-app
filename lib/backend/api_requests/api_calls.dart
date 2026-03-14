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
}

/// End OrdersAPIs Group Code

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
