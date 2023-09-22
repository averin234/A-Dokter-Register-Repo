import 'package:a_dokter_register/app/data/model/get_list_kasir.dart';
import 'package:a_dokter_register/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../bottomsheet/bottomsheet_bayar_kasir.dart';

class Pendapatan extends StatelessWidget {
  final Kasir kasir;
  Pendapatan({super.key, required this.kasir});
  TextEditingController Pembulatan = TextEditingController(text: '0,00');

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
              color: Color(0xFFe0e0e0).withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 10,
              offset: Offset(2, 1),
            ),
          ],
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 10, left: 10),
                child: InkWell(
                  onTap: () async {
                    showModalBottomSheet(
                      enableDrag: true,
                      // showDragHandle: true,
                      context: context,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      builder: (context) =>
                          Pilihpembayaran(kasir.noRegistrasi ?? ''),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Selesai Periksa',
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold)),
                      Container(
                        padding: EdgeInsets.only(
                            right: 5, left: 5, top: 10, bottom: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.blue,
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.monetization_on_rounded,
                                color: Colors.white),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Cek Pembayaran Pasien',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
                          SizedBox(
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
                          SizedBox(
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

  Widget Pilihpembayaran(String nr) {
    return Container(
      height: 280,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.transparent,
      ),
      child: Column(children: [
        Text(
          'Pilih metode pembayaran',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: () {
            Get.back();
            Get.toNamed(Routes.PEMBAYARAN_TUNAI,
                parameters: {'nr': kasir.noRegistrasi ?? ''}, arguments: kasir);
          },
          child: Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(right: 10, left: 10),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0x6cc7d1db)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/rp.png',
                    height: 40,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text('Bayar Tunai',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                ]),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () {
            Get.back();
            Get.toNamed(Routes.PEMBAYARAN_KARTU_DEBET,
                parameters: {'nr': kasir.noRegistrasi ?? ''}, arguments: kasir);
          },
          child: Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(right: 10, left: 10),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0x6cc7d1db)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/atm.png',
                    height: 40,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text('Kartu Debet',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      )),
                ]),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () {
            Get.back();
            Get.toNamed(Routes.PEMBAYARAN_KARTU_KREDIT,
                parameters: {'nr': kasir.noRegistrasi ?? ''}, arguments: kasir);
          },
          child: Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(right: 10, left: 10),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0x6cc7d1db)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/credit.png',
                    height: 40,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text('Kartu Kredit',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                ]),
          ),
        ),
      ]),
    ); //whatever you're returning, does not have to be a Container
  }
}
