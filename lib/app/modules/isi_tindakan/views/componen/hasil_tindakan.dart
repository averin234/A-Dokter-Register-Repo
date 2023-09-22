import 'package:a_dokter_register/app/data/model/get_detail_mr.dart';
import 'package:flutter/material.dart';

class HasilTindakan extends StatelessWidget {
  final Tindakan tindakan;
  HasilTindakan({super.key, required this.tindakan});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(left: 10, right: 10, top: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color(0x6cc7d1db)),
          boxShadow: [
            BoxShadow(
              color: Color(0xFFe0e0e0).withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 10,
              offset: Offset(2, 1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('No. ${tindakan.no ?? ''}',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            Divider(
              color: Colors.grey,
            ),
            SizedBox(
              height: 10,
            ),
            Text('Tanggal : ${tindakan.tanggal ?? ''}'),
            SizedBox(
              height: 10,
            ),
            Text('Tindakan : ${tindakan.namaTindakan ?? ''}'),
            SizedBox(
              height: 20,
            ),
            Divider(
              color: Colors.grey,
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Biaya (Rp.)",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      // Get.toNamed(Routes.ANTRIAN_PASIEN);
                    },
                    child: Text(
                      (tindakan.biaya ?? 0).toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.blue),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ]),
          ],
        ));
  }
}
