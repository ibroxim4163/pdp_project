class InputModel {
  final int id;
  final int product;
  final int count;
  final String price;
  final DateTime date;

  const InputModel({
    required this.id,
    required this.product,
    required this.count,
    required this.price,
    required this.date,
  });

  

  InputModel copyWith({
    int? id,
    int? product,
    int? count,
    String? price,
    DateTime? date,
  }) {
    return InputModel(
      id: id ?? this.id,
      product: product ?? this.product,
      count: count ?? this.count,
      price: price ?? this.price,
      date: date ?? this.date,
    );
  }

  @override
  String toString() {
    return 'ProductModel(id: $id, product: $product, count: $count, price: $price, date: $date)';
  }

  @override
  bool operator ==(covariant InputModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.product == product &&
      other.count == count &&
      other.price == price &&
      other.date == date;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      product.hashCode ^
      count.hashCode ^
      price.hashCode ^
      date.hashCode;
  }

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'id': id,
      'product': product,
      'count': count,
      'price': price,
      'date': date.millisecondsSinceEpoch,
    };
  }

  factory InputModel.fromJson(Map<String, Object?> map) {
    return InputModel(
      id: map['id'] as int,
      product: map['product'] as int,
      count: map['count'] as int,
      price: map['price'] as String,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
    );
  }

  
}