part of 'cart_bloc.dart';

/// Events that can be added to the [CartBloc].
///
/// This sealed class can be one of the following events:
///
/// - [AddItem]: Add an item to the cart.
/// - [RemoveItem]: Remove an item from the cart.
/// - [ChangeQty]: Update the quantity of an item in the cart.
/// - [ChangeDiscount]: Update the discount of an item in the cart.
/// - [ClearCart]: Clear the cart.
sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

final class AddItem extends CartEvent {
  final CatalogItem item;

  const AddItem(this.item);

  @override
  List<Object> get props => [item];
}

final class RemoveItem extends CartEvent {
  final CatalogItem item;

  const RemoveItem(this.item);

  @override
  List<Object> get props => [item];
}

final class ChangeQty extends CartEvent {
  final CatalogItem item;
  final int quantity;

  const ChangeQty(this.item, this.quantity);

  @override
  List<Object> get props => [item, quantity];
}

final class ChangeDiscount extends CartEvent {
  final CatalogItem item;
  final double discount;

  const ChangeDiscount(this.item, this.discount);

  @override
  List<Object> get props => [item, discount];
}

final class ClearCart extends CartEvent {}
