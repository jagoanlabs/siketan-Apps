part of 'toko_product_bloc.dart';

sealed class TokoProductState extends Equatable {
  const TokoProductState();

  @override
  List<Object> get props => [];
}

final class TokoProductInitial extends TokoProductState {}

final class TokoProductLoading extends TokoProductState {}

final class TokoProductLoaded extends TokoProductState {
  final TokoProductResponseModel data;

  const TokoProductLoaded({required this.data});
}

final class TokoProductError extends TokoProductState {
  final String message;

  const TokoProductError({required this.message});
}
