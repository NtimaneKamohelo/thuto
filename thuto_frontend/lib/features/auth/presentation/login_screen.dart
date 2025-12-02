import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thuto_frontend/config/constants/app_strings.dart';
import 'package:thuto_frontend/core/utils/buttons_utils.dart';
import 'package:thuto_frontend/core/utils/textfield_utils.dart';
import 'package:thuto_frontend/features/auth/presentation/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String id = '/LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  //Password visibility
  bool showPassword = false;

  //Controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                    
                //Logo Section
                Container( 
                  //height: MediaQuery.of(context).size.height,
                  child: Icon(
                      Icons.menu_book_sharp,
                      size: 120,
                      color: Colors.white,
                    ),
                ),
                
                //Username- Email
                TextfieldUtils(
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.black.withValues(alpha: 0.5),  
                  ), 
                  hintText: AppStrings.EnterUsername, 
                  textEditingController: emailController,
                  
                  
                ).emailUsernameTextField(),
                    
                //Password- Password
                TextfieldUtils(
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.black.withValues(alpha: 0.5),
                  ), 
                  hintText: AppStrings.EnterPassword, 
                  textEditingController: passwordController,
                  isPass: !showPassword,
                ).passwordTextfield(
                  IconButton(
                    icon: Icon(
                      showPassword ? Icons.visibility : Icons.visibility_off,
                      color: Colors.black.withValues(alpha: 0.5),
                    ),
                    onPressed: () {
                      setState(() {
                        showPassword =!showPassword;
                      });
                    },
                  ),
                ),
            
                //Forgot Password
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 14),
                      child: ButtonsUtils(
                        onPressed: () {
                         Navigator.pushNamed(context, '/ForgotPasswordScreen');
                        }, 
                        btnText: "Forgot Password?",
                        
                      ).forgotPwdButton(),
                    ),
                  ],
                ),
            
                //LoginButton
                ButtonsUtils(
                  onPressed: () {
                    if(formKey.currentState!.validate()){
                      Navigator.pushNamed(context, '/HomeScreen');
                    }
                  }, 
                  btnText: "Login",
                ).LoginBtn(),
            
                //Split the login and social media login
                Row(
                  children: <Widget>[
                    //left
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 10.0, right: 5.0),
                        child: const Divider(
                          indent: 40,
                          endIndent: 40,
                          color: Colors.grey,
                          thickness: 1,
                        ),
                      ),
                    ),
            
                    const Text(
                      "OR Login with",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54
                      ),
                    ),
            
                    //Right
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 5.0, right: 10.0),
                        child: const Divider(
                          indent: 40,
                          endIndent: 40,
                          color: Colors.grey,
                          thickness: 1,
                        ),
                      ),
                    ),
            
                    
            
                  ],
                ),
            
                //Social media button(Google)
                ButtonsUtils(
                  onPressed: () {}, 
                  btnText: ""
                ).mediaButton(
                  const FaIcon(
                    FontAwesomeIcons.google,
                    color: Colors.red,
                  )
                ),
            
                //Do you have an account button?? SignUp
                ButtonsUtils(
                  onPressed: () {
                    Navigator.pushNamed(context, '/RegisterScreen');
                  }, 
                  btnText: "Register",
                  
                ).doYouHaveAnAccountBtn(
                  "Don't have an account?",
                )
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}