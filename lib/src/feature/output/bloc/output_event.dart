part of 'output_bloc.dart';

sealed class OutputEvent extends Equatable {
  const OutputEvent();
}

class OutputPageGetProducts extends OutputEvent {
  final int id;
  const OutputPageGetProducts(this.id);

  @override
  List<Object?> get props => [id];
}

class OutputPageLoadingEvent extends OutputEvent {
  const OutputPageLoadingEvent();

  @override
  List<Object?> get props => [];
}

class PostOutputEvent extends OutputEvent {
  final PostOutputModel outputModel;

  const PostOutputEvent(this.outputModel);

  @override
  List<Object?> get props => [outputModel];
}

class OutputPageSearch extends OutputEvent {
  final String text;
  final int id;
  const OutputPageSearch({
    required this.text,
    required this.id,
  });

  @override
  List<Object?> get props => [text, id];
}

class DeleteOutputEvent extends OutputEvent {
  final int outputId;
  final int categoryId;
  const DeleteOutputEvent({
    required this.categoryId,
    required this.outputId,
  });

  @override
  List<Object?> get props => [outputId, categoryId];
}
