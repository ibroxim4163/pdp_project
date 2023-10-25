part of 'input_bloc.dart';

enum InputStatus {
  loading,
  loaded,
  error,
  initial,
}

abstract class InputState extends Equatable{
  const InputState();
}

class InputLoadingState extends InputState {
  const InputLoadingState();
  
  @override
  List<Object?> get props => [];
}

class InputLoadedState extends InputState {
  const InputLoadedState({required this.products});

  final List<ProductModel> products;
  
  @override
  List<Object?> get props => [products];
  
}
class InputSuccessCratedState extends InputState {
  const InputSuccessCratedState({required this.products});

  final List<ProductModel> products;
  
  @override
  List<Object?> get props => [products];
}

class InputErrorState extends InputState {
  final String message;

  const InputErrorState({
    required this.message,
  });
  
  @override
  List<Object?> get props => [message];
}
