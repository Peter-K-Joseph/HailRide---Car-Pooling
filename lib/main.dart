import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hailride/view/login_signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const InitialLoadingPage());
}

class InitialLoadingPage extends StatelessWidget {
  const InitialLoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: LoginPage(),
    );
  }
}
