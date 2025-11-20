import 'package:flutter/material.dart';
import 'package:thuto_frontend/config/constants/app_colors.dart';
import 'package:thuto_frontend/config/constants/app_strings.dart';
import 'package:thuto_frontend/features/auth/presentation/login_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();

    //Simulate a loading process
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context, 
        MaterialPageRoute(builder: (_) => const LoginScreen()),
        );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.library_books_outlined,
              size: 80,
              color: Colors.white,
            ),

            const SizedBox(height: 30),

            //AppName
            Text(
              AppStrings.appName,
              style: TextStyle(
                fontSize: 75,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary
              ),
            )
          ],
        ),
      ),
    );
  }
}