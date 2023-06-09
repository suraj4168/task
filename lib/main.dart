
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/routes/route.dart';
import 'package:task/view/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppRoutes.getPages,
      title: 'task',
      home: SplashScreen()
    );

  }
}
