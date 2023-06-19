import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

class CardJadwal extends StatefulWidget {
  const CardJadwal({super.key});

  @override
  State<CardJadwal> createState() => _CardJadwalState();
}

class _CardJadwalState extends State<CardJadwal> {
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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text('Jadwal Dokter ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            Divider(
              color: Colors.grey,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text('Hari : ', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('Senin,Selasa,Rabu,Kamis,Jumat'),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text('Jam Mulai : ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text('01:00'),
                SizedBox(
                  width: 10,
                ),
                Text('Jam Akhir : ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text('23:00'),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text('Interval : ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text('10'),
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ));
  }
}
