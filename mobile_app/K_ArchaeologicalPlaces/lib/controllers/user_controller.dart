import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

class UserController extends GetxController {
  var isLoggedIn = false.obs;
  var loggedInUsername = ''.obs;

  // Dummy list of existing usernames and passwords
  Map<String, String> existingUsers = {
    'admin1': 'user1111',
    'admin2': 'user2222',
  };

  // Login method
  void login(String username, String password) {
    if (existingUsers.containsKey(username) && existingUsers[username] == password) {
      loggedInUsername.value = username;
      isLoggedIn.value = true;
      Get.offNamed('/home');
    } else {
      showErrorSnackbar('Error', 'Invalid username or password');
    }
  }

  // Signup method
  void signup(String username, String password) {
    if (!existingUsers.containsKey(username)) {
      existingUsers[username] = password;
      loggedInUsername.value = username;
      isLoggedIn.value = true;
      Get.offNamed('/home');
    } else {
      showErrorSnackbar('Error', 'Username already exists');
    }
  }

  // Logout method
  void logout() {
    loggedInUsername.value = '';
    isLoggedIn.value = false;
    Get.offAllNamed('/login'); // Navigate to login screen
    showPlatformAwareSnackbar('Logged out', 'You have been logged out successfully');
  }

  var currentIndex = 0.obs;

  void changeTabIndex(int index) {
    currentIndex.value = index;
  }

  void showErrorSnackbar(String title, String message) {
    if (Platform.isAndroid) {
      Get.snackbar(
        title,
        message,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    } else if (Platform.isIOS) {
      Get.snackbar(
        title,
        message,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  void showSuccessSnackbar(String title, String message) {
    if (Platform.isAndroid) {
      Get.snackbar(
        title,
        message,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    } else if (Platform.isIOS) {
      Get.snackbar(
        title,
        message,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  void showPlatformAwareSnackbar(String title, String message) {
    if (Platform.isAndroid) {
      Get.snackbar(
        title,
        message,
        backgroundColor: Colors.blue,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    } else if (Platform.isIOS) {
      Get.snackbar(
        title,
        message,
        backgroundColor: Colors.blue,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );
    }
  }
}
