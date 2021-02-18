import 'package:flutter/material.dart';
import 'screens/main_page.dart';
import 'screens/login_page.dart';
import 'utils/colors.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Twirl',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: TwirlColors.TwirlColor,
        primaryColorLight: TwirlColors.TwirlLightColor,
        primaryColorDark: TwirlColors.TwirlDarkColor,
      ),
      routes: {
        '/': (context) => MainPage(),
        '/login': (context) => LoginPage()
      },
      // home: HomePage(title: 'Twirl'),
    );
  }
}


