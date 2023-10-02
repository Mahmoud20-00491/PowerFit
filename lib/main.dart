import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/home_page.dart';
import 'package:gym_app/splash_screen.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox('mybox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Gabarito",
      ),
      home: FutureBuilder<bool>(
        future: _checkFirstTime(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!) {
              return AnimatedSplashScreen(
                  splash: "assets/barbell.png",
                  splashIconSize: 150,
                  backgroundColor: Colors.black,
                  nextScreen: SplashScreen(),
                  splashTransition: SplashTransition.fadeTransition);
            } else {
              return AnimatedSplashScreen(
                  splash: "assets/barbell.png",
                  splashIconSize: 150,
                  backgroundColor: Colors.black,
                  nextScreen: HomePage(),
                  splashTransition: SplashTransition.fadeTransition);
            }
          } else {
            return Container(); // You can show a loading indicator here
          }
        },
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  Future<bool> _checkFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTime = prefs.getBool('isFirstTime') ?? true;
    if (isFirstTime) {
      await prefs.setBool('isFirstTime', false);
    }
    return isFirstTime;
  }
}

