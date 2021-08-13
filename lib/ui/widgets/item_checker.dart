import 'package:diiket_models/all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:seller/ui/common/styles.dart';

class ItemChecker extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final paymentStatus =
        useState<OrderItemPaymentStatus>(OrderItemPaymentStatus.not_available);

    return Container(
      margin: EdgeInsets.fromLTRB(0, 11, 0, 11),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Telur Ayam (tray)1kg",
                    style: kTextTheme.headline5!.copyWith(fontSize: 14),
                  ),
                  Text("1 × Rp 16.000   |   Stok: 72")
                ],
              ),
            ],
          ),
          Row(
            children: [
              Checkbox(
                checkColor: ColorPallete.backgroundColor,
                activeColor: ColorPallete.primaryColor,
                value:
                    paymentStatus.value == OrderItemPaymentStatus.not_available,
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
          )
        ],
      ),
    );
  }
}
