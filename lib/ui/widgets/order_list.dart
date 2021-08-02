import 'package:flutter/material.dart';
import 'package:seller/ui/common/styles.dart';
import 'package:seller/ui/widgets/item_checker.dart';

class OrderList extends StatelessWidget {
  const OrderList({Key? key}) : super(key: key);

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
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Pesanan Baru",
                    style: kTextTheme.headline5,
                  ),
                  Text("Driver : Adecya Jalu"),
                ],
              ),
              ElevatedButton(onPressed: () {}, child: Text("Hubungi"))
            ],
          ),
          Divider(
            thickness: 1,
          ),
          ItemChecker(),
        ],
      ),
    );
  }
}
