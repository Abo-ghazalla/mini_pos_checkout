part of 'cart_bloc.dart';

/// The state of the cart.
///
/// This class contains the current state of the cart, which consists of a list
/// of [CartLine] items and a [Totals] object with the current subtotal, vat and
/// grand total.
class CartState extends Equatable {
  /// The list of items in the cart.
  final List<CartLine> lines;

  /// The totals of the items in the cart.
  final Totals totals;

  /// Creates a new [CartState] with the given [lines] and [totals].
  const CartState({required this.lines, required this.totals});

  @override
  List<Object?> get props => [lines, totals];

  /// Creates a copy of this [CartState] with the given [lines] and [totals].
  /// If [lines] or [totals] are null, the original values will be used.
  
  CartState copyWith({List<CartLine>? lines, Totals? totals}) {
    return CartState(lines: lines ?? this.lines, totals: totals ?? this.totals);
  }

  /// Creates a new [CartState] with an empty list of items and all totals set
  /// to 0.
  factory CartState.initial() {
    return CartState(lines: const [], totals: const Totals(subtotal: 0, vat: 0, grandTotal: 0));
  }
}
