part of 'detail_product_bloc.dart';

sealed class DetailProductState extends Equatable {
  const DetailProductState();

  @override
  List<Object> get props => [];
}

final class DetailProductInitial extends DetailProductState {}

final class DetailProductLoading extends DetailProductState {}

final class DetailProductLoaded extends DetailProductState {
  final DetailProductResponseModel detailProduct;

  const DetailProductLoaded({required this.detailProduct});
}

final class DetailProductError extends DetailProductState {
  final String message;

  const DetailProductError({required this.message});
}
