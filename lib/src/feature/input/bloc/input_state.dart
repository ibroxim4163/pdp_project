part of 'input_bloc.dart';

enum InputStatus {
  loading,
  loaded,
  error,
  initial,
}

class InputPageState extends Equatable {
  final InputStatus status;
  final List<CategoryModel> categories;
  final List<ProductModel> products;
  final String? message;
  const InputPageState({
    required this.categories,
    required this.products,
    required this.status,
    this.message,
  });

  @override
  List<Object> get props => [
        categories,
        products,
        status,
        message ?? "",
      ];
}
