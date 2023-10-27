import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/models/product_model.dart';
import '../models/post_input_model.dart';
import '../models/post_product_model.dart';
import '../models/posted_input_model.dart';
import '../repository/input_repository.dart';

part 'input_event.dart';
part 'input_state.dart';

List<ProductModel> inputProducts = [];

class InputBloc extends Bloc<InputPageEvent, InputState> {
  final InputRepositoryImp repository;

  InputBloc(this.repository)
      : super(
          const InputLoadingState(products: []),
        ) {
    on<InputPageEvent>(
      (event, emit) async => switch (event) {
        InputPageGetProducts e => await _getProducts(e, emit),
        PostInputEvent e => await _postInput(e, emit),
        PostProductEvent e => await _postProduct(e, emit),
        InputPageSearchEvent e => await _search(e, emit),
        DeleteInputEvent e => await _deleteInput(e, emit),
        RefreshInput e => _refresh(e, emit),
      },
      transformer: sequential(),
    );
  }

  Future<void> _getProducts(
    InputPageGetProducts e,
    Emitter emit,
  ) async {
    emit(
      InputLoadingState(products: state.products),
    );

    try {
      List<ProductModel> products = await repository.getProducts(e.id);
      inputProducts = products.toList();
      emit(InputLoadedState(products: products));
    } catch (e) {
      emit(
        InputErrorState(
          products: state.products,
          message: e.toString(),
        ),
      );
    }
  }

  Future<void> _postInput(
    PostInputEvent e,
    Emitter emit,
  ) async {
    try {
      PostedInputModel postedProduct = await repository.postInput(
        e.inputModel,
      );
      debugPrint(postedProduct.toString());
    } catch (e) {
      emit(
        InputErrorState(
          products: state.products,
          message: e.toString(),
        ),
      );
    }
  }

  Future<void> _postProduct(
    PostProductEvent e,
    Emitter emit,
  ) async {
    emit(InputLoadingState(products: state.products));
    try {
      List<ProductModel> products = await repository.getProducts(e.categoryId);
      print("------------------------------${products.length}---------------");
      ProductModel product = await repository.postProduct(e.product);
      if (e.categoryId == e.product.category) {
        products.add(product);
        print(
            "------------------------------${products.length}---------------");

        emit(InputSuccessCratedState(products: products));
      }
    } catch (e) {
      emit(
        InputErrorState(
          products: state.products,
          message: e.toString(),
        ),
      );
    }
  }

  Future<void> _search(
    InputPageSearchEvent e,
    Emitter emit,
  ) async {
    emit(InputLoadingState(products: state.products));
    try {
      List<ProductModel> searchedProducts = [];
      if (e.text.isEmpty) {
        searchedProducts = await repository.getProducts(e.id);
        inputProducts = searchedProducts.toList();
      } else {
        searchedProducts = await repository.search(e.text);
        inputProducts = searchedProducts.toList();
      }
      emit(InputLoadedState(products: searchedProducts));
    } catch (e) {
      emit(
        InputErrorState(
          products: state.products,
          message: e.toString(),
        ),
      );
    }
  }

  Future<void> _deleteInput(
    DeleteInputEvent e,
    Emitter emit,
  ) async {
    try {
      print(e.product);
      await repository.deleteInput(e.product.id);
      List<ProductModel> products = await repository.getProducts(e.categoryId);
      emit(InputLoadedState(products: products));
    } catch (e) {
      emit(
        InputErrorState(
          products: state.products,
          message: e.toString(),
        ),
      );
    }
  }

  Future<void> _refresh(
    RefreshInput e,
    Emitter<InputState> emit,
  ) async {
    // emit(InputLoadingState(products: state.products));
    List<ProductModel> products = await repository.getProducts(e.categoryId);
    emit(InputLoadedState(products: products));
  }
}
