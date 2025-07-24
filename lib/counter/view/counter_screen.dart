import 'package:flutter/material.dart';
import 'package:jkb_firebase_app/counter/view/widgets/counter_text_widget.dart';
import 'package:jkb_firebase_app/counter/view_model/counter_view_model.dart';
import 'package:provider/provider.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CounterViewModel>().load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Firebase Counter App")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CounterViewModel>().increment();
        },
        child: Icon(Icons.add),
      ),
      body: Center(child: CounterTextWidget()),
    );
  }
}
