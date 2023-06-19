import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

class HasilTindakan extends StatefulWidget {
  const HasilTindakan({super.key});

  @override
  State<HasilTindakan> createState() => _HasilTindakanState();
}

class _HasilTindakanState extends State<HasilTindakan> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color(0x6cc7d1db)),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('No. 1 ', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            Divider(
              color: Colors.grey,
            ),
            SizedBox(
              height: 10,
            ),
            Text('Tangga : 2023-06-23 '),
            SizedBox(
              height: 10,
            ),
            Text('Tindakan : Pengobatan '),
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
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      // Get.toNamed(Routes.ANTRIAN_PASIEN);
                    },
                    child: Text(
                      "700.000,00",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.blue),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ]),
          ],
        ));
  }
}
