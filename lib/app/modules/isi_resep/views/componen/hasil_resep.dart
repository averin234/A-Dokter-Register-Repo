import 'package:a_dokter_register/app/data/model/get_detail_mr.dart';
import 'package:flutter/material.dart';

class HasilResep extends StatelessWidget {
  final Resep resep;
  HasilResep({super.key, required this.resep});

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
                Text('No. ${resep.no ?? ''}',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            Divider(
              color: Colors.grey,
            ),
            SizedBox(
              height: 10,
            ),
            Text('Nama Obat : ${resep.namaBrg ?? ''}'),
            SizedBox(
              height: 10,
            ),
            Text('Status : ${resep.satuan ?? ''}'),
            SizedBox(
              height: 20,
            ),
            Text('Jumlah : ${resep.jumlahPesan ?? ''}'),
            SizedBox(
              height: 20,
            ),
            Text('Aturan Pakai : ${resep.namaDosis ?? ''}'),
            SizedBox(
              height: 20,
            ),
            Text('Note : ${resep.note ?? ''}'),
            SizedBox(
              height: 20,
            ),
            Text('Keterangan : ${resep.ket ?? ''}'),
            SizedBox(
              height: 20,
            ),
          ],
        ));
  }
}
