part of 'history_bloc.dart';

enum HistoryStatus { loading, loaded, initial }

class HistoryState extends Equatable {
  final HistoryStatus status;
  final List<InputModel> inputs;
  final List<OutputModel> outputs;
  const HistoryState({
    required this.status,
    required this.inputs,
    required this.outputs,
  });

  @override
  List<Object> get props => [status,inputs,outputs];
}
