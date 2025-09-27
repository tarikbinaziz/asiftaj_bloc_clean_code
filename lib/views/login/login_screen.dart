import 'package:asiftaj_bloc_clean_code/views/login/widgets/custom_button.dart';
import 'package:asiftaj_bloc_clean_code/views/login/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

/// Login Screen Page
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CustomTextField(hintText: "Email", icon: Icons.email),
            SizedBox(height: 16),
            CustomTextField(
              hintText: "Password",
              icon: Icons.lock,
              isPassword: true,
            ),
            SizedBox(height: 24),
            CustomButton(text: "Login"),
          ],
        ),
      ),
    );
  }
}
