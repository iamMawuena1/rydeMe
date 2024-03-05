import 'package:flutter/material.dart';
import 'package:ride/constant/utils/colors.dart';
import 'package:ride/rider/view/ride_homescreen.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: ((context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: AppBarTheme(color: white, elevation: 0.0),
          ),
          home: const RiderHomeScreen(),
        );
      }),
    );
  }
}
