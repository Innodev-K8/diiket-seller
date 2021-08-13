import 'package:diiket_models/all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:seller/ui/common/styles.dart';

class OrderItemChecker extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final paymentStatus = useState<OrderItemPaymentStatus>(
      OrderItemPaymentStatus.not_available,
    );

    return Container(
      margin: EdgeInsets.fromLTRB(0, 11, 0, 11),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  'https://www.seriouseats.com/thmb/hGmf-CklPEWYtGrsB1XIOfldngM=/1500x844/smart/filters:no_upscale()/__opt__aboutcom__coeus__resources__content_migration__serious_eats__seriouseats.com__2015__07__20210324-SouthernFriedChicken-Andrew-Janjigian-21-cea1fe39234844638018b15259cabdc2.jpg',
                  width: 54,
                  height: 54,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 10),
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
          SizedBox(height: 8),
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
