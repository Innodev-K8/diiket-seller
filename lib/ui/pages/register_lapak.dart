import 'package:flutter/material.dart';
import 'package:seller/ui/common/styles.dart';
import 'package:seller/ui/widgets/inputs/custom_text_field_section.dart';

class RegisterLapak extends StatelessWidget {
  const RegisterLapak({Key? key}) : super(key: key);

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
                "Lapak Anda",
                style: kTextTheme.headline1!
                    .copyWith(color: ColorPallete.accentColor),
              ),
              SizedBox(
                height: 30,
              ),
              CustomTextFieldSection(
                title: 'Nama Lapak',
                inputHint: 'Ketik Nama Lapak',
                inputMinLines: 1,
                inputMaxLines: 2,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextFieldSection(
                title: 'Deskripsi',
                inputHint: 'Deskripsi Lapak',
                inputMinLines: 3,
                inputMaxLines: 5,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextFieldSection(
                title: 'Nomor Telepon Aktif',
                inputHint: 'Nomor Telepon',
                inputMinLines: 1,
                inputMaxLines: 2,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                  "Nomor ini digunakan untuk menghubungi toko anda oleh dan driver."),
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: CustomTextFieldSection(
                      title: 'Lantai',
                    ),
                  ),
                  SizedBox(width: 4),
                  Expanded(
                    child: CustomTextFieldSection(
                      title: 'Blok',
                    ),
                  ),
                  SizedBox(width: 4),
                  Expanded(
                    child: CustomTextFieldSection(
                      title: 'Nomor',
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextFieldSection(
                title: 'Detail Alamat',
                inputMinLines: 3,
                inputMaxLines: 5,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                  "Nomor ini digunakan untuk menghubungi toko anda oleh dan driver."),
              SizedBox(
                height: 10,
              ),
              Text(
                "Upload Foto Dokumen Kepemilikan Lapak Anda",
                style: kTextTheme.headline3!
                    .copyWith(color: ColorPallete.accentColor),
              ),
              Text(
                  "Tekan tombol tambah diatas untuk upload foto. Pastikan foto dokumen terang dan bisa terbaca jelas."),
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
