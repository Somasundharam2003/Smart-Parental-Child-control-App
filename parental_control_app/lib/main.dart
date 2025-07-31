import 'package:flutter/material.dart';
import 'package:parental_control_app/home_screen.dart';
import 'login_screen.dart';
import 'register_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool loggedIn = false;
  bool isRegistering = false;

  void onLoginSuccess() {
    setState(() {
      loggedIn = true;
    });
  }

  void onLogout() {
    setState(() {
      loggedIn = false;
      isRegistering = false;
    });
  }

  void switchToRegister() {
    setState(() {
      isRegistering = true;
    });
  }

  void switchToLogin() {
    setState(() {
      isRegistering = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (loggedIn) {
      return MaterialApp(
        home: HomeScreen(onLogout: onLogout),
        debugShowCheckedModeBanner: false,
      );
    } else {
      return MaterialApp(
        home: isRegistering
            ? RegisterScreen(onRegisterSuccess: onLoginSuccess)
            : LoginScreen(onLoginSuccess: onLoginSuccess),
        debugShowCheckedModeBanner: false,
        // Add a way to switch between Login and Register below the form:
        builder: (context, child) {
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: child ?? SizedBox()),
                TextButton(
                  onPressed: isRegistering ? switchToLogin : switchToRegister,
                  child: Text(isRegistering
                      ? "Already have an account? Login"
                      : "Don't have an account? Register"),
                ),
              ],
            ),
          );
        },
      );
    }
  }
}
