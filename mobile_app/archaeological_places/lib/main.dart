import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'views/login_screen.dart';
import 'views/home_screen.dart';
import 'views/category_screen.dart';
import 'views/favorites_screen.dart';
import 'views/search_screen.dart';
import 'views/settings_screen.dart'; 
import 'views/about_screen.dart';
import 'views/feedback_support_screen.dart'; // Import the FeedbackSupportScreen
import 'views/privacy_security_screen.dart'; // Import the PrivacySecurityScreen
import 'controllers/user_controller.dart';
import 'controllers/favorites_controller.dart'; // Import the FavoritesController
import 'controllers/search_controller.dart' as custom; // Import the SearchController with alias
import 'utils/translations.dart'; // Import the Translations

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('favoritesBox');
  await Hive.openBox('searchBox');
  
  // Initialize controllers
  Get.put(UserController());
  Get.put(FavoritesController());
  Get.put(custom.SearchController());
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Archaeological Places App',
      translations: AppTranslations(), // Set translations
      locale: Locale('en', 'US'), // Initial locale
      fallbackLocale: Locale('en', 'US'), // Fallback locale
      initialRoute: '/login',
      getPages: [
        GetPage(name: '/login', page: () => LoginScreen()),
        GetPage(name: '/home', page: () => HomeScreen()),
        GetPage(name: '/category', page: () => CategoryScreen()),
        GetPage(name: '/favorites', page: () => FavoritesScreen()),
        GetPage(name: '/search', page: () => SearchScreen()),
        GetPage(name: '/settings', page: () => SettingsScreen()), // Add route for SettingsScreen
        GetPage(name: '/about', page: () => AboutScreen()), // Add route for AboutScreen
        GetPage(name: '/feedback', page: () => FeedbackSupportScreen()), // Add route for FeedbackSupportScreen
        GetPage(name: '/privacy', page: () => PrivacySecurityScreen()), // Add route for PrivacySecurityScreen
      ],
    );
  }
}