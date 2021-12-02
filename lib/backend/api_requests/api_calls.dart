import 'package:brave/flutter_flow/flutter_flow_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api_manager.dart';

dynamic ngrokUrl;

Future<dynamic> getNgrokUrl() async {
  return ApiManager.instance.makeApiCall(
    callName: 'GetNgrokUrL',
    apiUrl: 'https://qodestone-api.herokuapp.com/ngrok',
    callType: ApiCallType.GET,
    headers: {},
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
    apiUrl: 'http://9917-197-210-53-38.ngrok.io/api/login',
    callType: ApiCallType.POST,
    headers: {},
    params: {'email': email, 'password': password, 'device_name': device_name},
    bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
    returnResponse: true,
  );
}

Future<dynamic> getOblogsCall() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
   ngrokUrl = await getNgrokUrl();
  var userToken = prefs.getString('token');
 var baseUrl = (getJsonField(ngrokUrl, r'''$..url'''));
  return ApiManager.instance.makeApiCall(
    callName: 'GetOblogs',
    apiUrl: '$baseUrl/api/oblogs',
    callType: ApiCallType.GET,
    headers: {
      'Authorization': 'Bearer $userToken',
    },
    params: {},
    returnResponse: true,
  );
}

