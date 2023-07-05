import 'package:a_dokter_register/app/data/model/get_detail_mr.dart';
import 'package:a_dokter_register/app/modules/isi_tindakan/controllers/isi_tindakan_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NamaPemeriksa extends StatelessWidget {
  const NamaPemeriksa({super.key});

  @override
  Widget build(BuildContext context) {
    final pasien = Get.put(IsiTindakanController()).detailMr.pasien ?? Pasien();
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
              children: [
                Text('Nama Pasien : ${pasien.namaPasien ?? ''}',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const Divider(
              color: Colors.grey,
            ),
            const SizedBox(
              height: 10,
            ),
            Text('No. MR : ${pasien.noMr ?? ''}')
          ],
        ));
  }
}
