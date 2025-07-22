import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mini_pos_checkout/src/catalog/bloc/catalog_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  group('CatalogBloc', () {
    blocTest<CatalogBloc, CatalogState>(
      'emits [CatalogLoading, CatalogLoaded] when LoadCatalog is added and succeeds',
      build: () => CatalogBloc(),
      act: (bloc) => bloc.add(LoadCatalog()),
      expect: () => [isA<CatalogLoading>(), isA<CatalogLoaded>()],
    );
  });
}
