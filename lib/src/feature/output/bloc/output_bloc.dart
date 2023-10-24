import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdp_project/src/common/repositories/api_repository.dart';

import '../../../common/models/category_model.dart';
import '../../../common/models/product_model.dart';
import '../models/post_output_model.dart';

part 'output_event.dart';
part 'output_state.dart';

class OutputBloc extends Bloc<OutputEvent, OutputState> {
  final ApiRepositoryImp repository;
  OutputBloc(this.repository)
      : super(
          const OutputState(
            status: OutputStatus.initial,
            categories: [],
            products: [],
          ),
        ) {
    on<OutputEvent>((event, emit) => switch (event) {
          OutputPageGetProducts e => _getProducts(e, emit),
          OutputPageLoadingEvent e => _outputLoading(e, emit),
      
      PostOutputEvent() => null,
      // TODO: Handle this case.
      OutputPageSearch() => null,
      // TODO: Handle this case.
      DeleteOutputEvent() => null,
        });
  }

  Future<void> _getProducts(
    OutputPageGetProducts e,
    Emitter<OutputState> emit,
  ) async {
    emit(
      OutputState(
        categories: state.categories,
        products: state.products,
        status: OutputStatus.loading,
      ),
    );
    try {
      List<ProductModel> products = await repository.getProducts(e.id);
      emit(
        OutputState(
          categories: state.categories,
          products: products,
          status: OutputStatus.loaded,
        ),
      );
    } catch (e) {
      emit(
        OutputState(
          status: OutputStatus.loaded,
          categories: state.categories,
          products: state.products,
          message: e.toString(),
        ),
      );
    }
  }

  Future<void> _outputLoading(
    OutputPageLoadingEvent e,
    Emitter<OutputState> emit,
  ) async {
    
    List<CategoryModel> categories = await repository.getCategories();

    emit(
      OutputState(
        status: OutputStatus.loading,
        categories: categories,
        products: state.products,
      ),
    );
  }
}
