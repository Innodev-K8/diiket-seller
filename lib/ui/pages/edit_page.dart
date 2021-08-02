import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:seller/ui/common/styles.dart';

class EditPage extends StatelessWidget {
  static String route = 'edit';

  const EditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Lapak',
          style: kTextTheme.headline6!.copyWith(
            color: ColorPallete.textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_outlined),
              onPressed: () {
                Navigator.pop(context);
              },
              color: ColorPallete.darkGray,
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              "https://www.ashfield.gov.uk/media/8d83e1451daddb6/hucknall-market.jpg?center=0.42619295422749437,0.49818970571954585&mode=crop&width=1200&height=630",
            ),
            Container(
              margin: EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 53,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          primary: ColorPallete.primaryColor),
                      onPressed: () {},
                      child: Text(
                        "Ubah foto lapak",
                        style: kTextTheme.headline5,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Ubah Deskripsi",
                    style: kTextTheme.headline3!
                        .copyWith(color: ColorPallete.accentColor),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: ColorPallete.primaryColor, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorPallete.lightGray,
                        ),
                      ),
                      hintText: "Masukan deskripsi",
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Ubah Alamat",
                    style: kTextTheme.headline3!
                        .copyWith(color: ColorPallete.accentColor),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: ColorPallete.primaryColor, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorPallete.lightGray,
                        ),
                      ),
                      hintText: "Masukan alamat",
                    ),
                  ),
                  Text(
                    "Lantai, block, nomer atau sesuaikan dengan alamat lapak anda.",
                    style: kTextTheme.subtitle2!
                        .copyWith(color: ColorPallete.lightGray),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Ubah Keterangan Alamat",
                    style: kTextTheme.headline3!
                        .copyWith(color: ColorPallete.accentColor),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: ColorPallete.primaryColor, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorPallete.lightGray,
                        ),
                      ),
                      hintText: "Masukan keterangan alamat",
                    ),
                  ),
                  Text(
                    "Perjelas detail atau ciri khas lapak untuk memudahkan driver mencari lapak anda.",
                    style: kTextTheme.subtitle2!
                        .copyWith(color: ColorPallete.lightGray),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text("Batal"),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("Simpan"),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
