part of 'detail_product_bloc.dart';

sealed class DetailProductEvent extends Equatable {
  const DetailProductEvent();

  @override
  List<Object> get props => [];
}

final class GetDetailProductEvent extends DetailProductEvent {
  final String id;

  const GetDetailProductEvent({required this.id});
}
