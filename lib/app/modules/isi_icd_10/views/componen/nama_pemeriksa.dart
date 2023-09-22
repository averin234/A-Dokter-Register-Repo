import 'package:a_dokter_register/app/data/componen/fetch_data.dart';
import 'package:a_dokter_register/app/modules/isi_icd_10/controllers/isi_icd_10_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/model/get_detail_pasien.dart';

class NamaPemeriksa extends StatelessWidget {
  NamaPemeriksa({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(IsiIcd10Controller());
    return FutureBuilder(
        future: API.getDetailPasien(no_mr: controller.noMr),
        builder: (context, snapshot) {
          if (snapshot.hasData &&
              snapshot.connectionState != ConnectionState.waiting &&
              snapshot.data != null) {
            final data = snapshot.data!.pasien ?? Pasien();
            return Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(left: 10, right: 10),
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text('Nama Pasien : ${data.namaPasien ?? ''}',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('No. MR : ${data.noMr ?? ''}')
                  ],
                ));
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
