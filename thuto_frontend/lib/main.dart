import 'package:flutter/material.dart';
import 'package:thuto_frontend/config/constants/app_colors.dart';
import 'package:thuto_frontend/features/auth/presentation/loading_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Thuto',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
      ),
      
      home: LoadingScreen(),
    );
  }
}
