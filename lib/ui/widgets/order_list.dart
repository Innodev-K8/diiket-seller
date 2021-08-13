import 'package:flutter/material.dart';
import 'package:seller/ui/common/styles.dart';
import 'package:seller/ui/widgets/item_checker.dart';

class OrderList extends StatelessWidget {
  const OrderList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OrderItem(),
        OrderItem(),
      ],
    );
  }
}

class OrderItem extends StatelessWidget {
  const OrderItem({
    Key? key,
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
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                  'https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Pesanan Baru",
                    style: kTextTheme.headline5,
                  ),
                  Text("Driver : Adecya Jalu"),
                  Row(
                    children: [
                      Icon(
                        Icons.schedule,
                        size: kTextTheme.overline!.fontSize,
                      ),
                      SizedBox(width: 4),
                      Text(
                        "22 Jul; 08:30",
                        style: kTextTheme.overline,
                      ),
                    ],
                  ),
                ],
              ),
              ElevatedButton(onPressed: () {}, child: Text("Hubungi"))
            ],
          ),
          Divider(
            thickness: 1,
          ),
          OrderItemChecker(),
        ],
      ),
    );
  }
}
