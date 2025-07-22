import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mini_pos_checkout/src/cart/models.dart';
import 'package:mini_pos_checkout/src/catalog/catalog_item.dart';
import 'package:mini_pos_checkout/src/utils/cart_helper.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends HydratedBloc<CartEvent, CartState> {
  CartBloc() : super(CartState.initial()) {
    on<AddItem>(_onAddItem);
    on<RemoveItem>(_onRemoveItem);
    on<ChangeQty>(_onChangeQty);
    on<ChangeDiscount>(_onChangeDiscount);
    on<ClearCart>(_onClearCart);
  }

  // Hydration methods
  @override
  CartState? fromJson(Map<String, dynamic> json) {
    try {
      final lines = (json['lines'] as List).map((e) => CartLine.fromJson(e as Map<String, dynamic>)).toList();
      final totals = Totals.fromJson(json['totals'] as Map<String, dynamic>);
      return CartState(lines: lines, totals: totals);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(CartState state) => {
    'lines': state.lines.map((e) => e.toJson()).toList(),
    'totals': state.totals.toJson(),
  };

  /// Handles [AddItem] by adding or updating the item in the cart.
  void _onAddItem(AddItem event, Emitter<CartState> emit) {
    var lines = [...state.lines];
    final lineIndex = lines.indexWhere((l) => l.item.id == event.item.id);
    if (lineIndex == -1) {
      lines.add(CartLine(item: event.item, quantity: 1));
    } else {
      final line = lines[lineIndex];
      lines[lineIndex] = line.copyWith(quantity: line.quantity + 1);
    }
    emit(CartState(lines: lines, totals: computeTotals(lines)));
  }

  /// Handles [RemoveItem] by removing the item from the cart.
  void _onRemoveItem(RemoveItem event, Emitter<CartState> emit) {
    var lines = [...state.lines];
    lines.removeWhere((l) => l.item == event.item);
    emit(CartState(lines: lines, totals: computeTotals(lines)));
  }

  /// Handles [ChangeQty] by updating the quantity of the item in the cart.
  void _onChangeQty(ChangeQty event, Emitter<CartState> emit) {
    var lines = [...state.lines];
    final lineIndex = lines.indexWhere((l) => l.item.id == event.item.id);
    if (lineIndex != -1) {
      final line = lines[lineIndex];
      if (event.quantity > 0) {
        lines[lineIndex] = line.copyWith(quantity: event.quantity);
      } else {
        lines.removeAt(lineIndex);
      }
      emit(CartState(lines: lines, totals: computeTotals(lines)));
    }
  }

  /// Handles [ChangeDiscount] by updating the discount of the item in the cart.
  void _onChangeDiscount(ChangeDiscount event, Emitter<CartState> emit) {
    var lines = [...state.lines];
    final lineIndex = lines.indexWhere((l) => l.item.id == event.item.id);
    if (lineIndex != -1) {
      final line = lines[lineIndex];
      lines[lineIndex] = line.copyWith(discount: event.discount);
      emit(CartState(lines: lines, totals: computeTotals(lines)));
    }
  }

  /// Handles [ClearCart] by clearing the cart.
  void _onClearCart(ClearCart event, Emitter<CartState> emit) {
    emit(CartState.initial());
  }
}
