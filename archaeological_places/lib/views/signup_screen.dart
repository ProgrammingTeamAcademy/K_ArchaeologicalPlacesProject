import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/user_controller.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final UserController userController = Get.find();

  bool isUsernameUnique(String username) {
    return !userController.existingUsers.containsKey(username);
  }

  void _signup() {
    if (_formKey.currentState!.validate()) {
      userController.signup(usernameController.text, passwordController.text);
    }
  }

  void _navigateBack() {
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    final double fieldWidth = MediaQuery.of(context).size.width * 0.8;

    return Scaffold(
      appBar: AppBar(
        title: Text('Sign up'),
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
                      if (!isUsernameUnique(value)) return 'Username already exists';
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
                  CustomPasswordField(
                    controller: confirmPasswordController,
                    label: 'Confirm Password',
                    validator: (value) {
                      if (value!.isEmpty) return 'Please enter a confirm password';
                      if (value != passwordController.text) return 'Passwords do not match';
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
                    onPressed: _signup,
                    child: Text('Sign up'),
                  ),
                  SizedBox(height: 10),
                  TextButton(
                    onPressed: _navigateBack,
                    child: Text('Already have an account? Login'),
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

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final FormFieldValidator<String>? validator;
  final double width;

  CustomTextFormField({
    required this.controller,
    required this.label,
    this.validator,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        validator: validator,
      ),
    );
  }
}

class CustomPasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final FormFieldValidator<String>? validator;
  final double width;

  CustomPasswordField({
    required this.controller,
    required this.label,
    this.validator,
    required this.width,
  });

  @override
  _CustomPasswordFieldState createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool _obscureText = true;

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      child: TextFormField(
        controller: widget.controller,
        obscureText: _obscureText,
        decoration: InputDecoration(
          labelText: widget.label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          suffixIcon: IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: _toggleVisibility,
          ),
        ),
        validator: widget.validator,
      ),
    );
  }
}
