import 'api_manager.dart';

Future<dynamic> loginCall({
  String email = 'email',
  String password = 'password',
}) {
  return ApiManager.instance.makeApiCall(
    callName: 'Login',
    apiUrl: 'https://nbd.bravetech.media/api/token',
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

Future<dynamic> getOblogsCall() {
  return ApiManager.instance.makeApiCall(
    callName: 'GetOblogs',
    apiUrl: 'https://nbd.bravetech.media/api/oblogs',
    callType: ApiCallType.GET,
    headers: {
      'Authorization': 'Bearer 3|vqAVxUPUAztcZOVPbdzaUe7J16gNTrq3ScjJoQSH',
    },
    params: {},
    returnResponse: true,
  );
}
