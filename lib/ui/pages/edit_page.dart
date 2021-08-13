import 'package:flutter/material.dart';
import 'package:seller/ui/common/styles.dart';
import 'package:seller/ui/widgets/inputs/custom_text_field_section.dart';

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
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              'https://www.ashfield.gov.uk/media/8d83e1451daddb6/hucknall-market.jpg?center=0.42619295422749437,0.49818970571954585&mode=crop&width=1200&height=630',
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
                      onPressed: () {},
                      child: Text(
                        'Ubah foto lapak',
                        style: kTextTheme.headline5,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextFieldSection(
                    title: 'Ubah Nama',
                    inputHint: 'Masukan nama lapak Anda',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextFieldSection(
                    title: 'Ubah Deskripsi',
                    inputHint: 'Masukan deskripsi',
                  ),
                  SizedBox(
                    height: 20,
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
                    height: 20,
                  ),
                  CustomTextFieldSection(
                    title: 'Detail Alamat',
                    inputHint: 'Contoh: Depan teras BRI',
                    inputMinLines: 3,
                    inputMaxLines: 5,
                    helpText:
                        'Perjelas detail atau ciri khas lapak untuk memudahkan driver mencari lapak anda.',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text('Batal'),
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        child: Text('Simpan'),
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
