part of 'catalog_bloc.dart';

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
