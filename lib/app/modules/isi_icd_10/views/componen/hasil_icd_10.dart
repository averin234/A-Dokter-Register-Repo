import 'package:a_dokter_register/app/data/model/get_detail_mr.dart';
import 'package:flutter/material.dart';

class HasilICD10 extends StatelessWidget {
  final Icd10 icd10;
  HasilICD10({super.key, required this.icd10});

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
                Text('No. ${icd10.no ?? ''}',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            Divider(
              color: Colors.grey,
            ),
            // SizedBox(
            //   height: 10,
            // ),
            // Text('Tanggal :  ${icd10}'),
            SizedBox(
              height: 10,
            ),
            Text('Nama Kelompok :  ${icd10.namaKelompok ?? ''}'),
            SizedBox(
              height: 20,
            ),
            Text('Kode ICD-10 :  ${icd10.kodeIcd ?? ''}'),
            SizedBox(
              height: 20,
            ),
            Text('Nama ICD-10 : ${icd10.namaIcd10 ?? ''}'),
            SizedBox(
              height: 20,
            ),
            Text('Kode Asterik :  ${icd10.kodeAsterik ?? ''}'),
            SizedBox(
              height: 20,
            ),
            Text('Nama Asterik : ${icd10.namaAsterik ?? ''}'),
            SizedBox(
              height: 20,
            ),
          ],
        ));
  }
}
