import 'package:flutter/material.dart';
import 'package:thuto_frontend/config/constants/app_strings.dart';
import 'package:thuto_frontend/core/utils/textfield_utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  //Controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            //Username- Email
            TextfieldUtils(
              prefixIcon: Icon(Icons.person), 
              hintText: AppStrings.EnterUsername, 
              textEditingController: emailController
            ).emailUsernameTextField(),

            //Password- Password
            TextfieldUtils(
              prefixIcon: Icon(Icons.lock), 
              hintText: AppStrings.EnterPassword, 
              textEditingController: passwordController,
              isPass: true,
            ).passwordTextfield(),
          ],
        ),
      ),
    );
  }
}