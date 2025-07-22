import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mini_pos_checkout/src/catalog/catalog_item.dart';
import 'package:mini_pos_checkout/src/utils/json_reader.dart';

part 'catalog_event.dart';
part 'catalog_state.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  CatalogBloc() : super(CatalogInitial()) {
    on<LoadCatalog>(_onLoadCatalog);
  }

  Future<void> _onLoadCatalog(LoadCatalog event, Emitter<CatalogState> emit) async {
    emit(CatalogLoading());
    final items = await fetchCatalogs();
    emit(CatalogLoaded(items: items));
  }
}
