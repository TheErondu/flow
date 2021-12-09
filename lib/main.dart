
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

Future<void> main() async {
  runApp(MyApp());
  await GetStorage.init();
runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final String user;

  const MyApp({Key key, this.user}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'brave',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en', '')],
      theme: ThemeData(primarySwatch: Colors.blue),
      home: IndexWidget(),
    );
  }
}

class NavBarPage extends StatefulWidget {
  NavBarPage({Key key, this.initialPage, this.user}) : super(key: key);

  final String initialPage;
  final String user;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPage = 'HomePage';

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialPage ?? _currentPage;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'HomePage': HomePageWidget(user: widget.user),
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
