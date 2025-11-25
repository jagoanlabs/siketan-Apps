part of 'komoditas_table_bloc.dart';

sealed class KomoditasTableEvent extends Equatable {
  const KomoditasTableEvent();

  @override
  List<Object> get props => [];
}

class FetchKomoditasTable extends KomoditasTableEvent {
  final int page;
  final int limit;
  final String sort;

  const FetchKomoditasTable(this.page, this.limit, this.sort);
}
