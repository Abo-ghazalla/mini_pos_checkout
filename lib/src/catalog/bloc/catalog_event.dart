part of 'catalog_bloc.dart';

sealed class CatalogEvent {
  const CatalogEvent();
}

final class LoadCatalog extends CatalogEvent {}
