import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:jkb_firebase_app/counter/view_model/counter_view_model.dart';
import 'package:provider/provider.dart';

class CounterTextWidget extends StatelessWidget {
  const CounterTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<CounterViewModel, Tuple2<bool, int>>(
      selector: (p0, vm) => Tuple2(vm.isLoading, vm.count),
      builder: (context, tuple, child) {
        if (tuple.value1) {
          return CircularProgressIndicator();
        }
        return Text(
          tuple.value2.toString(),
          style: Theme.of(context).textTheme.displayLarge,
        );
      },
    );
  }
}
