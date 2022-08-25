import 'package:dicoding_taskmanager/DailyGoals/add_daily_goals.dart';
import 'package:dicoding_taskmanager/DailyGoals/daily_goals_screen.dart';
import 'package:dicoding_taskmanager/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dicoding Task Manager',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'JakartaSans',
            fontSize: 18,
            color: Color(0xff5E454B),
          ),
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: Color(0xff4b6584),
        ),
        fontFamily: 'Martel',
        primarySwatch: const MaterialColor(
          0xffF3F0D7,
          <int, Color>{
            50: Color(0xffF7F6E7),
            100: Color(0xffF6F4E3),
            200: Color(0xffF5F3DF),
            300: Color(0xffF4F1DB),
            400: Color(0xffF3F0D7),
            500: Color(0xffDAD8C1),
            600: Color(0xffC2C0AC),
            700: Color(0xffAAA896),
            800: Color(0xff919081),
          },
        ),
        scaffoldBackgroundColor: const Color(0xffE9E5D6),
      ),
      home: const HomeScreen(),
      routes: <String, WidgetBuilder> {
        '/home': (BuildContext context) => const HomeScreen(),
        '/daily-goals': (BuildContext context) => const DailyGoalsScreen(),
        '/add-daily-goals': (BuildContext context) => const AddDailyGoalsForm(),
      },
    );
  }
}
