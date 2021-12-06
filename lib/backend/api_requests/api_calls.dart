
import 'package:shared_preferences/shared_preferences.dart';
import 'api_manager.dart';

const apiUrl = "https://nbd.bravetech.media/api";
Future getToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('token');
  return token;
}

Future<dynamic> authCheckCall() async {
  var userToken = await getToken();
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

Future<dynamic> getOblogsCall() async {
  var userToken = await getToken();
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


Future<dynamic> getEditorLogsCall() async {
  var userToken = await getToken();
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

Future<dynamic> getMCRLogsCall() async {
  var userToken = await getToken();
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


Future<dynamic> getDirReportsCall() async {
  var userToken = await getToken();
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
Future<dynamic> getProdLogsCall() async {
  var userToken = await getToken();
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

Future<dynamic> getGraphicsLogsCall() async {
  var userToken = await getToken();
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

Future<dynamic> getGraphicsLogShowsCall() async {
  var userToken = await getToken();
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

Future<dynamic> getPrompterLogsCall() async {
  var userToken = await getToken();
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

Future<dynamic> getPrompterLogShowsCall() async {
  var userToken = await getToken();
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

Future<dynamic> getStoreRequestsCall() async {
  var userToken = await getToken();
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

Future<dynamic> getMyIssuesCall() async {
  var userToken = await getToken();
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


Future<dynamic> getMessagesCall() async {
  var userToken = await getToken();
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

Future<dynamic> getUserInfoCall() async {
    var userToken = await getToken();
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
