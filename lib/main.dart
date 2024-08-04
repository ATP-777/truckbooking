import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tcms_light_app/login_signup.dart';
import 'package:tcms_light_app/theme/theme.dart'; // Import your MaterialTheme class

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light, // For iOS
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.system, // Use system theme mode
      darkTheme: MaterialTheme().dark(), // Dark theme from your MaterialTheme class
      theme: MaterialTheme().light(), // Light theme from your MaterialTheme class
      home: LoginSignupScreen(),
    );
  }
}