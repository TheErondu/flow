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
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: FlutterFlowAudioPlayer(
          audio: Audio.network(
            'http://stream.radiojar.com/3by7s8eg65quv',
            metas: Metas(
              id: '3by7s8eg65quv-lmi974bm',
              title: 'Nation FM',
            ),
          ),
          titleTextStyle: FlutterFlowTheme.bodyText1.override(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
          playbackDurationTextStyle: FlutterFlowTheme.bodyText1.override(
            fontFamily: 'Poppins',
            color: Color(0xFF9D9D9D),
            fontSize: 12,
          ),
          fillColor: Color(0xFFEEEEEE),
          playbackButtonColor: FlutterFlowTheme.primaryColor,
          activeTrackColor: Color(0xFF57636C),
          elevation: 4,
        ),
      ),
    );
  }
}
