import 'package:flutter/material.dart';
import 'package:jkb_firebase_app/home/view/home_screen.dart';
import 'package:jkb_firebase_app/home/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreenProvider extends StatelessWidget {
  const HomeScreenProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeViewModel(),
      child: HomeScreen(),
    );
  }
}
