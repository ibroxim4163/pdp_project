part of 'output_bloc.dart';

enum OutputStatus { loading, initial, loaded }

 class OutputState extends Equatable {
  final OutputStatus status;
  final List<CategoryModel> categories;
  final List<ProductModel> products;
  final String? message;
  const OutputState({
    required this.status,
    required this.categories,
    required this.products,
    this.message,
  });

  @override
  List<Object> get props => [status,categories,products,message??""];
}
