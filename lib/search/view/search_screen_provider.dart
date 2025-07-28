import 'package:flutter/material.dart';
import 'package:jkb_firebase_app/search/view/search_screen.dart';
import 'package:jkb_firebase_app/search/view_model/search_view_model.dart';
import 'package:provider/provider.dart';

class SearchScreenProvider extends StatelessWidget {
  const SearchScreenProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SearchViewModel(),
      child: SearchScreen(),
    );
  }
}
