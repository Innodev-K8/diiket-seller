import 'package:flutter/material.dart';
import 'package:seller/ui/common/styles.dart';
import 'package:seller/ui/widgets/inputs/custom_text_field_section.dart';

class RegisterDataDiri extends StatelessWidget {
  const RegisterDataDiri({Key? key}) : super(key: key);

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
                "Data Diri",
                style: kTextTheme.headline1!
                    .copyWith(color: ColorPallete.accentColor),
              ),
              SizedBox(
                height: 30,
              ),
              CustomTextFieldSection(
                title: 'Nama Anda',
                inputHint: 'Ketik Nama Anda',
                inputMinLines: 1,
                inputMaxLines: 2,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextFieldSection(
                title: 'Nomor Telepon',
                inputHint: 'Nomor Telepon Anda',
                inputMinLines: 1,
                inputMaxLines: 2,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextFieldSection(
                title: 'Alamat Rumah',
                inputHint: 'Alamat Rumah Anda',
                inputMinLines: 3,
                inputMaxLines: 5,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Upload Foto KTP",
                style: kTextTheme.headline3!
                    .copyWith(color: ColorPallete.accentColor),
              ),
              Text(
                  "Tekan tombol tambah diatas untuk upload foto. Pastikan foto KTP terang dan bisa terbaca jelas."),
              SizedBox(
                height: 10,
              ),
              Text(
                "Upload Foto Diri Anda Memegang KTP",
                style: kTextTheme.headline3!
                    .copyWith(color: ColorPallete.accentColor),
              ),
              Text(
                  "Tekan tombol tambah diatas untuk upload foto. Pastikan foto wajah serta KTP terang dan bisa terbaca jelas."),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    child: Text('Lanjut'),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text('Masuk'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
