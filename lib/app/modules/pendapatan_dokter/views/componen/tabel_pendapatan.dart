import 'package:a_dokter_register/app/data/model/get_list_kasir.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../routes/app_pages.dart';
import '../../../bottomsheet/bottomshet_bayar.dart';

class Pendapatan extends StatelessWidget {
  final Kasir kasir;
  const Pendapatan({super.key, required this.kasir});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () => Get.toNamed(Routes.DETAIL_TINDAKAN),
      child: Container(
        margin: EdgeInsets.only(right: 10, left: 10, bottom: 5),
        padding: EdgeInsets.only(right: 0, left: 10, bottom: 10, top: 10),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0x6cc7d1db)),
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFe0e0e0).withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 10,
              offset: const Offset(2, 1),
            ),
          ],
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.only(right: 10, left: 10),
              child :
              InkWell(
                onTap: () {
                  bottomSheetBayar();
                },
                child : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Selesai Periksa',style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold)),
                  Container(
                    padding: EdgeInsets.only(right: 5,left: 5, top: 10, bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.blue,
                    ),
                  child : Row(children: [
                    Icon(Icons.monetization_on_rounded,color: Colors.white),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Cek Pembayaran Pasien',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),],),),
                ],
              ),),),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text('No Registrasi ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(': ', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(kasir.noRegistrasi ?? '',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text('Tanggal Masuk ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(': '),
                  Text(kasir.jamMasuk ?? '',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Text('Nama Pasien '),
                  Text(': '),
                  Text(kasir.namaPasien ?? '',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text('Nasabah '),
                  Text(': '),
                  Text(kasir.namaKelompok ?? ''),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text('Nama Bagian '),
                  Text(': '),
                  Text(kasir.namaBagian ?? ''),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Divider(color: Colors.black),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(right: 10, left: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Billing",
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
                              "Rp ${kasir.billing}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ]),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
