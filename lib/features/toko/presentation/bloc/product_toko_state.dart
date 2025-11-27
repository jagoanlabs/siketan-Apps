part of 'product_toko_bloc.dart';

sealed class ProductTokoState extends Equatable {
  const ProductTokoState();

  @override
  List<Object> get props => [];
}

final class ProductTokoInitial extends ProductTokoState {}

final class ProductTokoLoading extends ProductTokoState {}

class ProductTokoLoaded extends ProductTokoState {
  final List<ProductItem> products; // untuk tab Produk
  final List<StoreItem> stores; // untuk tab Toko
  final ProductResponseModel raw; // optional jika ingin akses raw

  const ProductTokoLoaded({
    required this.products,
    required this.stores,
    required this.raw,
  });

  @override
  List<Object> get props => [products, stores, raw];
}

final class ProductTokoError extends ProductTokoState {
  final String message;

  const ProductTokoError({required this.message});
}
