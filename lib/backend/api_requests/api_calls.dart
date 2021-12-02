import 'api_manager.dart';

Future<dynamic> getOblogsCall() {
  return ApiManager.instance.makeApiCall(
    callName: 'GetOblogs',
    apiUrl: 'http://9917-197-210-53-38.ngrok.io/api',
    callType: ApiCallType.GET,
    headers: {
      'Authorization': 'Bearer 3|vqAVxUPUAztcZOVPbdzaUe7J16gNTrq3ScjJoQSH',
    },
    params: {},
    returnResponse: true,
  );
}

Future<dynamic> loginCall({
  String email = 'email',
  String password = 'password',
}) {
  return ApiManager.instance.makeApiCall(
    callName: 'Login',
    apiUrl: 'http://9917-197-210-53-38.ngrok.io/api/login',
    callType: ApiCallType.POST,
    headers: {},
    params: {
      'email': email,
      'password': password,
    },
    bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
    returnResponse: true,
  );
}

Future<dynamic> getUserInfoCall() {
  return ApiManager.instance.makeApiCall(
    callName: 'GetUserInfo',
    apiUrl: 'http://9917-197-210-53-38.ngrok.io/api/',
    callType: ApiCallType.GET,
    headers: {
      'Authorization': 'Bearer 1|MuOOaqcyT2ld8o1aKSnl7IJtADYZQat57Ul3yKa7',
    },
    params: {},
    returnResponse: true,
  );
}
