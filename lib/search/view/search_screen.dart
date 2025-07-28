import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jkb_firebase_app/search/view/widgets/search_list_view.dart';
import 'package:jkb_firebase_app/search/view_model/search_view_model.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(16),
          child: Column(
            children: [
              TextField(
                onChanged: context.read<SearchViewModel>().onQueryChangedEvent,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.surfaceContainer,
                  hintText: "Search users",
                  contentPadding: EdgeInsets.all(16),
                  prefixIcon: Icon(Icons.search),
                ),
              ),
              Expanded(child: SearchListView()),
            ],
          ),
        ),
      ),
    );
  }
}
