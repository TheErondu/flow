import 'package:get_storage/get_storage.dart';

import 'api_manager.dart';
import '../../globals.dart' as globals;

const apiUrl = "http://192.168.40.31:8001/api";

final box = GetStorage();

dynamic userToken = box.read("token");

Future<dynamic> authCheckCall() {
  return ApiManager.instance.makeApiCall(
    callName: 'authCheck',
    apiUrl: '$apiUrl',
    callType: ApiCallType.GET,
    headers: {
      'Authorization': 'Bearer $userToken',
    },
    params: {},
    returnResponse: true,
  );
}

Future<dynamic> logoutCall() async {
  return ApiManager.instance.makeApiCall(
    callName: 'authCheck',
    apiUrl: '$apiUrl/logout',
    callType: ApiCallType.POST,
    headers: {
      'Authorization': 'Bearer $userToken',
    },
    params: {},
    returnResponse: true,
  );
}

Future<dynamic> loginCall(
    {String email = 'email',
    String password = 'password',
    String device_name = 'generic_mobile'}) {
  return ApiManager.instance.makeApiCall(
    callName: 'Login',
    apiUrl: '$apiUrl/login',
    callType: ApiCallType.POST,
    headers: {},
    params: {'email': email, 'password': password, 'device_name': device_name},
    bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
    returnResponse: true,
  );
}

Future<dynamic> getOblogsCall() {
  return ApiManager.instance.makeApiCall(
    callName: 'GetOblogs',
    apiUrl: '$apiUrl/oblogs',
    callType: ApiCallType.GET,
    headers: {
      'Authorization': 'Bearer $userToken',
    },
    params: {},
    returnResponse: true,
  );
}

Future<dynamic> getEditorLogsCall() {
  return ApiManager.instance.makeApiCall(
    callName: 'GetEditorLogs',
    apiUrl: '$apiUrl/logs/editors',
    callType: ApiCallType.GET,
    headers: {
      'Authorization': 'Bearer $userToken',
    },
    params: {},
    returnResponse: true,
  );
}

Future<dynamic> getMCRLogsCall() {
  return ApiManager.instance.makeApiCall(
    callName: 'GetMCRlogs',
    apiUrl: '$apiUrl/logs/mcr',
    callType: ApiCallType.GET,
    headers: {
      'Authorization': 'Bearer $userToken',
    },
    params: {},
    returnResponse: true,
  );
}

Future<dynamic> getDirReportsCall() {
  return ApiManager.instance.makeApiCall(
    callName: 'GetDirReports',
    apiUrl: '$apiUrl/reports',
    callType: ApiCallType.GET,
    headers: {
      'Authorization': 'Bearer $userToken',
    },
    params: {},
    returnResponse: true,
  );
}

Future<dynamic> getProdLogsCall() {
  return ApiManager.instance.makeApiCall(
    callName: 'GetProdLogs',
    apiUrl: '$apiUrl/logs/production',
    callType: ApiCallType.GET,
    headers: {
      'Authorization': 'Bearer $userToken',
    },
    params: {},
    returnResponse: true,
  );
}

Future<dynamic> getGraphicsLogsCall() {
  return ApiManager.instance.makeApiCall(
    callName: 'getGraphicsLogs',
    apiUrl: '$apiUrl/logs/graphics-news',
    callType: ApiCallType.GET,
    headers: {
      'Authorization': 'Bearer $userToken',
    },
    params: {},
    returnResponse: true,
  );
}

Future<dynamic> getGraphicsLogShowsCall() {
  return ApiManager.instance.makeApiCall(
    callName: 'getGraphicsLogShows',
    apiUrl: '$apiUrl/logs/graphics-shows',
    callType: ApiCallType.GET,
    headers: {
      'Authorization': 'Bearer $userToken',
    },
    params: {},
    returnResponse: true,
  );
}

Future<dynamic> getPrompterLogsCall() {
  return ApiManager.instance.makeApiCall(
    callName: 'getPrompterLogs',
    apiUrl: '$apiUrl/logs/prompter-news',
    callType: ApiCallType.GET,
    headers: {
      'Authorization': 'Bearer $userToken',
    },
    params: {},
    returnResponse: true,
  );
}

Future<dynamic> getPrompterLogShowsCall() {
  return ApiManager.instance.makeApiCall(
    callName: 'getGraphicsLogShows',
    apiUrl: '$apiUrl/logs/prompter-shows',
    callType: ApiCallType.GET,
    headers: {
      'Authorization': 'Bearer $userToken',
    },
    params: {},
    returnResponse: true,
  );
}

Future<dynamic> getStoreRequestsCall() {
  return ApiManager.instance.makeApiCall(
    callName: 'getStoreRequests',
    apiUrl: '$apiUrl/logs/store-requests',
    callType: ApiCallType.GET,
    headers: {
      'Authorization': 'Bearer $userToken',
    },
    params: {},
    returnResponse: true,
  );
}

Future<dynamic> getMyIssuesCall() {
  return ApiManager.instance.makeApiCall(
    callName: 'getMyIssues',
    apiUrl: '$apiUrl/issues',
    callType: ApiCallType.GET,
    headers: {
      'Authorization': 'Bearer $userToken',
    },
    params: {},
    returnResponse: true,
  );
}

Future<dynamic> getMessagesCall() {
  return ApiManager.instance.makeApiCall(
    callName: 'getMessages',
    apiUrl: '$apiUrl/messages',
    callType: ApiCallType.GET,
    headers: {
      'Authorization': 'Bearer $userToken',
    },
    params: {},
    returnResponse: true,
  );
}

Future<dynamic> getUserInfoCall() {
  return ApiManager.instance.makeApiCall(
    callName: 'GetUserInfo',
    apiUrl: '$apiUrl',
    callType: ApiCallType.GET,
    headers: {
      'Authorization': 'Bearer $userToken',
    },
    params: {},
    returnResponse: true,
  );
}

Future<dynamic> getStoreInfoCall() {
  return ApiManager.instance.makeApiCall(
    callName: 'getStoreInfo',
    apiUrl: '$apiUrl/my-store',
    callType: ApiCallType.GET,
    headers: {
      'Authorization': 'Bearer $userToken',
    },
    params: {},
    returnResponse: true,
  );
}
