import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jkb_firebase_app/counter/model/counter_model.dart';

class CounterFirebaseService {
  final _client = FirebaseFirestore.instance;

  Stream<CounterModel> getCounterStream() {
    final ref = _client.collection("data").doc("counter");
    final result = ref.snapshots();

    return result.asyncMap((doc) {
      if (doc.exists) {
        final map = doc.data();
        if (map != null) {
          return CounterModel.fromMap(map);
        }
      }
      return CounterModel(count: 0);
    });
  }

  Future<CounterModel> getCounter() async {
    final ref = _client.collection("data").doc("counter");
    final result = await ref.get();
    final map = result.data();
    if (map != null) {
      return CounterModel.fromMap(map);
    }
    return CounterModel(count: 0);
  }

  Future<void> setCounter(CounterModel model) async {
    final ref = _client.collection("data").doc("counter");
    await ref.set(model.toMap());
  }
}
