part of 'cart_bloc.dart';

class CartState extends Equatable {
  final List<CartLine> lines;
  final Totals totals;

  const CartState({required this.lines, required this.totals});

  @override
  List<Object?> get props => [lines, totals];
  
  CartState copyWith({List<CartLine>? lines, Totals? totals}) {
    return CartState(lines: lines ?? this.lines, totals: totals ?? this.totals);
  }

  factory CartState.initial() {
    return CartState(lines: const [], totals: const Totals(subtotal: 0, vat: 0, grandTotal: 0));
  }
}
