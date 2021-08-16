import 'package:diiket_models/all.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:seller/data/network/order_service.dart';

final activeOrdersProvider =
    StateNotifierProvider<ActiveOrdersState, AsyncValue<List<Order>>>(
  (ref) {
    return ActiveOrdersState(ref.read);
  },
);

class ActiveOrdersState extends StateNotifier<AsyncValue<List<Order>>> {
  final Reader _read;

  ActiveOrdersState(this._read) : super(AsyncLoading()) {
    fetchActiveOrders();
  }

  Future<void> fetchActiveOrders() async {
    try {
      final List<Order> orders =
          await _read(orderServiceProvider).getActiveOrders();

      state = AsyncValue.data(orders);
    } catch (e) {
      state = AsyncValue.error(e);
    }
  }

  Future<void> setOrderItemPaymentStatus(
    OrderItem orderItem,
    OrderItemPaymentStatus paymentStatus,
  ) {
    return _read(orderServiceProvider).setOrderItemPaymentStatus(
      orderItem,
      paymentStatus,
    );
  }
}
