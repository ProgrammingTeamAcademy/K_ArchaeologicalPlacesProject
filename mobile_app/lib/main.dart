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
import 'views/feedback_support_screen.dart';
import 'views/privacy_security_screen.dart';
import 'controllers/user_controller.dart';
import 'controllers/favorites_controller.dart';
import 'controllers/search_controller.dart' as custom;

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
      locale: Locale('en', 'US'),
      fallbackLocale: Locale('en', 'US'),
      initialRoute: '/login',
      getPages: [
        GetPage(name: '/login', page: LoginScreen.new),
        GetPage(name: '/home', page: HomeScreen.new),
        GetPage(name: '/category', page: CategoryScreen.new),
        GetPage(name: '/favorites', page: FavoritesScreen.new),
        GetPage(name: '/search', page: SearchScreen.new),
        GetPage(name: '/settings', page: SettingsScreen.new),
        GetPage(name: '/about', page: AboutScreen.new),
        GetPage(name: '/feedback', page: FeedbackSupportScreen.new),
        GetPage(name: '/privacy', page: PrivacySecurityScreen.new), 
      ],
    );
  }
}