import 'package:flutter/material.dart';
import 'auth_service.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback onLoginSuccess;
  const LoginScreen({super.key, required this.onLoginSuccess});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService _authService = AuthService();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String error = "";

  void login() async {
    var user = await _authService.loginWithEmailPassword(
        emailController.text.trim(), passwordController.text.trim());

    if (user != null) {
      widget.onLoginSuccess();
    } else {
      setState(() {
        error = "Invalid email or password";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration:
                  InputDecoration(labelText: "Email", hintText: "Enter email"),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                  labelText: "Password", hintText: "Enter password"),
              obscureText: true,
            ),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: login,
              child: Text("Login"),
            ),
            SizedBox(height: 8),
            Text(error, style: TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
