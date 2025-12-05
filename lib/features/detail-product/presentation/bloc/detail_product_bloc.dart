import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:siketan/core/utils/error_handler.dart';
import 'package:siketan/features/detail-product/domain/model/detail_product_response_model.dart';
import 'package:siketan/features/detail-product/domain/repository/detail_product_repository.dart';

part 'detail_product_event.dart';
part 'detail_product_state.dart';

class DetailProductBloc extends Bloc<DetailProductEvent, DetailProductState> {
  final DetailProductRepository repository;
  DetailProductBloc({required this.repository})
    : super(DetailProductInitial()) {
    on<DetailProductEvent>((event, emit) {});
    on<GetDetailProductEvent>(_fetchDetailProduct);
  }

  Future<void> _fetchDetailProduct(
    GetDetailProductEvent event,
    Emitter<DetailProductState> emit,
  ) async {
    emit(DetailProductLoading());
    try {
      final result = await repository.getDetailProduct(event.id);
      emit(DetailProductLoaded(detailProduct: result));
    } catch (e) {
      emit(DetailProductError(message: handleAppError(e)));
    }
  }
}
