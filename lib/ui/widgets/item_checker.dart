import 'package:flutter/material.dart';
import 'package:seller/ui/common/styles.dart';
import 'package:seller/ui/widgets/square_icon_button.dart';

class ItemChecker extends StatefulWidget {
  const ItemChecker({Key? key}) : super(key: key);

  @override
  _ItemCheckerState createState() => _ItemCheckerState();
}

class _ItemCheckerState extends State<ItemChecker> {
  bool batal = false;
  bool belum_bayar = false;
  bool lunas = false;

  @override
  Widget build(BuildContext context) {
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
                value: batal,
                onChanged: (bool? value) {
                  setState(() {
                    batal = value!;
                  });
                },
              ),
              Expanded(child: Text("Dibatalkan")),
              Checkbox(
                checkColor: ColorPallete.backgroundColor,
                activeColor: ColorPallete.primaryColor,
                value: belum_bayar,
                onChanged: (bool? value) {
                  setState(() {
                    belum_bayar = value!;
                  });
                },
              ),
              Expanded(child: Text("Belum DIbayar")),
              Checkbox(
                checkColor: ColorPallete.backgroundColor,
                activeColor: ColorPallete.primaryColor,
                value: lunas,
                onChanged: (bool? value) {
                  setState(() {
                    lunas = value!;
                  });
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
