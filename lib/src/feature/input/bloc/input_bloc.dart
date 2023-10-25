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

class InputBloc extends Bloc<InputPageEvent, InputState> {
  final InputRepositoryImp repository;

  InputBloc(this.repository)
      : super(
          const InputLoadingState(),
        ) {
    on<InputPageEvent>(
      (event, emit) async => switch (event) {
        InputPageGetProducts e => await _getProducts(e, emit),
        PostInputEvent e => await _postInput(e, emit),
        PostProductEvent e => await _postProduct(e, emit),
        InputPageSearchEvent e => await _search(e, emit),
        DeleteInputEvent e => await _deleteInput(e, emit),
      },
      transformer: sequential(),
    );
  }

  Future<void> _getProducts(
    InputPageGetProducts e,
    Emitter emit,
  ) async {
    emit(
      const InputLoadingState(),
    );
    try {
      List<ProductModel> products = await repository.getProducts(e.id);
      print(products);
      print('-----------------------------------');
      emit(InputLoadedState(products: products));
    } catch (e) {
      emit(
        InputErrorState(
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
          message: e.toString(),
        ),
      );
    }
  }

  Future<void> _postProduct(
    PostProductEvent e,
    Emitter emit,
  ) async {
    try {
      List<ProductModel> products = await repository.getProducts(e.categoryId);
      await repository.postProduct(e.product);
      if (e.categoryId == e.product.category) {
        print("${e.categoryId}----------${e.product.category}");
        products = await repository.getProducts(e.categoryId);
        emit(InputSuccessCratedState(products: products));
        print('-=-=-=-=-=-=-=-=-=-=-');
      }
    } catch (e) {
      emit(
        InputErrorState(
          message: e.toString(),
        ),
      );
    }
  }

  Future<void> _search(
    InputPageSearchEvent e,
    Emitter emit,
  ) async {
    emit(const InputLoadingState());
    Future.delayed(const Duration(seconds: 2));
    try {
      List<ProductModel> searchedProducts = [];
      if (e.text.isEmpty) {
        searchedProducts = await repository.getProducts(e.id);
      } else {
        searchedProducts = await repository.search(e.text);
      }
      emit(InputLoadedState(products: searchedProducts));
    } catch (e) {
      emit(
        InputErrorState(
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
      await repository.deleteInput(e.inputId);
      List<ProductModel> products = await repository.getProducts(e.categoryId);
      emit(InputLoadedState(products: products));
    } catch (e) {
      emit(
        InputErrorState(
          message: e.toString(),
        ),
      );
    }
  }
}

  // Future<void> _getProducts(
  //   InputPageGetProducts e,
  //   Emitter<InputPageState> emit,
  // ) async {
  //   emit(
  //     InputPageState(
  //       products: state.products,
  //       status: InputStatus.loading,
  //     ),
  //   );
  //   try {
  //     List<ProductModel> products = await repository.getProducts(e.id);
  //     emit(
  //       InputPageState(
  //         products: products,
  //         status: InputStatus.loaded,
  //       ),
  //     );
  //   } catch (e) {
  //     emit(
  //       InputPageState(
  //         status: InputStatus.loaded,
  //         products: state.products,
  //         message: e.toString(),
  //       ),
  //     );
  //   }
  // }

  // Future<void> _postInput(
  //   PostInputEvent e,
  //   Emitter<InputPageState> emit,
  // ) async {
  //   try {
  //     PostedInputModel postedProduct = await repository.postInput(
  //       e.inputModel,
  //     );
  //     debugPrint(postedProduct.toString());
  //   } catch (e) {
  //     emit(
  //       InputPageState(
  //         products: state.products,
  //         status: InputStatus.error,
  //         message: e.toString(),
  //       ),
  //     );
  //   }
  // }

  // Future<void> _postProduct(
  //   PostProductEvent e,
  //   Emitter<InputPageState> emit,
  // ) async {
  //   try {
  //     //TODO refresh page
  //     emit(
  //       InputPageState(
  //         products: state.products,
  //         status: InputStatus.loading,
  //       ),
  //     );
  //     List<ProductModel> products = await repository.getProducts(e.categoryId);
  //     ProductModel productModel = await repository.postProduct(e.product);
  //     print("--------------------------------");
  //     print(products.length);
  //     if (e.categoryId == e.product.category) {
  //       print("${e.categoryId}----------${e.product.category}");
  //       products = await repository.getProducts(e.categoryId);
  //     }
  //     print("--------------------------------");
  //     print(products.length);
  //     print("--------------------------------");

  //     debugPrint(productModel.toString());
  //     emit(
  //       InputPageState(
  //         products: products,
  //         status: InputStatus.loaded,
  //       ),
  //     );
  //   } catch (e) {
  //     emit(
  //       InputPageState(
  //         products: state.products,
  //         status: InputStatus.error,
  //         message: e.toString(),
  //       ),
  //     );
  //   }
  // }

  // Future<void> _search(
  //   InputPageSearchEvent e,
  //   Emitter<InputPageState> emit,
  // ) async {
  //   emit(
  //     InputPageState(
  //       products: state.products,
  //       status: InputStatus.loading,
  //     ),
  //   );
  //   List<ProductModel> searchedProducts = [];
  //   if (e.text.isEmpty) {
  //     searchedProducts = await repository.getProducts(e.id);
  //   } else {
  //     searchedProducts = await repository.search(e.text);
  //   }
  //   emit(
  //     InputPageState(
  //       products: searchedProducts,
  //       status: InputStatus.loaded,
  //     ),
  //   );
  // }

  // Future<void> _deleteInput(
  //   DeleteInputEvent e,
  //   Emitter<InputPageState> emit,
  // ) async {
  //   try {
  //     // print("-----------------------------");
  //     // print(state.products.length);
  //     // print("-----------------------------");
  //     await repository.deleteInput(e.inputId);
  //     List<ProductModel> products = await repository.getProducts(e.categoryId);
  //     // print(products.length);
  //     // print("-----------------------------");

  //     emit(
  //       InputPageState(
  //         products: products,
  //         status: InputStatus.loaded,
  //       ),
  //     );
  //   } catch (e) {
  //     emit(
  //       InputPageState(
  //         products: state.products,
  //         status: InputStatus.error,
  //         message: e.toString(),
  //       ),
  //     );
  //   }
  // }
