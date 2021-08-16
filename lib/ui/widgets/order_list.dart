import 'package:diiket_models/all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:seller/data/providers/order/active_orders_provider.dart';
import 'package:seller/ui/widgets/small_loading.dart';

import 'order_list_item.dart';

class OrderList extends HookWidget {
  const OrderList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ordersState = useProvider(activeOrdersProvider);

    return ordersState.when(
      data: (orders) => _buildList(orders),
      loading: () => Center(child: SmallLoading()),
      error: (error, stackTrace) => Center(child: Text(error.toString())),
    );
  }

  _buildList(List<Order> orders) {
    if (orders.isEmpty) {
      return Center(
        child: Text(
          'Tidak ada pesanan untuk saat ini.\nTarik ke bawah untuk memperbarui data...',
          textAlign: TextAlign.center,
        ),
      );
    }

    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: orders.length,
        itemBuilder: (context, index) => OrderListItem(
          order: orders[index],
        ),
      );
  }
}
