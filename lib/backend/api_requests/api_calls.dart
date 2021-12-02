import 'package:brave/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'api_manager.dart';

const apiUrl = "http://192.168.231.31:8001/api";
Future getToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('token');
  return token;
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
