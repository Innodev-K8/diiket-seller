import 'package:flutter/material.dart';

import 'order_list_item.dart';

class OrderList extends StatelessWidget {
  const OrderList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OrderListItem(),
        OrderListItem(),
      ],
    );
  }
}
