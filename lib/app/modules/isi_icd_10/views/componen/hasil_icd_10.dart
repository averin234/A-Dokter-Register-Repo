import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

class HasilICD10 extends StatefulWidget {
  const HasilICD10({super.key});

  @override
  State<HasilICD10> createState() => _HasilICD10State();
}

class _HasilICD10State extends State<HasilICD10> {
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
            Text('Tanggal :  '),
            SizedBox(
              height: 10,
            ),
            Text('Nama Kelompok :  '),
            SizedBox(
              height: 20,
            ),
            Text('Kode ICD-10 :  '),
            SizedBox(
              height: 20,
            ),
            Text('Nama ICD-10 : '),
            SizedBox(
              height: 20,
            ),
            Text('Kode Asterik :  '),
            SizedBox(
              height: 20,
            ),
            Text('Nama Asterik : '),
            SizedBox(
              height: 20,
            ),
          ],
        ));
  }
}
