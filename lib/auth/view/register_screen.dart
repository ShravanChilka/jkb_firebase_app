import 'package:flutter/material.dart';
import 'package:jkb_firebase_app/auth/model/register_request_model.dart';
import 'package:jkb_firebase_app/auth/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(hintText: "Enter name"),
          ),
          TextField(
            controller: usernameController,
            decoration: InputDecoration(hintText: "Enter username"),
          ),
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
              final request = RegisterRequestModel(
                name: nameController.text,
                username: usernameController.text,
                email: emailController.text,
                password: passwordController.text,
              );

              context.read<AuthViewModel>().register(request);
            },
            child: Text("Register"),
          ),
          SizedBox(height: 8),
          Text("Already have an account created?"),
          TextButton(
            onPressed: () {
              context.read<AuthViewModel>().changeScreenEvent(
                AuthScreenType.login,
              );
            },
            child: Text("Login"),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
