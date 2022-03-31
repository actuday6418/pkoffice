import 'package:flutter/material.dart';
import 'package:office_android/globals.dart';
import 'package:office_android/tasks_view.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:office_android/home_view.dart';
import 'package:office_android/accounts_view.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeApp(),
    );
  }
}

class HomeApp extends StatefulWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  State<HomeApp> createState() => _HomeState();
}

class _HomeState extends State<HomeApp> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [const Home(), const Accounts(), const Tasks()];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: ("Home"),
        activeColorPrimary: accent,
        inactiveColorPrimary: primaryContrast,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.money),
        title: ("Accounting"),
        activeColorPrimary: accent,
        inactiveColorPrimary: primaryContrast,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.task),
        title: ("Tasks"),
        activeColorPrimary: accent,
        inactiveColorPrimary: primaryContrast,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Praying Kerala',
      home: Scaffold(
          backgroundColor: primaryBackground,
          body: PersistentTabView(
            context,
            controller: _controller,
            screens: _buildScreens(),
            items: _navBarsItems(),
            confineInSafeArea: true,
            backgroundColor: secondaryBackground, // Default is Colors.white.
            handleAndroidBackButtonPress: true, // Default is true.
            resizeToAvoidBottomInset:
                true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
            stateManagement: true, // Default is true.
            hideNavigationBarWhenKeyboardShows:
                true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
            decoration: NavBarDecoration(
              boxShadow: [
                BoxShadow(blurRadius: 8.0, color: Color.fromRGBO(0, 0, 0, 0.25))
              ],
              borderRadius: BorderRadius.circular(15.0),
              colorBehindNavBar: secondaryBackground,
            ),
            popAllScreensOnTapOfSelectedTab: true,
            popActionScreens: PopActionScreensType.all,
            itemAnimationProperties: const ItemAnimationProperties(
              // Navigation Bar's items animation properties.
              duration: Duration(milliseconds: 200),
              curve: Curves.ease,
            ),
            screenTransitionAnimation: const ScreenTransitionAnimation(
              // Screen transition animation on change of selected tab.
              animateTabTransition: true,
            ),
            navBarHeight: MediaQuery.of(context).size.height / 15,
            navBarStyle: NavBarStyle
                .style1, // Choose the nav bar style with this property.
          )),
    );
  }
}
