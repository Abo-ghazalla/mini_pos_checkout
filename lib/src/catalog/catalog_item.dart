import 'package:equatable/equatable.dart';

/// Catalog item model.
/// - id: unique identifier for the item
/// - name: name of the item
/// - price: price of the item
class CatalogItem extends Equatable {
  final String id;
  final String name;
  final double price;

  const CatalogItem({required this.id, required this.name, required this.price});

  factory CatalogItem.fromJson(Map<String, dynamic> json) {
    return CatalogItem(id: json['id'], name: json['name'], price: json['price']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'price': price};
  }

  @override
  List<Object> get props => [id];
}
