import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jkb_firebase_app/counter/model/counter_model.dart';
import 'package:jkb_firebase_app/counter/service/counter_firebase_service.dart';

class CounterViewModel extends ChangeNotifier {
  final _service = CounterFirebaseService();

  int count = 0;
  bool isLoading = true;

  StreamSubscription<CounterModel>? _counterSubscription;

  void increment() async {
    final model = CounterModel(count: count + 1);
    await _service.setCounter(model);
  }

  void load() {
    _counterSubscription = _service.getCounterStream().listen((event) {
      count = event.count;
      isLoading = false;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _counterSubscription?.cancel();
    super.dispose();
  }
}
