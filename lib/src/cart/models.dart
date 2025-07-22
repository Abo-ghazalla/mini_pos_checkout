import 'package:equatable/equatable.dart';
import 'package:mini_pos_checkout/src/catalog/catalog_item.dart';

class CartLine extends Equatable {
  final CatalogItem item;
  final int quantity;
  final double discount;

  const CartLine({required this.item, required this.quantity,  this.discount = 0.0});

  double get lineNet => item.price * quantity * (1 - discount);

  CartLine copyWith({CatalogItem? item, int? quantity, double? discount}) {
    return CartLine(
      item: item ?? this.item,
      quantity: quantity ?? this.quantity,
      discount: discount ?? this.discount,
    );
  }

  factory CartLine.fromJson(Map<String, dynamic> json) {
    return CartLine(
      item: CatalogItem.fromJson(json['item'] as Map<String, dynamic>),
      quantity: (json['quantity'] as num).toInt(),
      discount: (json['discount'] as num).toDouble(),
    );


  }

  Map<String, dynamic> toJson() {
    return {
      'item': item.toJson(),
      'quantity': quantity,
      'discount': discount,
    };
  }

  @override
  List<Object?> get props => [item, quantity, discount];
}

class Totals extends Equatable {
  final double subtotal;
  final double vat;
  final double grandTotal;

  const Totals({required this.subtotal, required this.vat, required this.grandTotal});

  @override
  List<Object?> get props => [subtotal, vat, grandTotal];

  factory Totals.fromJson(Map<String, dynamic> json) {
    return Totals(
      subtotal: (json['subtotal'] as num).toDouble(),
      vat: (json['vat'] as num).toDouble(),
      grandTotal: (json['grandTotal'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'subtotal': subtotal,
      'vat': vat,
      'grandTotal': grandTotal,
    };
  }
}
