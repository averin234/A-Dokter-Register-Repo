import 'package:flutter/material.dart';

class ListResep extends StatelessWidget {
  const ListResep({super.key});

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
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: const [
                Text('No. 1 ', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const Divider(
              color: Colors.grey,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('Nama Obat : Alpara '),
            const SizedBox(
              height: 10,
            ),
            const Text('Status : Satuan '),
            const SizedBox(
              height: 20,
            ),
            const Text('Jumlah : 2 '),
            const SizedBox(
              height: 20,
            ),
            const Text('Aturan Pakai : 2x1 '),
            const SizedBox(
              height: 20,
            ),
            const Text('Note : Cepat Sembuh '),
            const SizedBox(
              height: 20,
            ),
            const Text('Keterangan : Sesudah Makan '),
            const SizedBox(
              height: 20,
            ),
          ],
        ));
  }
}
