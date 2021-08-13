import 'package:flutter/material.dart';
import 'package:seller/ui/common/styles.dart';

class StallInformation extends StatelessWidget {
  const StallInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24, horizontal: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Color(0xffFF8527),
              Color(0xffFFB945),
            ]),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Toko Hari Ini",
                      style: kTextTheme.headline3!
                          .copyWith(color: ColorPallete.backgroundColor),
                    ),
                    SizedBox(width: 8.0),
                    Icon(
                      Icons.info_outline_rounded,
                      color: ColorPallete.backgroundColor,
                    ),
                  ],
                ),
                Text(
                  "Geser jika diperlukan untuk menutup/buka toko pada waktu tertentu.",
                  style: kTextTheme.headline6!.copyWith(fontSize: 12),
                ),
              ],
            ),
          ),
          SizedBox(width: 20.0),
          CircleAvatar(
            radius: 35 / 2,
            backgroundImage: NetworkImage(
              'https://preview.keenthemes.com/metronic-v4/theme/assets/pages/media/profile/profile_user.jpg',
            ),
          ),
        ],
      ),
    );
  }
}
