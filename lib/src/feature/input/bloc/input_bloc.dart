import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/models/category_model.dart';
import '../../../common/models/product_model.dart';
import '../../../common/repositories/api_repository.dart';
import '../models/post_input_model.dart';
import '../models/post_product_model.dart';
import '../models/posted_input_model.dart';

part 'input_event.dart';
part 'input_state.dart';

class InputBloc extends Bloc<InputPageEvent, InputPageState> {
  final ApiRepositoryImp repository;

  InputBloc(this.repository)
      : super(const InputPageState(
          categories: [],
          products: [],
          status: InputStatus.initial,
        )) {
    on<InputPageEvent>((event, emit) => switch (event) {
          InputPageLoadingEvent e => _loadingInput(e, emit),
          InputPageGetProducts e => _getProducts(e, emit),
          PostInputEvent e => _postInput(e, emit),
          PostProductEvent e => _postProduct(e, emit),
          InputPageSearchEvent e => _search(e, emit),
        });
  }

  Future<void> _loadingInput(
    InputPageLoadingEvent e,
    Emitter<InputPageState> emit,
  ) async {
    emit(
      InputPageState(
        status: InputStatus.loading,
        categories: state.categories,
        products: state.products,
      ),
    );
    try {
      List<CategoryModel> categories = await repository.getCategories();
      emit(
        InputPageState(
          status: InputStatus.loaded,
          categories: categories,
          products: const [],
        ),
      );
    } catch (e) {
      emit(
        InputPageState(
          status: InputStatus.error,
          categories: state.categories,
          products: state.products,
          message: e.toString(),
        ),
      );
    }
  }

  Future<void> _getProducts(
    InputPageGetProducts e,
    Emitter<InputPageState> emit,
  ) async {
    emit(
      InputPageState(
        categories: state.categories,
        products: state.products,
        status: InputStatus.loading,
      ),
    );
    try {
      List<ProductModel> products = await repository.getProducts(e.id);
      emit(
        InputPageState(
          categories: state.categories,
          products: products,
          status: InputStatus.loaded,
        ),
      );
    } catch (e) {
      emit(
        InputPageState(
          status: InputStatus.loaded,
          categories: state.categories,
          products: state.products,
          message: e.toString(),
        ),
      );
    }
  }

  Future<void> _postInput(
    PostInputEvent e,
    Emitter<InputPageState> emit,
  ) async {
    try {
      PostedInputModel postedProduct = await repository.postInput(e.inputModel);
      debugPrint(postedProduct.toString());
    } catch (e) {
      emit(
        InputPageState(
          categories: state.categories,
          products: state.products,
          status: InputStatus.error,
          message: e.toString(),
        ),
      );
    }
  }

  Future<void> _postProduct(
    PostProductEvent e,
    Emitter<InputPageState> emit,
  ) async {
    try {
      ProductModel productModel = await repository.postProduct(e.product);
      debugPrint(productModel.toString());
    } catch (e) {
      emit(
        InputPageState(
          categories: state.categories,
          products: state.products,
          status: InputStatus.error,
          message: e.toString(),
        ),
      );
    }
  }

  Future<void> _search(
    InputPageSearchEvent e,
    Emitter<InputPageState> emit,
  ) async {
    emit(
      InputPageState(
        categories: state.categories,
        products: state.products,
        status: InputStatus.loading,
      ),
    );
    List<ProductModel> searchedProducts = [];
    if (e.text.isEmpty) {
      searchedProducts = await repository.getProducts(e.id);
    } else {
      searchedProducts = await repository.search(e.text);
    }
    emit(
      InputPageState(
        categories: state.categories,
        products: searchedProducts,
        status: InputStatus.loaded,
      ),
    );
  }
}
