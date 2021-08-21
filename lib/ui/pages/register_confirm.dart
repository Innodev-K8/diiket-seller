import 'package:flutter/material.dart';
import 'package:seller/ui/common/styles.dart';
import 'package:seller/ui/widgets/inputs/custom_text_field_section.dart';

class RegisterConfirm extends StatelessWidget {
  const RegisterConfirm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_outlined),
              onPressed: () {
                Navigator.pop(context);
              },
              color: ColorPallete.darkGray,
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Daftarkan Lapak",
                style: kTextTheme.headline1!
                    .copyWith(color: ColorPallete.accentColor),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  "Pastikan semua data sudah sesuai, jika masih ragu anda dapat kembali kehalaman sebelumnya."),
              SizedBox(
                height: 30,
              ),
              OutlinedButton(
                onPressed: () {},
                child: Text('Lanjut'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
