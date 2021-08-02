import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:seller/ui/common/styles.dart';
import 'package:seller/ui/pages/edit_page.dart';
import 'package:seller/ui/widgets/order_list.dart';
import 'package:seller/ui/widgets/stall_information.dart';

class HomePage extends StatelessWidget {
  static String route = 'home';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Diiket Pedagang',
            style: kTextTheme.headline6!.copyWith(
              color: ColorPallete.textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditPage()),
                );
              },
              icon: Icon(
                Icons.edit_rounded,
                color: ColorPallete.darkGray,
              ),
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StallInformation(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
              child: Text(
                "Penjualan",
                style: kTextTheme.headline5,
              ),
            ),
            OrderList(),
          ],
        ));
  }
}
