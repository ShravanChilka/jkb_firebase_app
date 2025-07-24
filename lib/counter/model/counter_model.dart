class CounterModel {
  const CounterModel({required this.count});

  factory CounterModel.fromMap(Map<String, dynamic> map) {
    return CounterModel(count: (map["count"] as int?) ?? 0);
  }

  Map<String, dynamic> toMap() {
    return {"count": count};
  }

  CounterModel copyWith({int? count}) {
    return CounterModel(count: count ?? this.count);
  }

  final int count;
}
