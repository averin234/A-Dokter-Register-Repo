import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../routes/app_pages.dart';

class Pendapatan extends StatefulWidget {
  const Pendapatan({super.key});

  @override
  State<Pendapatan> createState() => _PendapatanState();
}

class _PendapatanState extends State<Pendapatan> {
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
              Row(
                children: [
                  Text('No Registrasi ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(': ', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('98008734 ',
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
                  Text('12-06-2023 09:20',
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
                  Text('Adni Maulidin ',
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
                  Text('Umum'),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text('Nama Bagian '),
                  Text(': '),
                  Text('Politeknik Umum'),
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
                              "700.000,00",
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
