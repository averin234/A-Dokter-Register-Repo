import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:a_dokter_register/app/modules/detail_antrian/views/componen/soap/assestment.dart';
import 'package:a_dokter_register/app/modules/detail_antrian/views/componen/soap/objektive.dart';
import 'package:a_dokter_register/app/modules/hiss/views/componen/hiss_soap/objektive.dart';
import '../../../../detail_riwayat/views/componen/riwayat_soap/subyektif.dart';
import 'assestment.dart';
import 'subyektif.dart';
import '../../../../../routes/app_pages.dart';

class HISSSoap extends StatefulWidget {
  const HISSSoap({super.key});

  @override
  State<HISSSoap> createState() => _HISSSoapState();
}

class _HISSSoapState extends State<HISSSoap> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(Routes.DETAIL_TINDAKAN),
      child: Container(
        margin: EdgeInsets.only(right: 10, left: 10),
        padding: EdgeInsets.only(right: 10, left: 10, bottom: 10),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0x6cc7d1db)),
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFe0e0e0).withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 10,
              offset: const Offset(2, 1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text("SOAP",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    )),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Divider(
              height: 3,
              color: Colors.grey,
            ),
            SizedBox(
              height: 10,
            ),
            Subyektifhiss(),
            SizedBox(
              height: 10,
            ),
            Objektivehiss(),
            SizedBox(
              height: 10,
            ),
            Assestmenthiss(),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
