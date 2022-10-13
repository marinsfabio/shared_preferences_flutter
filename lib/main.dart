import 'package:flutter/material.dart';
import 'package:shared_preferences_flutter/pages/home_page.dart';
import 'package:shared_preferences_flutter/pages/login_page.dart';
import 'package:shared_preferences_flutter/pages/splash_page.dart';
import 'package:shared_preferences_flutter/pages/sub_home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const SplashPage(),
        '/login': (_) => LoginPage(),
        '/home': (_) => HomePage(),
        '/subPage': (_) => SubHomePage(),
      },
    );
  }
}
