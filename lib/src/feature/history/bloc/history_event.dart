part of 'history_bloc.dart';

sealed class HistoryEvent extends Equatable {
  const HistoryEvent();

  @override
  List<Object?> get props => [];
}

class GetInputsAndOutputsForHistory extends HistoryEvent {
  const GetInputsAndOutputsForHistory();
}

class HistoryLoadingEvent extends HistoryEvent {
  const HistoryLoadingEvent();
}

