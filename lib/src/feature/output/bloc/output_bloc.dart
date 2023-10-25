import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/models/product_model.dart';
import '../models/post_output_model.dart';
import '../repository/output_repository.dart';

part 'output_event.dart';
part 'output_state.dart';

class OutputBloc extends Bloc<OutputEvent, OutputState> {
  final OutputRepositoryImp repository;
  OutputBloc(this.repository)
      : super(
          const OutputRefreshState(
            products: [],
          ),
        ) {
    on<OutputEvent>((event, emit) => switch (event) {
          OutputPageGetProducts e => _getProducts(e, emit),
          PostOutputEvent e => _postOutput(e, emit),
          OutputPageSearch e => _searchOutput(e, emit),
          DeleteOutputEvent e => _deleteOutput(e, emit),
        });
  }

  Future<void> _getProducts(
    OutputPageGetProducts e,
    Emitter<OutputState> emit,
  ) async {
    emit(
      OutputLoadingState(
        products: state.products,
      ),
    );
    try {
      List<ProductModel> products = await repository.getProducts(e.id);
      emit(
        OutputRefreshState(
          products: products,
        ),
      );
    } catch (e) {
      emit(
        OutputErrorState(
          products: state.products,
          message: e.toString(),
        ),
      );
    }
  }

  Future<void> _postOutput(
    PostOutputEvent e,
    Emitter<OutputState> emit,
  ) async {
    final response = await repository.postOutput(e.outputModel);
    debugPrint(response.toString());
  }

  Future<void> _searchOutput(
    OutputPageSearch e,
    Emitter<OutputState> emit,
  ) async {
    emit(OutputLoadingState(products: state.products));
    List<ProductModel> searchedProducts = [];
    if (e.text.isEmpty) {
      searchedProducts = await repository.getProducts(e.id);
    } else {
      searchedProducts = await repository.search(e.text);
    }
    emit(
      OutputRefreshState(
        products: searchedProducts,
      ),
    );
  }

  Future<void> _deleteOutput(
    DeleteOutputEvent e,
    Emitter<OutputState> emit,
  ) async {
    try {
      await repository.deleteOutput(e.outputId);
      print("deleted");
      List<ProductModel> products = await repository.getProducts(e.categoryId);
      emit(OutputRefreshState(products: products));
    } catch (e) {
      emit(
        OutputErrorState(
          products: state.products,
          message: e.toString(),
        ),
      );
    }
  }
}
