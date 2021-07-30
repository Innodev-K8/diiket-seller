import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:seller/ui/common/styles.dart';

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
            onPressed: () {},
            icon: Icon(
              Icons.edit_rounded,
              color: ColorPallete.darkGray,
            ),
          ),
        ],
      ),
      body: Text('Ini home page'),
    );
  }
}
