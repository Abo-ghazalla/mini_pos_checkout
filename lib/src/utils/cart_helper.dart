import 'package:mini_pos_checkout/src/cart/models.dart';

const double vatRate = 0.15;

/// Compute the totals from a list of [CartLine] items.
///
/// This function goes through all the lines, sums up their net values, then
/// calculates the vat and the grand total. The vat rate is 15% of the
/// subtotal.
///
/// The vat and grand total are calculated to two decimal places to avoid
/// any rounding errors.
Totals computeTotals(List<CartLine> lines) {
  double subtotal = 0;
  double totalDiscount = 0;
  for (var line in lines) {
    subtotal += line.lineNet;
    totalDiscount += line.item.price * line.quantity * line.discount;
  }
  final vat = double.parse((subtotal * vatRate).toStringAsFixed(2));
  final grand = double.parse((subtotal + vat).toStringAsFixed(2));
  return Totals(
    subtotal: double.parse(subtotal.toStringAsFixed(2)),
    vat: vat,
    grandTotal: grand,
    discount: double.parse(totalDiscount.toStringAsFixed(2)),
  );
}
