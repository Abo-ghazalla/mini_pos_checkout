import 'package:mini_pos_checkout/src/cart/bloc/cart_bloc.dart';

import 'models.dart';

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
