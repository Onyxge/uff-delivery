import 'package:flutter/material.dart';
import 'package:food_delivery_app/splash_screen.dart';
import 'package:food_delivery_app/login_screen.dart';
import 'package:food_delivery_app/signup_screen.dart';
import 'package:food_delivery_app/forgot_password_screen.dart';
import 'package:food_delivery_app/home_screen.dart';
import 'package:food_delivery_app/discovery_screen.dart';
import 'package:food_delivery_app/product_detail_screen.dart';
import 'package:food_delivery_app/cart_screen.dart';
import 'package:food_delivery_app/liked_screen.dart';
//import 'package:food_delivery_app/chat_screen.dart';
import 'package:food_delivery_app/user_profile_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Delivery App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
        '/forgot_password': (context) => const ForgotPasswordScreen(),
        '/home': (context) => const HomeScreen(),
        '/discover': (context) =>  DiscoveryScreen(),
        '/product_detail': (context) => const ProductDetailScreen(),
        '/cart': (context) => const CartScreen(),
        '/liked': (context) => const LikedScreen(),
       // '/chat': (context) => const ChatScreen(),
        '/profile': (context) => const UserProfileScreen(),
      },
    );
  }
}


