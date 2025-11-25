part of 'komoditas_table_bloc.dart';

class KomoditasTableState extends Equatable {
  final bool loading;
  final int total;
  final List<Datum> rows;
  final String error;

  const KomoditasTableState({
    this.loading = false,
    this.total = 0,
    this.rows = const [],
    this.error = "",
  });

  KomoditasTableState copyWith({
    bool? loading,
    int? total,
    List<Datum>? rows,
    String? error,
  }) {
    return KomoditasTableState(
      loading: loading ?? this.loading,
      total: total ?? this.total,
      rows: rows ?? this.rows,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [loading, total, rows, error];
}
