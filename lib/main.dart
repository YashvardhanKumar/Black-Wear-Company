import 'package:bfm/components/custom_page_route.dart';
import 'package:bfm/routes/intro_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: const LogoPage(),
    );
  }
}

class LogoPage extends StatefulWidget {
  const LogoPage({super.key});

  @override
  State<LogoPage> createState() => _LogoPageState();
}

class _LogoPageState extends State<LogoPage> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2),() => {
      Navigator.pushReplacement(context, CustomPageRoute(child: IntroPage()))
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'images/Logo.png',
          height: 50,
        ),
      ),
    );
  }
}
