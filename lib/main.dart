import 'package:brave/login/login_widget.dart';
import 'package:brave/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:brave/index/index_widget.dart';
import 'package:get_storage/get_storage.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'home_page/home_page_widget.dart';
import 'live_tv_page/live_tv_page_widget.dart';
import 'radio_page/radio_page_widget.dart';
import 'settings_page/settings_page_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:brave/backend/notifications.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await GetStorage.init();
    await init();
   runApp(MyApp());
}

Future init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}
class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    return MaterialApp(
      title: 'brave',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en', '')],
      theme: ThemeData(primarySwatch: Colors.blue),
      home: 
       box.read("token") != null?
      IndexWidget():LoginWidget()
    );
  }
}

class NavBarPage extends StatefulWidget {
  NavBarPage({Key key,  this.initialPage}) : super(key: key);

  final String initialPage;


  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPage = 'HomePage';
   String notificationTitle = 'No Title';
  String notificationBody = 'No Body';
  String notificationData = 'No Data';

  @override
  void initState() {
    final firebaseMessaging = FCM();
    firebaseMessaging.setNotifications();
    
    firebaseMessaging.streamCtlr.stream.listen(_changeData);
    firebaseMessaging.bodyCtlr.stream.listen(_changeBody);
    firebaseMessaging.titleCtlr.stream.listen(_changeTitle);
    super.initState();
    _currentPage = widget.initialPage ?? _currentPage;
  }

    _changeData(String msg) => setState(() => notificationData = msg);
  _changeBody(String msg) => setState(() => notificationBody = msg);
  _changeTitle(String msg) => setState(() => notificationTitle = msg);

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'HomePage': HomePageWidget(),
      'LiveTvPage': LiveTvPageWidget(),
      'RadioPage': RadioPageWidget(),
      'SettingsPage': SettingsPageWidget(),
    };
    return Scaffold(
      drawer: DrawerWidget(),
      body: tabs[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              size: 24,
            ),
            label: 'Home',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.live_tv,
              size: 24,
            ),
            label: 'Live TV',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.radio_outlined,
              size: 24,
            ),
            label: 'Radio',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              size: 24,
            ),
            label: 'Settings',
            tooltip: '',
          )
        ],
        backgroundColor: FlutterFlowTheme.tertiaryColor,
        currentIndex: tabs.keys.toList().indexOf(_currentPage),
        selectedItemColor: Color(0xFFC01616),
        unselectedItemColor: Color(0xFF535353),
        onTap: (i) => setState(() => _currentPage = tabs.keys.toList()[i]),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
