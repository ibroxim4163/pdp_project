part of 'input_bloc.dart';

sealed class InputPageEvent extends Equatable {
  const InputPageEvent();
}

class InputPageLoadingEvent extends InputPageEvent {
  const InputPageLoadingEvent();

  @override
  List<Object?> get props => [];
}

class InputPageGetProducts extends InputPageEvent {
  final int id;
  const InputPageGetProducts(this.id);

  @override
  List<Object?> get props => [];
}

class PostInputEvent extends InputPageEvent {
  final PostInputModel inputModel;

  const PostInputEvent(this.inputModel);

  @override
  List<Object?> get props => [inputModel];
}

class PostProductEvent extends InputPageEvent {
  final PostProductModel product;
  const PostProductEvent(this.product);

  @override
  List<Object?> get props => [product];
}

class InputPageSearchEvent extends InputPageEvent {
  final String text;
  final int id;
  const InputPageSearchEvent(
    this.text,
    this.id,
  );

  @override
  List<Object?> get props => [text];
}

class DeleteInputEvent extends InputPageEvent {
  final int inputId;
  final int categoryId;
  const DeleteInputEvent({
    required this.categoryId,
    required this.inputId,
  });

  @override
  List<Object?> get props => [inputId,categoryId];
}
