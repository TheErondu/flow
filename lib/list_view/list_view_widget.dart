import 'package:brave/flutter_flow/flutter_flow_widgets.dart';
import 'package:brave/index/index_widget.dart';
import 'package:brave/widgets/report_categories.dart';
import 'package:lottie/lottie.dart';
import '../globals.dart' as globals;
import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ReportsLandingWidget extends StatefulWidget {
  const ReportsLandingWidget({Key key}) : super(key: key);

  @override
  _ReportsLandingWidgetState createState() => _ReportsLandingWidgetState();
}

class _ReportsLandingWidgetState extends State<ReportsLandingWidget>
    with TickerProviderStateMixin {
  AnimationController _controller;

  Future<dynamic> getDirReports;
  TextEditingController searchFieldController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool _loadingButton = false;

  @override
  void initState() {
    super.initState();
    searchFieldController = TextEditingController();
    getDirReports = getDirReportsCall();
    _controller = AnimationController(
      duration: Duration(seconds: (5)),
      vsync: this,
    );
    print(globals.userToken);
  }
  @override
dispose() {
  _controller.dispose(); // you need this
  super.dispose();
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF090F13),
        automaticallyImplyLeading: true,
        title: Text(
          'Logs',
          style: FlutterFlowTheme.title1.override(
            fontFamily: 'Lexend Deca',
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: Color(0xFF262D34),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                FutureBuilder<dynamic>(
                  future: getDirReports,
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: SpinKitChasingDots(
                            color: Color(0xFFCCC9C9),
                            size: 50,
                          ),
                        ),
                      );
                    }
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Report Categories',
                                style: FlutterFlowTheme.bodyText2.override(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xFF8B97A2),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                              )
                            ],
                          ),
                        ),
                        ReportCategoriesWidget(),
                        Lottie.asset(
                          'assets/lottie_animations/intro.json',
                          controller: _controller,
                          height: MediaQuery.of(context).size.height * 0.4,
                          animate: true,
                          onLoaded: (composition) {
                            _controller
                              ..duration = composition.duration
                              ..forward().whenComplete(() => null);
                          },
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 40),
                          child: FFButtonWidget(
                            onPressed: () async {
                              setState(() => _loadingButton = true);
                              try {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        NavBarPage(initialPage: 'HomePage'),
                                  ),
                                );
                              } finally {
                                setState(() => _loadingButton = false);
                              }
                            },
                            text: 'Back to Home',
                            options: FFButtonOptions(
                              width: 270,
                              height: 50,
                              color: FlutterFlowTheme.primaryColor,
                              textStyle: FlutterFlowTheme.subtitle2.override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                              ),
                              elevation: 2,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: 8,
                            ),
                            loading: _loadingButton,
                          ),
                        )
                      ],
                    );
                  },
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
