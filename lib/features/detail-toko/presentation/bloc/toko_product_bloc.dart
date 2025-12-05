import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:siketan/core/utils/error_handler.dart';
import 'package:siketan/features/detail-toko/domain/model/toko_product_response_model.dart';
import 'package:siketan/features/detail-toko/domain/repository/toko_product_repository.dart';

part 'toko_product_event.dart';
part 'toko_product_state.dart';

class TokoProductBloc extends Bloc<TokoProductEvent, TokoProductState> {
  final TokoProductRepository repository;
  TokoProductBloc({required this.repository}) : super(TokoProductInitial()) {
    on<TokoProductEvent>((event, emit) {});
    on<TokoProductEventGetDetailToko>(_getDetailToko);
  }
  Future<void> _getDetailToko(
    TokoProductEventGetDetailToko event,
    Emitter<TokoProductState> emit,
  ) async {
    emit(TokoProductLoading());
    try {
      final result = await repository.getDetailToko(event.id);
      emit(TokoProductLoaded(data: result));
    } catch (e) {
      emit(TokoProductError(message: handleAppError(e)));
    }
  }
}
