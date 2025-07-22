import 'package:mini_pos_checkout/src/cart/bloc/cart_bloc.dart';

import 'models.dart';

/// A receipt contains a header, the items sold, and the total sums.
///
/// The items are represented as a list of maps, where each map contains the
/// name of the item, the quantity sold, the price of the item, the discount
/// applied, and the net value of the line.
///
/// The total sums are represented as an instance of [Totals].
///
/// The receipt also contains the date and time when it was created.
class Receipt {
  final String header;
  final List<Map<String, dynamic>> lines;
  final Totals totals;
  final DateTime dateTime;

  Receipt({
    required this.header,
    required this.lines,
    required this.totals,
    required this.dateTime,
  });
}

/// Builds a receipt from a [CartState] and a [DateTime].
///
/// The items are represented as a list of maps, where each map contains the
/// name of the item, the quantity sold, the price of the item, the discount
/// applied, and the net value of the line.
///
/// The total sums are represented as an instance of [Totals].
///
/// The receipt also contains the date and time when it was created.
Receipt buildReceipt(CartState state, DateTime when) {
  return Receipt(
    header: "Receiptt",
    lines: state.lines.map((l) => {
      "name": l.item.name,
      "qty": l.quantity,
      "price": l.item.price,
      "discount": l.discount,
      "lineNet": l.lineNet,
    }).toList(),
    totals: state.totals,
    dateTime: when,
  );
}
