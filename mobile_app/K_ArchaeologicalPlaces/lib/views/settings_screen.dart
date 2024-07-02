import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/user_controller.dart'; // Import the UserController
import 'about_screen.dart'; // Import the AboutScreen
import 'feedback_support_screen.dart'; // Import the FeedbackSupportScreen
import 'privacy_security_screen.dart'; // Import the PrivacySecurityScreen

class SettingsScreen extends StatelessWidget {
  final UserController userController = Get.find(); // Get the UserController instance

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ListTile(
            leading: Icon(Icons.person),
            title: Text('edit_profile'.tr),
            onTap: () {
              // Navigate to Edit Profile Screen
            },
          ),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text('change_password'.tr),
            onTap: () {
              // Navigate to Change Password Screen
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('notifications'.tr),
            trailing: Switch(
              value: true, // Replace with the actual value
              onChanged: (value) {
                // Handle toggle
              },
            ),
          ),
          ListTile(
            leading: Icon(Icons.language),
            title: Text('language'.tr),
            onTap: () {
              // Show language selection dialog
              showLanguageDialog(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.color_lens),
            title: Text('theme'.tr),
            onTap: () {
              // Show theme selection dialog
            },
          ),
          ListTile(
            leading: Icon(Icons.privacy_tip),
            title: Text('privacy_security'.tr),
            onTap: () {
              // Navigate to Privacy and Security Screen
              Get.to(PrivacySecurityScreen.new);
            },
          ),
          ListTile(
            leading: Icon(Icons.feedback),
            title: Text('feedback_support'.tr),
            onTap: () {
              // Navigate to Feedback and Support Screen
              Get.to(FeedbackSupportScreen.new);
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('about'.tr),
            onTap: () {
              // Navigate to About Screen
              Get.to(AboutScreen.new);
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('logout'.tr),
            onTap: userController.logout,
          ),
        ],
      ),
    );
  }

  void showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('select_language'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('english'),
                onTap: () {
                  Get.updateLocale(Locale('en', 'US'));
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: Text('arabic'),
                onTap: () {
                  Get.updateLocale(Locale('ar', 'EG'));
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
