import 'package:diiket_models/all.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:seller/data/network/api_service.dart';

final orderServiceProvider = Provider<OrderService>((ref) {
  return OrderService(ref.read(apiProvider));
});

class OrderService {
  Dio _dio;

  OrderService(this._dio);

  String _(Object path) => '/seller/orders/$path';

  Future<List<Order>> getActiveOrders() async {
    try {
      final response = await _dio.get(_('active'));

      List<dynamic> results = response.data['data'];

      return results.map((json) => Order.fromJson(json)).toList();
    } on DioError catch (error) {
      throw CustomException.fromDioError(error);
    }
  }

  // Future<void> claimOrder(int orderId) async {
  //   try {
  //     await _dio.post(_('$orderId/claim'));
  //   } on DioError catch (error) {
  //     if (error.response?.statusCode == 422) {
  //       throw CustomException(
  //         message: error.response?.data['message'],
  //         code: 422,
  //       );
  //     }

  //     throw CustomException.fromDioError(error);
  //   }
  // }

  // Future<Order?> getActiveOrder() async {
  //   try {
  //     final response = await _dio.get(_('active'));

  //     return Order.fromJson(response.data['data']);
  //   } on DioError catch (error) {
  //     if (error.response?.statusCode == 404) {
  //       return null;
  //     }

  //     throw CustomException.fromDioError(error);
  //   }
  // }

  // Future<void> updateOrderItemStatus(
  //   OrderItem orderItem,
  //   OrderItemStatus orderItemStatus,
  // ) async {
  //   try {
  //     late String statusString;

  //     switch (orderItemStatus) {
  //       case OrderItemStatus.waiting:
  //         statusString = 'waiting';
  //         break;
  //       case OrderItemStatus.picked:
  //         statusString = 'picked';
  //         break;
  //       case OrderItemStatus.canceled:
  //         statusString = 'canceled';
  //         break;
  //     }

  //     await _dio.post(_('active/items/${orderItem.id}/update'), data: {
  //       '_method': 'PATCH',
  //       'status': statusString,
  //     });
  //   } on DioError catch (error) {
  //     throw CustomException.fromDioError(error);
  //   }
  // }

  // Future<void> deliverOrder() async {
  //   try {
  //     await _dio.post(_('active/deliver'));
  //   } on DioError catch (error) {
  //     throw CustomException.fromDioError(error);
  //   }
  // }

  // Future<void> cancelOrder() async {
  //   try {
  //     await _dio.post(_('active/cancel'));
  //   } on DioError catch (error) {
  //     throw CustomException.fromDioError(error);
  //   }
  // }

  // Future<void> completeOrder() async {
  //   try {
  //     await _dio.post(_('active/complete'));
  //   } on DioError catch (error) {
  //     throw CustomException.fromDioError(error);
  //   }
  // }
}
