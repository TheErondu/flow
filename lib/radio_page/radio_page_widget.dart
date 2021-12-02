import '../flutter_flow/flutter_flow_audio_player.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class RadioPageWidget extends StatefulWidget {
  const RadioPageWidget({Key key}) : super(key: key);

  @override
  _RadioPageWidgetState createState() => _RadioPageWidgetState();
}

class _RadioPageWidgetState extends State<RadioPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        automaticallyImplyLeading: true,
        title: Text(
          'LIVE RADIO -Nation FM',
          style: FlutterFlowTheme.bodyText1.override(
            fontFamily: 'Poppins',
            color: Color(0xFFEFEFF4),
            fontSize: 25,
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: Color(0xFFE7AD11),
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/images/logod.png',
                        width: double.infinity,
                        height: 240,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 25),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Nation FM - 93.6',
                                    style: FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Poppins',
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    getCurrentTimestamp.toString(),
                                    style: FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.secondaryColor,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                              child: Text(
                                'Nation FM is based in Nairobi, but also broadcasts to Meru, Nakuru, Nyeri, Eldoret and Mombasa. It features a mix of news, information, politics, economics and business, sports and lifestyle.',
                                style: FlutterFlowTheme.bodyText1,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            FlutterFlowAudioPlayer(
              audio: Audio.network(
                'http://stream.radiojar.com/3by7s8eg65quv',
                metas: Metas(
                  id: '3by7s8eg65quv-h7oozylr',
                  title: 'Nation FM',
                ),
              ),
              titleTextStyle: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'Poppins',
                color: Color(0xFF0C132E),
                fontWeight: FontWeight.w600,
              ),
              playbackDurationTextStyle: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'Poppins',
                color: Color(0xFF09112B),
                fontSize: 12,
              ),
              fillColor: Color(0xFF08A843),
              playbackButtonColor: Color(0xFFE7AD11),
              activeTrackColor: Color(0xFFEFEFF4),
              elevation: 4,
            )
          ],
        ),
      ),
    );
  }
}
