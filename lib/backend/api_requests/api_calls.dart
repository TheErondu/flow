import 'api_manager.dart';

Future<dynamic> loginCall({
  String email = 'email',
  String password = 'password',
  String device_name = 'generic_mobile'
}) {
  return ApiManager.instance.makeApiCall(
    callName: 'Login',
    apiUrl: 'https://nbd.bravetech.media/api/login',
    callType: ApiCallType.POST,
    headers: {},
    params: {
      'email': email,
      'password': password,
      'device_name':device_name
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
