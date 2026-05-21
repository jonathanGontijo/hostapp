import 'package:flutter/material.dart';
import 'package:hostapp/constants/app_constants.dart';
import 'package:hostapp/pages/auth/signup_page.dart';
import 'package:hostapp/pages/widgets/custom_text_field.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = "/login";
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  _signUp() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const SignupPage()));
  }

  _logIn(){

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 80, 30, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Image.asset(
                  "assets/images/logo.png",
                  width: MediaQuery.of(context).size.width * 0.8,
                ),

                SizedBox(height: 20),

                Text(
                  "Find Stays & Rentals with ${AppConstants.appName}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 26.0,
                  ),
                ),

                SizedBox(height: 40),

                Form(
                  key: _formKey,
                  child: Column(
                    children: [

                      CustomTextField(controller: _emailController, label: "Email" , icon: Icons.email, isPassword: false, ),

                      CustomTextField(controller: _passwordController, label: "Password" , icon: Icons.lock, isPassword: true,),

                    ],
                  ),
                ),

                SizedBox(height: 35),

                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 15,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 4,
                    ),
                    onPressed: _isLoading ? null : _logIn,
                    child: _isLoading
                        ? const CircularProgressIndicator(
                      valueColor:
                      AlwaysStoppedAnimation<Color>(Colors.white),
                    )
                        : const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 22.0,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 15,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.white, width: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: _isLoading ? null : _signUp,
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.white
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 100),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
