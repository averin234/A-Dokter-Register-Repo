import 'package:a_dokter_register/app/data/componen/avatar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../data/model/get_detail_dokter.dart';
import '../../controllers/profile_controller.dart';

class CardDokterSetting extends GetView<ProfileController> {
  final Dokter dokter;
  const CardDokterSetting({
    Key? key,
    required this.dokter,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          color: Colors.white,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                width: 70.0,
                height: 70.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(dokter.foto ?? Avatar.lakiLaki),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(.1),
                        blurRadius: 3,
                        spreadRadius: 1)
                  ],
                  border: Border.all(
                    width: 1.5,
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(40.0),
                ),
                padding: const EdgeInsets.all(5),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(dokter.namaPegawai ?? '',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14)),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // Get.toNamed(Routes.REGISTER_RS);
                                  },
                                  child: const Icon(
                                    Icons.settings,
                                    color: Color.fromARGB(255, 196, 196, 196),
                                    size: 24.0,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text("Spesialis : ${dokter.namaSpesialisasi ?? ''}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16)),
                          ]),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String greetings() {
    final hour = TimeOfDay.now().hour;

    if (hour <= 12) {
      return 'Selamat Pagi.';
    } else if (hour <= 17) {
      return 'Selamat Siang';
    }
    return 'Selamat Malam';
  }
}
