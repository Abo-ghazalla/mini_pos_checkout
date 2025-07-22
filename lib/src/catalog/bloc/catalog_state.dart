part of 'catalog_bloc.dart';

/// The state of the catalog.
///
/// This state is part of the [CatalogBloc] and holds the currently loaded
/// catalog items.
///
/// The [CatalogState] is a sealed class, meaning that it can be one of the
/// following states:
///
/// - [CatalogInitial]: The initial state of the catalog.
/// - [CatalogLoading]: The catalog is currently being loaded.
/// - [CatalogLoaded]: The catalog has been loaded and the items are available.
sealed class CatalogState extends Equatable {
  final List<CatalogItem>? items;
  const CatalogState({this.items});

  @override
  List<Object> get props => [items ?? []];
}

final class CatalogInitial extends CatalogState {}

final class CatalogLoading extends CatalogState {}

final class CatalogLoaded extends CatalogState {
  const CatalogLoaded({required List<CatalogItem> items}) : super(items: items);
}
