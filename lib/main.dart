import 'package:bfm/components/custom_page_route.dart';
import 'package:bfm/routes/bottom%20nav%20bar%20screens/common_home_page.dart';
import 'package:bfm/routes/bottom%20nav%20bar%20screens/home%20page%20of%20e%20commerce/home_page.dart';
import 'package:bfm/routes/intro_page.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init('UserStatus');
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

final box = GetStorage('UserStatus');

class LogoPage extends StatefulWidget {
  const LogoPage({super.key});

  @override
  State<LogoPage> createState() => _LogoPageState();
}

class _LogoPageState extends State<LogoPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      return Navigator.pushReplacement(
        context,
        CustomPageRoute(
          child: ((box.read('isLogin') ?? false) ||
                  (box.read('isAnonymous') ?? false))
              ? const CommonPage()
              : const IntroPage(),
        ),
      );
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
