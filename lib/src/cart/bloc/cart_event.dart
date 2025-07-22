part of 'cart_bloc.dart';

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



