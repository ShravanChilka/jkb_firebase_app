import 'package:flutter/material.dart';
import 'package:jkb_firebase_app/counter/view/counter_screen.dart';
import 'package:jkb_firebase_app/counter/view_model/counter_view_model.dart';
import 'package:provider/provider.dart';

class CounterScreenProvider extends StatelessWidget {
  const CounterScreenProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CounterViewModel(),
      child: CounterScreen(),
    );
  }
}
