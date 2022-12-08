import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'presentation/view/home.dart';
import 'presentation/view/signin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const StartScreen());
}

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: FirebaseAuth.instance.currentUser==null?SignInScreen():HomeScreen()
    );
  }
}



