part of 'product_bloc.dart';

sealed class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

final class ProductInitial extends ProductState {}

final class ProductLoading extends ProductState {}

final class ProductLoaded extends ProductState {
  final ProductPetaniResponseModel product;
  const ProductLoaded({required this.product});
}

final class ProductError extends ProductState {
  final String message;
  const ProductError({required this.message});
  @override
  List<Object> get props => [message];
}
