import 'package:mini_pos_checkout/src/cart/models.dart';

const double vatRate = 0.15;

Totals computeTotals(List<CartLine> lines) {
  double subtotal = 0;
  for (var line in lines) {
    subtotal += line.lineNet;
  }
  final vat = double.parse((subtotal * vatRate).toStringAsFixed(2));
  final grand = double.parse((subtotal + vat).toStringAsFixed(2));
  return Totals(subtotal: double.parse(subtotal.toStringAsFixed(2)), vat: vat, grandTotal: grand);
}
