part of 'toko_product_bloc.dart';

sealed class TokoProductEvent extends Equatable {
  const TokoProductEvent();

  @override
  List<Object> get props => [];
}

final class TokoProductEventGetDetailToko extends TokoProductEvent {
  final String id;

  const TokoProductEventGetDetailToko({required this.id});
}
