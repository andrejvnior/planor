import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:planor/features/auth/pages/landing/landing_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const LandingPage());
}
