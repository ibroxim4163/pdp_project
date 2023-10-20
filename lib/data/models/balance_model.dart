class BalanceModel {
  final DateTime startDate;
  final DateTime endDate;

  const BalanceModel({
    required this.startDate,
    required this.endDate,
  });

  BalanceModel copyWith({
    DateTime? startDate,
    DateTime? endDate,
  }) {
    return BalanceModel(
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }

  @override
  String toString() => 'BalanceModel(startTime: $startDate, endTime: $endDate)';

  @override
  bool operator ==(covariant BalanceModel other) {
    if (identical(this, other)) return true;

    return other.startDate == startDate && other.endDate == endDate;
  }

  @override
  int get hashCode => startDate.hashCode ^ endDate.hashCode;

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'start_date': startDate.toIso8601String(),
      'end_date': endDate.toIso8601String(),
    };
  }

  factory BalanceModel.fromJson(Map<String, Object?> map) {
    return BalanceModel(
      startDate: DateTime.tryParse(map['start_date'] as String)??DateTime.now(),
      endDate: DateTime.tryParse(map['end_date'] as String)??DateTime.now(),
    );
  }
}



