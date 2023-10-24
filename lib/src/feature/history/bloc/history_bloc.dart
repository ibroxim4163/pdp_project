import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/models/input_model.dart';
import '../../../common/models/output_model.dart';
import '../../../common/repositories/api_repository.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final ApiRepositoryImp repository;
  HistoryBloc(this.repository)
      : super(
          const HistoryState(
            status: HistoryStatus.initial,
            inputs: [],
            outputs: [],
          ),
        ) {
    on<HistoryEvent>((event, emit) => switch (event) {
          GetInputsAndOutputsForHistory() => _getInputsAndOutputs(emit),
          HistoryLoadingEvent() => _loading(emit),
        });
  }

  Future<void> _getInputsAndOutputs(Emitter<HistoryState> emit) async {
    emit(
      HistoryState(
        status: HistoryStatus.loading,
        inputs: state.inputs,
        outputs: state.outputs,
      ),
    );
    try {
      List<InputModel> inputs = await repository.getInputs();
      List<OutputModel> outputs = await repository.getOutputs();
      emit(
        HistoryState(
          status: HistoryStatus.loaded,
          inputs: inputs,
          outputs: outputs,
        ),
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> _loading(Emitter<HistoryState> emit) async {}
}
