import 'package:a_dokter_register/app/data/model/jadwal_dokter.dart';
import 'package:flutter/material.dart';

class CardJadwal extends StatelessWidget {
  final Jadwal jadwal;
  const CardJadwal({super.key, required this.jadwal});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0x6cc7d1db)),
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
              children: const [
                Text('Jadwal Dokter ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const Divider(
              color: Colors.grey,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Text('Hari : ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(jadwal.rangeHari ?? ''),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Text('Jam Mulai : ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(jadwal.jamMulai ?? ''),
                const SizedBox(
                  width: 10,
                ),
                const Text('Jam Akhir : ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(jadwal.jamAkhir ?? ''),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Text('Interval : ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text((jadwal.waktu ?? 0).toString()),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ));
  }
}
