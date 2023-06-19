import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../controllers/home_controller.dart';

class CardPendapatan extends GetView<HomeController> {
  const CardPendapatan({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 200,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 4,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Pendapatan Bulan Juni",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Rp. 300.000.000",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Anda mendapatkan Rp. 300.000.000 pada bulan Juni",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  height: 3,
                  thickness: 2.2,
                ),
                SizedBox(
                  height: 6,
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "Lihat Pendaptan",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.green),
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            )));
  }
}
