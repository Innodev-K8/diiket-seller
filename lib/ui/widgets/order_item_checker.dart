import 'package:diiket_models/all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:seller/ui/common/helper.dart';
import 'package:seller/ui/common/styles.dart';

class OrderItemChecker extends HookWidget {
  final OrderItem orderItem;

  OrderItemChecker({required this.orderItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 11, 0, 11),
      child: Column(
        children: [
          Row(
            children: [
              if (orderItem.product?.photo_url != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    orderItem.product!.photo_url!,
                    width: 54,
                    height: 54,
                    fit: BoxFit.cover,
                  ),
                ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      orderItem.product?.name ?? '-',
                      style: kTextTheme.headline5!.copyWith(fontSize: 14),
                    ),
                    if (orderItem.notes != null)
                      Text(
                        'Catatan: ${orderItem.notes!}',
                      ),
                    SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${orderItem.quantity} × Rp ${Helper.fmtPrice(orderItem.product?.price ?? 0)}",
                        ),
                        Text(
                          "Rp ${Helper.fmtPrice((orderItem.product?.price ?? 0) * (orderItem.quantity ?? 0))}",
                          style: kTextTheme.bodyText2!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                            color: ColorPallete.secondaryColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Stok: ${orderItem.product?.stocks ?? 0}",
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          OrderItemChecklist(
            initialValue: orderItem.payment_status!,
          )
        ],
      ),
    );
  }
}

class OrderItemChecklist extends HookWidget {
  const OrderItemChecklist({
    Key? key,
    this.initialValue = OrderItemPaymentStatus.not_available,
  }) : super(key: key);

  final OrderItemPaymentStatus initialValue;

  @override
  Widget build(BuildContext context) {
    final paymentStatus = useState<OrderItemPaymentStatus>(
      initialValue,
    );

    return Row(
      children: [
        Checkbox(
          checkColor: ColorPallete.backgroundColor,
          activeColor: ColorPallete.primaryColor,
          value: paymentStatus.value == OrderItemPaymentStatus.not_available,
          onChanged: (bool? value) {
            paymentStatus.value = OrderItemPaymentStatus.not_available;
          },
        ),
        Expanded(child: Text("Tidak Tersedia")),
        Checkbox(
          checkColor: ColorPallete.backgroundColor,
          activeColor: ColorPallete.primaryColor,
          value: paymentStatus.value == OrderItemPaymentStatus.unpaid,
          onChanged: (bool? value) {
            paymentStatus.value = OrderItemPaymentStatus.unpaid;
          },
        ),
        Expanded(child: Text("Belum DIbayar")),
        Checkbox(
          checkColor: ColorPallete.backgroundColor,
          activeColor: ColorPallete.primaryColor,
          value: paymentStatus.value == OrderItemPaymentStatus.paid,
          onChanged: (bool? value) {
            paymentStatus.value = OrderItemPaymentStatus.paid;
          },
        ),
        Expanded(child: Text("Lunas"))
      ],
    );
  }
}
