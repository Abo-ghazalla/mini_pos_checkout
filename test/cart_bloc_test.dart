import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mini_pos_checkout/src/cart/bloc/cart_bloc.dart';
import 'package:mini_pos_checkout/src/catalog/catalog_item.dart';
import 'package:mocktail/mocktail.dart';

final testItemA = CatalogItem(id: '1', name: 'Aa', price: 10.00);
final testItemB = CatalogItem(id: '2', name: 'B', price: 20.00);

void main() {
  late Storage storage;
  WidgetsFlutterBinding.ensureInitialized();
  setUp(() {
    storage = MockStorage();
    when(() => storage.write(any(), any<dynamic>())).thenAnswer((_) async {});
    HydratedBloc.storage = storage;
  });


  group('CartBloc', () {
    blocTest<CartBloc, CartState>(
      'Adds two items with correct totals',
      build: () => CartBloc(),
      act: (bloc) {
        bloc.add(AddItem(testItemA));
        bloc.add(AddItem(testItemB));
      },
      verify: (bloc) {
        final totals = bloc.state.totals;
        expect(totals.subtotal, 30.00);
        expect(totals.vat, 4.50); // 15% of 30 = 4.50
        expect(totals.grandTotal, 34.50);
      },
    );

    blocTest<CartBloc, CartState>(
      'Qty/Discount changes update totals',
      build: () => CartBloc(),
      act: (bloc) {
        bloc.add(AddItem(testItemA));
        bloc.add(ChangeQty(testItemA, 3));
        bloc.add(ChangeDiscount(testItemA, 0.2)); // 20%
      },
      verify: (bloc) {
        expect(bloc.state.lines.single.quantity, 3);
        expect(bloc.state.lines.single.discount, 0.2);
        expect(bloc.state.totals.subtotal, 24.00); // 10*3*0.8 = 24
        expect(bloc.state.totals.vat, 3.60);
        expect(bloc.state.totals.grandTotal, 27.60);
      },
    );

    blocTest<CartBloc, CartState>(
      'Clearing the cart resets state',
      build: () => CartBloc(),
      act: (bloc) {
        bloc.add(AddItem(testItemA));
        bloc.add(ClearCart());
      },
      expect: () => [
        isA<CartState>(), // after add
        CartState.initial(),
      ],
    );
  });
}

class MockStorage extends Mock implements Storage {}
