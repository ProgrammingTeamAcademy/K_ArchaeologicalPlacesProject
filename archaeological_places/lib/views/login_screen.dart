import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/user_controller.dart';
import 'signup_screen.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final UserController userController = Get.find();

  void _login() {
    if (_formKey.currentState!.validate()) {
      userController.login(usernameController.text, passwordController.text);
    }
  }

  void _navigateToSignup() {
    Get.to(Signup.new);
  }

  @override
  Widget build(BuildContext context) {
    final double fieldWidth = MediaQuery.of(context).size.width * 0.8;

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Colors.grey,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomTextFormField(
                    controller: usernameController,
                    label: 'Username',
                    validator: (value) {
                      if (value!.isEmpty) return 'Please enter a username';
                      return null;
                    },
                    width: fieldWidth,
                  ),
                  SizedBox(height: 20),
                  CustomPasswordField(
                    controller: passwordController,
                    label: 'Password',
                    validator: (value) {
                      if (value!.isEmpty) return 'Please enter a password';
                      if (value.length < 8) return 'Password must be at least 8 characters';
                      return null;
                    },
                    width: fieldWidth,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: _login,
                    child: Text('Login'),
                  ),
                  SizedBox(height: 10),
                  TextButton(
                    onPressed: _navigateToSignup,
                    child: Text('Don\'t have an account? Sign up'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
