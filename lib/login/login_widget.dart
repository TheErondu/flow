
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';
import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../globals.dart' as globals;
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginWidget extends StatefulWidget {
  LoginWidget({Key key, this.action}) : super(key: key);
  final action;

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  TextEditingController textController1;
  TextEditingController textController2;
  bool passwordVisibility;
  bool _loadingButton = false;
  bool isAuthenticated = false;
  dynamic accessToken;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    passwordVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional(0, 0),
            child: Image.network(
              'https://picsum.photos/seed/329/900',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: AlignmentDirectional(-0.14, -0.08),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Color(0x46444D59),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.asset(
                    'assets/images/login-bg.jpg',
                  ).image,
                ),
              ),
              child: Align(
                alignment: AlignmentDirectional(0, 0.56),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(40, 0, 40, 20),
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color(0x66EEEEEE),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                          child: TextFormField(
                            controller: textController1,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: 'Username',
                              hintStyle: GoogleFonts.getFont(
                                'Roboto',
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                            ),
                            style: GoogleFonts.getFont(
                              'Roboto',
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(40, 0, 40, 20),
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color(0x65EEEEEE),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                          child: TextFormField(
                            controller: textController2,
                            obscureText: !passwordVisibility,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: GoogleFonts.getFont(
                                'Roboto',
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              suffixIcon: InkWell(
                                onTap: () => setState(
                                  () =>
                                      passwordVisibility = !passwordVisibility,
                                ),
                                child: Icon(
                                  passwordVisibility
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  size: 22,
                                ),
                              ),
                            ),
                            style: GoogleFonts.getFont(
                              'Roboto',
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        setState(() => _loadingButton = true);
                        try {
                          accessToken = await loginCall(
                            email: textController1.text,
                            password: textController2.text,
                          );
                          var error =
                              (getJsonField(accessToken, r'''$.error'''));
                          if (error == null) {
                            isAuthenticated = true;

                            var name = accessToken['name'].toString();
                            var mytoken =
                                accessToken['access_token'].toString();
                            var userId = accessToken['user_id'].toString();
                            var role = accessToken['role'].toString();
                            var department =
                                accessToken['department'].toString();
                            var departmentId =
                                accessToken['department_id'].toString();

                            box.write("name", name);
                           box.write("userId", userId);
                           box.write("role", role);
                            box.write("department", department);
                            box.write("department_id", departmentId);
                            box.write("token", mytoken);

                            dynamic userToken = box.read("token");
                            print(userToken);

                            await Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (context) => NavBarPage(
                                    initialPage: 'HomePage',
                                  ),
                                ),
                                (Route route) => false);
                          } else {
                            await _showToastError(context);
                          }
                        } on SocketException catch (e) {
                          // Display an alert, no internet
                          print('No Internet or Server Down');
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: Text('Error contacting Brave Server!'),
                              content: Text(
                                  "No internet or Server is Down : Check your internet settings."),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: const Text('Ok'),
                                ),
                              ],
                            ),
                          );
                        } finally {
                          setState(() => _loadingButton = false);
                        }
                      },
                      text: 'Get Started',
                      options: FFButtonOptions(
                        width: 300,
                        height: 55,
                        color: Color(0xFF3C5DB0),
                        textStyle: GoogleFonts.getFont(
                          'Roboto',
                          color: Color(0xFFFAFAFA),
                          fontSize: 18,
                        ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 2,
                        ),
                        borderRadius: 30,
                      ),
                      loading: _loadingButton,
                    )
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0, -0.59),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 100),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.asset(
                  'assets/images/brave_logo.jpeg',
                  width: 200,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _showToastError(BuildContext context) {
    var loginError = (getJsonField(accessToken, r'''$.error'''));
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(loginError),
        action: SnackBarAction(
            label: 'Close', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
}
