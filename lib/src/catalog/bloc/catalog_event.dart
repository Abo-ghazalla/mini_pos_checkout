part of 'catalog_bloc.dart';

sealed class CatalogEvent {
  const CatalogEvent();
}
/// An event to load the catalog.
///
/// This event is used to trigger the loading of the catalog items in the
/// [CatalogBloc]. When this event is added to the bloc, it will emit a
/// [CatalogLoading] state followed by a [CatalogLoaded] state with the
/// fetched catalog items.
final class LoadCatalog extends CatalogEvent {}
