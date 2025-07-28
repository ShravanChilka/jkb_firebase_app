import 'package:flutter/material.dart';
import 'package:jkb_firebase_app/auth/model/user_model.dart';
import 'package:jkb_firebase_app/auth/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Text("Logout"),
                  onTap: () {
                    context.read<AuthViewModel>().logout();
                  },
                ),
              ];
            },
          ),
        ],
      ),
      body: Selector<AuthViewModel, UserModel?>(
        selector: (_, vm) => vm.user,
        builder: (context, user, child) {
          if (user == null) return Center(child: Text("User not found!"));
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(child: Icon(Icons.person)),
                    SizedBox(width: 16),
                    Text(
                      user.name,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
