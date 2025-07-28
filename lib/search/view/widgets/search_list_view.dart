import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jkb_firebase_app/auth/view_model/auth_view_model.dart';
import 'package:jkb_firebase_app/chat/view/chat_screen_provider.dart';
import 'package:jkb_firebase_app/search/view_model/search_view_model.dart';
import 'package:provider/provider.dart';

class SearchListView extends StatelessWidget {
  const SearchListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<SearchViewModel, String>(
      selector: (_, vm) => vm.query,
      builder: (context, _, __) {
        return FirestoreListView.separated(
          query: context.read<SearchViewModel>().searchUser(),
          itemBuilder: (context, snapshot) {
            final user = snapshot.data();
            return ListTile(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ChatScreenProvider(
                      receiver: user,
                      sender: context.read<AuthViewModel>().user!,
                    ),
                  ),
                );
              },
              leading: CircleAvatar(child: Icon(Icons.person)),
              title: Text(user.username),
              subtitle: Text(user.name),
            );
          },
          separatorBuilder: (context, index) => Divider(height: 1),
        );
      },
    );
  }
}
