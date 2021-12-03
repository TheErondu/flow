import 'api_manager.dart';

Future<dynamic> getDirReportsCall() {
  return ApiManager.instance.makeApiCall(
    callName: 'GetDirReports',
    apiUrl: 'https://nbd.bravetech.media/api/reports',
    callType: ApiCallType.GET,
    headers: {
      'Authorization': 'Bearer 66|t1RiW72NWsTYjCTT8gGGfY3hAQFz4HeiHeCakuWU',
    },
    params: {},
    returnResponse: true,
  );
}

Future<dynamic> getUserInfoCall() {
  return ApiManager.instance.makeApiCall(
    callName: 'GetUserInfo',
    apiUrl: 'https://nbd.bravetech.media/api/',
    callType: ApiCallType.GET,
    headers: {
      'Authorization': 'Bearer 1|MuOOaqcyT2ld8o1aKSnl7IJtADYZQat57Ul3yKa7',
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
    apiUrl: 'https://nbd.bravetech.media/api/login',
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
