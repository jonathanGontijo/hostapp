import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hostapp/constants/app_constants.dart';
import 'package:hostapp/pages/widgets/custom_text_field.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  File? _imageFile;
  bool _isLoading = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Account"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            Image.asset(  
              'assets/images/signup.png',
              width: MediaQuery.of(context).size.width * 0.8,
            ),
            SizedBox(height: 15,),
            Text('Start Your Journey with\n${AppConstants.appName}', 
            textAlign: TextAlign.center, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,),),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextField(controller: _emailController, label: 'Email', icon: Icons.email, isPassword: false,),
                  CustomTextField(controller: _passwordController, label: 'Password', icon: Icons.lock, isPassword: true,),
                  CustomTextField(controller: _firstNameController, label: 'First Name', icon: Icons.person, isPassword: false,),
                  CustomTextField(controller: _lastNameController, label: 'Last Name', icon: Icons.person, isPassword: false,),
                  CustomTextField(controller: _cityController, label: 'City', icon: Icons.location_on, isPassword: false,),
                  CustomTextField(controller: _countryController, label: 'Country', icon: Icons.location_on, isPassword: false,)
                  ,
                  CustomTextField(controller: _bioController, label: 'Tell Us a Little About you', icon: Icons.info, isPassword: false, maxLines: 3,),
                  
                ],
              ),),
              SizedBox(height: 25,),
              MaterialButton(onPressed: (){},
              child: (_imageFile == null) ? 
              const Icon(Icons.add_a_photo, size: 40, color: Colors.white,): 
              CircleAvatar(
                backgroundImage: FileImage(_imageFile!),
                radius: 60,

              ),),
                SizedBox(height: 25,),
                _isLoading ? const CircularProgressIndicator() : MaterialButton(onPressed: (){},
                color: Colors.white,
                height: 55,
                minWidth: double.infinity,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                 child: const Text("Sign Up", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),),
                SizedBox(height: 15,),
          ],
        ),
      ));
     }
}