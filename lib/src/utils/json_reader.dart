import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:mini_pos_checkout/src/catalog/catalog_item.dart';

Future<List<CatalogItem>> fetchCatalogs() async {
  final jsonString = await rootBundle.loadString('assets/catalog.json');
  final jsonData = json.decode(jsonString) as List<dynamic>;
  return jsonData.map((item) => CatalogItem.fromJson(item as Map<String, dynamic>)).toList();
}
