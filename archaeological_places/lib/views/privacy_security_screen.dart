import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrivacySecurityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('privacy_security'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'privacy_policy'.tr,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'privacy_policy_description',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'terms_of_service',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'terms_of_service_description',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'manage_data',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'manage_data_description',
              style: TextStyle(fontSize: 16),
            ),
            Spacer(), // This pushes the button to the bottom
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle delete account action
                  showDeleteAccountDialog(context);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    'delete_account',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[100],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showDeleteAccountDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('delete_account'),
          content: Text('delete_account_confirmation'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('cancel'),
            ),
            TextButton(
              onPressed: () {
                // Handle account deletion
                Navigator.of(context).pop(); // Close the dialog
                Get.snackbar('account_deleted'.tr, 'Your account has been successfully deleted.');
              },
              child: Text('delete'),
            ),
          ],
        );
      },
    );
  }
}
