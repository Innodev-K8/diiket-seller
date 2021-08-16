import 'package:diiket_models/all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:seller/ui/common/helper.dart';
import 'package:seller/ui/common/styles.dart';
import 'package:seller/ui/common/utils.dart';

import 'order_item_checker.dart';

class OrderListItem extends StatelessWidget {
  final Order order;

  const OrderListItem({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (order.driver?.profile_picture_url != null) ...[
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                    order.driver!.profile_picture_url!,
                  ),
                ),
                SizedBox(width: 8.0),
              ],
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pesanan Baru",
                      style: kTextTheme.headline5,
                    ),
                    Text("Driver : ${order.driver?.name}"),
                    Row(
                      children: [
                        Icon(
                          Icons.schedule,
                          size: kTextTheme.overline!.fontSize,
                        ),
                        SizedBox(width: 4),
                        if (order.confirmed_at != null)
                          Text(
                            Helper.sortDateFormatter
                                .format(order.confirmed_at!),
                            style: kTextTheme.overline,
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(width: 8.0),
              ElevatedButton(
                child: Text("Hubungi"),
                onPressed: () {
                  if (order.driver?.phone_number != null) {
                    Utils.prompt(
                      context,
                      description: 'Hubungi ${order.driver?.name}?',
                      onConfirm: () {
                        FlutterPhoneDirectCaller.callNumber(
                          order.driver!.phone_number!,
                        );
                      },
                    );
                  }
                },
              )
            ],
          ),
          Divider(
            thickness: 1,
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: order.order_items?.length ?? 0,
            itemBuilder: (context, index) => OrderItemChecker(
              orderItem: order.order_items![index],
            ),
          ),
        ],
      ),
    );
  }
}
