part of 'search_global_bloc.dart';

sealed class SearchGlobalEvent extends Equatable {
  const SearchGlobalEvent();

  @override
  List<Object?> get props => [];
}

// load pertama
class SearchGlobalStarted extends SearchGlobalEvent {
  final String query;

  const SearchGlobalStarted(this.query);

  @override
  List<Object?> get props => [query];
}

// User mengubah kata pencarian
class SearchGlobalQueryChanged extends SearchGlobalEvent {
  final String query;

  const SearchGlobalQueryChanged(this.query);

  @override
  List<Object?> get props => [query];
}

// User memilih filter chip
class SearchGlobalFilterChanged extends SearchGlobalEvent {
  final String? type; // null = semua

  const SearchGlobalFilterChanged(this.type);
  @override
  List<Object?> get props => [type];
}

// Pagination load more
class SearchGlobalLoadMore extends SearchGlobalEvent {
  const SearchGlobalLoadMore();

  @override
  List<Object?> get props => [];
}
