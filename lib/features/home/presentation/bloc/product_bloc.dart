import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:siketan/features/home/domain/model/product_petani_response_model.dart';
import 'package:siketan/features/home/domain/repository/home_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final HomeRepository homeRepository;
  ProductBloc({required this.homeRepository}) : super(ProductInitial()) {
    on<ProductEvent>((event, emit) {});
    on<ProductEventFetch>(_productFetch);
  }

  Future<void> _productFetch(
    ProductEventFetch event,
    Emitter<ProductState> emit,
  ) async {
    emit(ProductLoading());
    try {
      final product = await homeRepository.getProductPetani();
      emit(ProductLoaded(product: product));
    } catch (e) {
      emit(ProductError(message: e.toString()));
    }
  }
}
