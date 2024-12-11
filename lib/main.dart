import 'package:flutter/material.dart';
import 'package:personal_portfolio/services.dart';

import 'dashboard.dart';
import 'dashboardController.dart';
import 'package:get/get.dart';


void main() {
  runApp( MyApp());
}


class MyAppTheme {
  static final darkTheme = ThemeData.dark().copyWith(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent, // Set to transparent
      elevation: 0, // Remove the shadow
    ),
    scaffoldBackgroundColor: Colors.transparent, // Set scaffold background to transparent
    // Define other dark mode theme properties here
    // Example: textTheme, buttonTheme, etc.
    // You can customize them according to your design
  );
  static final lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0, // Remove the shadow
    ),
    // Define other light mode theme properties here
  );

  static BoxDecoration darkBackgroundDecoration = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Colors.black, Colors.black, Colors.black],
    ),
  );
}

class MyApp extends StatelessWidget {
   MyApp({super.key});


  DashboardController dashboardController = Get.put(DashboardController());


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return Obx(
          () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: dashboardController.switchMode.value ? MyAppTheme.lightTheme : MyAppTheme.darkTheme,
        home: Scaffold(
          body: Stack(
            children: [
              Container(
                decoration: MyAppTheme.darkBackgroundDecoration,
              ),
              Dashboard(),

            ],
          ),
        ),
      ),
    );

  }
}


