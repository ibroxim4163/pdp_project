class PostedOutputModel {
  final int id;
  final int product;
  final int count;
  final String filial;
  final DateTime date;

  const PostedOutputModel({
    required this.id,
    required this.product,
    required this.count,
    required this.filial,
    required this.date,
  });

  PostedOutputModel copyWith({
    int? id,
    int? product,
    int? count,
    String? filial,
    DateTime? date,
  }) {
    return PostedOutputModel(
      id: id ?? this.id,
      product: product ?? this.product,
      count: count ?? this.count,
      filial: filial ?? this.filial,
      date: date ?? this.date,
    );
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

  factory PostedOutputModel.fromJson(Map<String, dynamic> map) {
    return PostedOutputModel(
      id: map['id'] as int,
      product: map['product'] as int,
      count: map['count'] as int,
      filial: map['filial'] as String,
      date: DateTime.tryParse(map['date'] as String) ?? DateTime.now(),
    );
  }

  @override
  String toString() {
    return 'PostedInputModel(id: $id, product: $product, count: $count, price: $filial, date: $date)';
  }

  @override
  bool operator ==(covariant PostedOutputModel other) {
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
}
