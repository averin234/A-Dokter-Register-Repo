import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../controllers/home_controller.dart';

class CardDokter extends GetView<HomeController> {
  const CardDokter({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
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
                                  child: Text(greetings(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text("Dr. Anggi Supradi",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                            const SizedBox(
                              height: 5,
                            ),
                            Text("Spesialis : Gigi Umum",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: Colors.grey)),
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
