import 'package:a_dokter_register/app/data/model/get_list_kasir.dart';
import 'package:flutter/material.dart';

import '../../../bottomsheet/bottomshet_bayar.dart';

class Pendapatan extends StatelessWidget {
  final Kasir kasir;
  const Pendapatan({super.key, required this.kasir});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () => Get.toNamed(Routes.DETAIL_TINDAKAN),
      child: Container(
        margin: const EdgeInsets.only(right: 10, left: 10, bottom: 5),
        padding: const EdgeInsets.only(right: 0, left: 10, bottom: 10, top: 10),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0x6cc7d1db)),
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
              Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: InkWell(
                  onTap: () {
                    bottomSheetBayar();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Selesai Periksa',
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold)),
                      // Container(
                      //   padding: const EdgeInsets.only(
                      //       right: 5, left: 5, top: 10, bottom: 10),
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(5),
                      //     color: Colors.blue,
                      //   ),
                      //   child: const Row(
                      //     children: [
                      //       Icon(Icons.monetization_on_rounded,
                      //           color: Colors.white),
                      //       SizedBox(
                      //         width: 10,
                      //       ),
                      //       Text('Cek Pembayaran Pasien',
                      //           style: TextStyle(
                      //               fontWeight: FontWeight.bold,
                      //               color: Colors.white)),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Text('No Registrasi ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const Text(': ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(kasir.noRegistrasi ?? '',
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  const Text('Tanggal Masuk ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const Text(': '),
                  Text(kasir.jamMasuk ?? '',
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  const Text('Nama Pasien '),
                  const Text(': '),
                  Text(kasir.namaPasien ?? '',
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Text('Nasabah '),
                  const Text(': '),
                  Text(kasir.namaKelompok ?? ''),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Text('Nama Bagian '),
                  const Text(': '),
                  Text(kasir.namaBagian ?? ''),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(color: Colors.black),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Expanded(
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
                              style: const TextStyle(
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
