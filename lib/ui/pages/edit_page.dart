import 'package:diiket_models/all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:seller/data/providers/stall/stall_provider.dart';
import 'package:seller/ui/common/styles.dart';
import 'package:seller/ui/common/utils.dart';
import 'package:seller/ui/widgets/inputs/custom_text_field_section.dart';
import 'package:seller/ui/widgets/small_loading.dart';

class EditPage extends HookWidget {
  static String route = 'edit';

  const EditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final stall = useProvider(stallProvider);

    final updatedStall = useState(stall);
    final isUpdating = useState(false);
    final isMounted = useIsMounted();

    Future<void> saveStall() async {
      isUpdating.value = true;

      try {
        await context
            .read(stallProvider.notifier)
            .updateStall(updatedStall.value!);

        Utils.alert(
          context,
          'Lapak berhasil diperbarui',
        );
      } on CustomException catch (error) {
        Utils.alert(
          context,
          'Lapak gagal diperbarui: ${error.message}',
        );
      } finally {
        if (isMounted()) {
          isUpdating.value = false;
        }
      }
    }

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
      body: stall == null
          ? Text('Terjadi kesalahan, lapak tidak dapat dimuat')
          : SingleChildScrollView(
              child: Column(
                children: [
                  if (stall.photo_url != null)
                    Image.network(
                      stall.photo_url!,
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
                          inputInitialValue: stall.name,
                          onInputChanged: (name) {
                            updatedStall.value = updatedStall.value?.copyWith(
                              name: name,
                            );
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomTextFieldSection(
                          title: 'Ubah Deskripsi',
                          inputHint: 'Masukan deskripsi',
                          inputMinLines: 3,
                          inputMaxLines: 5,
                          inputInitialValue: stall.description,
                          onInputChanged: (description) {
                            updatedStall.value = updatedStall.value?.copyWith(
                              description: description,
                            );
                          },
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
                                inputInitialValue: stall.location_floor,
                                onInputChanged: (locationFloor) {
                                  updatedStall.value =
                                      updatedStall.value?.copyWith(
                                    location_floor: locationFloor,
                                  );
                                },
                              ),
                            ),
                            SizedBox(width: 4),
                            Expanded(
                              child: CustomTextFieldSection(
                                title: 'Blok',
                                inputInitialValue: stall.location_block,
                                onInputChanged: (locationBlock) {
                                  updatedStall.value =
                                      updatedStall.value?.copyWith(
                                    location_block: locationBlock,
                                  );
                                },
                              ),
                            ),
                            SizedBox(width: 4),
                            Expanded(
                              child: CustomTextFieldSection(
                                title: 'Nomor',
                                inputInitialValue: stall.location_number,
                                onInputChanged: (locationNumber) {
                                  updatedStall.value =
                                      updatedStall.value?.copyWith(
                                    location_number: locationNumber,
                                  );
                                },
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
                          inputInitialValue: stall.location_detail,
                          onInputChanged: (locationDetail) {
                            updatedStall.value = updatedStall.value?.copyWith(
                              location_detail: locationDetail,
                            );
                          },
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
                              onPressed: isUpdating.value == false &&
                                      updatedStall.value != null
                                  ? saveStall
                                  : null,
                              child: isUpdating.value
                                  ? SmallLoading()
                                  : Text('Simpan'),
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
