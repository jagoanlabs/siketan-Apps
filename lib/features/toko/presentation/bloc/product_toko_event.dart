part of 'product_toko_bloc.dart';

sealed class ProductTokoEvent extends Equatable {
  const ProductTokoEvent();

  @override
  List<Object> get props => [];
}

final class ProductTokoEventGetProduct extends ProductTokoEvent {
  final int page;
  final int limit;

  const ProductTokoEventGetProduct({required this.page, required this.limit});
}
