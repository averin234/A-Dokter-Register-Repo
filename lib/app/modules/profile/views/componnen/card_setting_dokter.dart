import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../controllers/profile_controller.dart';

class CardDokterSetting extends GetView<ProfileController> {
  const CardDokterSetting({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          color: Colors.white,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                width: 70.0,
                height: 70.0,
                decoration: BoxDecoration(
                  image: new DecorationImage(
                    image: NetworkImage(
                        'https://thumb.tvonenews.com/thumbnail/2023/03/06/64055b6094a39-dokter-cantik-di-indonesia_375_211.jpg'),
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
                padding: EdgeInsets.all(5),
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
                                  child: Text("Dr. Anggi Supradi",
                                      style: TextStyle(
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
                                  child: Icon(
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
                            Text("Spesialis : Gigi Umum",
                                style: TextStyle(
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
