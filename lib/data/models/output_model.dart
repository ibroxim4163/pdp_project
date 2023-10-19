/// use when getting output

class OutputModel {
  final int id;
  final int product;
  final int count;
  final String filial;
  final DateTime date;

  const OutputModel({
    required this.id,
    required this.product,
    required this.count,
    required this.filial,
    required this.date,
  });

  OutputModel copyWith({
    int? id,
    int? product,
    int? count,
    String? filial,
    DateTime? date,
  }) {
    return OutputModel(
      id: id ?? this.id,
      product: product ?? this.product,
      count: count ?? this.count,
      filial: filial ?? this.filial,
      date: date ?? this.date,
    );
  }

  @override
  String toString() {
    return 'OutputModel(id: $id, product: $product, count: $count, filial: $filial, date: $date)';
  }

  @override
  bool operator ==(covariant OutputModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.product == product &&
        other.count == count &&
        other.filial == filial &&
        other.date == date;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        product.hashCode ^
        count.hashCode ^
        filial.hashCode ^
        date.hashCode;
  }

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'id': id,
      'product': product,
      'count': count,
      'filial': filial,
      'date': date.toIso8601String(),
    };
  }

  factory OutputModel.fromJson(Map<String, Object?> map) {
    return OutputModel(
      id: map['id'] as int,
      product: map['product'] as int,
      count: map['count'] as int,
      filial: map['filial'] as String,
      date: DateTime.tryParse(map['date'] as String) ?? DateTime.now(),
    );
  }
}
