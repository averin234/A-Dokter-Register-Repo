import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

class HasilResep extends StatefulWidget {
  const HasilResep({super.key});

  @override
  State<HasilResep> createState() => _HasilResepState();
}

class _HasilResepState extends State<HasilResep> {
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
            Text('Nama Obat : Alpara '),
            SizedBox(
              height: 10,
            ),
            Text('Status : Satuan '),
            SizedBox(
              height: 20,
            ),
            Text('Jumlah : 2 '),
            SizedBox(
              height: 20,
            ),
            Text('Aturan Pakai : 2x1 '),
            SizedBox(
              height: 20,
            ),
            Text('Note : Cepat Sembuh '),
            SizedBox(
              height: 20,
            ),
            Text('Keterangan : Sesudah Makan '),
            SizedBox(
              height: 20,
            ),
          ],
        ));
  }
}
