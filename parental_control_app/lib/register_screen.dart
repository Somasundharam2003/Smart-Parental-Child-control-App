import 'package:flutter/material.dart';
import 'auth_service.dart';

class RegisterScreen extends StatefulWidget {
  final VoidCallback onRegisterSuccess;
  const RegisterScreen({super.key, required this.onRegisterSuccess});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final AuthService _authService = AuthService();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String error = "";

  void register() async {
    var user = await _authService.registerWithEmailPassword(
        emailController.text.trim(), passwordController.text.trim());

    if (user != null) {
      widget.onRegisterSuccess();
    } else {
      setState(() {
        error = "Failed to register";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register")),
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
              onPressed: register,
              child: Text("Register"),
            ),
            SizedBox(height: 8),
            Text(error, style: TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
