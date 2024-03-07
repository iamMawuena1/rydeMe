import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ride/constant/utils/colors.dart';
import 'package:ride/rider/controller/RiderBottomnavbarProvider/rider_bottomnavbar_provider.dart';
import 'package:ride/rider/view/bottomnavbar/bottomnavbar_rider.dart';
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
        return MultiProvider(
          providers: [
            ChangeNotifierProvider<RiderBottoNavBarProvider>(
              create: (_) => RiderBottoNavBarProvider(),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              appBarTheme: AppBarTheme(color: white, elevation: 0.0),
            ),
            home: const RiderBottomNavBar(),
          ),
        );
      }),
    );
  }
}
