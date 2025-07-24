import 'package:flutter/material.dart';
import 'package:jkb_firebase_app/auth/model/login_request_model.dart';
import 'package:jkb_firebase_app/auth/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: emailController,
            decoration: InputDecoration(hintText: "Enter email"),
          ),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(hintText: "Enter password"),
            obscureText: true,
            obscuringCharacter: "*",
          ),
          SizedBox(height: 10),
          FilledButton(
            onPressed: () {
              final request = LoginRequestModel(
                email: emailController.text,
                password: passwordController.text,
              );
              context.read<AuthViewModel>().login(request);
            },
            child: Text("Login"),
          ),
          SizedBox(height: 8),
          Text("Don't have an account registered?"),
          TextButton(
            onPressed: () {
              context.read<AuthViewModel>().changeScreenEvent(
                AuthScreenType.register,
              );
            },
            child: Text("Register"),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
