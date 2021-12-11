library flutteronboardingscreens;

import 'dart:async';
import 'dart:io';
import 'package:brave/flutter_flow/flutter_flow_theme.dart';
import 'package:brave/flutter_flow/flutter_flow_widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../globals.dart' as globals;
import 'package:brave/backend/api_requests/api_calls.dart';
import 'package:brave/login/login_widget.dart';
import 'package:brave/main.dart';
import 'package:flutter/material.dart';
import 'OnbordingData.dart';

/// A IntroScreen Class.
///
///
class IntroScreen extends StatefulWidget {
  final List<OnbordingData> onbordingDataList;
  final MaterialPageRoute pageRoute;
  IntroScreen(this.onbordingDataList, this.pageRoute);

  void skipPage(BuildContext context) {
    Navigator.push(context, pageRoute);
  }

  @override
  IntroScreenState createState() {
    return new IntroScreenState();
  }
}

class IntroScreenState extends State<IntroScreen> {
  final PageController controller = new PageController();
  int currentPage = 0;
  bool lastPage = false;
  bool _loadingButton = false;
  dynamic check;
  bool hasToken = false;

  void _onPageChanged(int page) {
    setState(() {
      currentPage = page;
      if (currentPage == widget.onbordingDataList.length - 1) {
        lastPage = true;
      } else {
        lastPage = false;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      setState(() {
        controller.nextPage(
            duration: Duration(milliseconds: 300), curve: Curves.easeIn);
      });
      if (timer.tick == 2) {
        timer.cancel();
      }
    });
  }

  Widget _buildPageIndicator(int page) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: page == currentPage ? 10.0 : 6.0,
      width: page == currentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: page == currentPage ? Colors.blue : Colors.grey,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.all(10.0),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Expanded(
            flex: 1,
            child: new Container(),
          ),
          new Expanded(
            flex: 3,
            child: new PageView(
              children: widget.onbordingDataList,
              controller: controller,
              onPageChanged: _onPageChanged,
            ),
          ),
          new Expanded(
            flex: 1,
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                new TextButton(
                    child: new Text(lastPage ? "" : "",
                        style: new TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0)),
                    onPressed: () => null),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Container(
                    child: Row(
                      children: [
                        _buildPageIndicator(0),
                        _buildPageIndicator(1),
                        _buildPageIndicator(2),
                      ],
                    ),
                  ),
                ),
                lastPage
                    ?TextButton(
                  child: new Text("Continue",
                      style: new TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0)),
                        onPressed: () async {
                          setState(() => _loadingButton = true);
                          globals.userToken != null
                              ? setState(() => hasToken = true)
                              : setState(() => hasToken = false);
                          print(hasToken);
                          print(globals.userToken);
                          hasToken == true
                              ? await authCheck()
                              : await Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => LoginWidget(),
                                  ),
                                );
                        })
                    : TextButton(
                        onPressed: () => (null),
                        child: const Text(''),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  authCheck() async {
    try {
      check = await authCheckCall();
      var response = check['message'].toString();
      if (response == "Authenticated") {
        await Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => NavBarPage(initialPage: 'HomePage'),
          ),
        );
      } else {
        await Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => LoginWidget(),
          ),
        );
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
  }
}