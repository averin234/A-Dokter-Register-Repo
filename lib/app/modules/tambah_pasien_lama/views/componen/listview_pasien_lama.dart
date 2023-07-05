import 'package:a_dokter_register/app/data/model/get_pasien_by.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/componen/fetch_data.dart';
import '../../../../routes/app_pages.dart';

class ListViewPasienLama extends StatelessWidget {
  final Pasien pasien;
  const ListViewPasienLama({super.key, required this.pasien});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(Routes.DETAIL_REGIST_PASIEN_LAMA),
      child: Container(
        margin: const EdgeInsets.only(right: 10, left: 10, bottom: 5),
        padding: const EdgeInsets.only(right: 0, left: 10, bottom: 10),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0x6cc7d1db)),
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  Container(
                    margin:
                        const EdgeInsets.only(left: 10, bottom: 10, top: 10),
                    child: CircleAvatar(
                      radius: 30.0,
                      backgroundImage: NetworkImage(pasien.foto ?? ''),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 233, 231, 253),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Text("No MR :",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13)),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    SizedBox(
                                      width: 70,
                                      child: Text(pasien.namaPasien ?? '',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13)),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Row(
                                  children: [
                                    const Text("No MR :",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13)),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    Text(pasien.noMr ?? '',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13)),
                                  ],
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                // Row(
                                //   children: [
                                //     const Icon(
                                //       Icons.phone,
                                //       color: Colors.grey,
                                //       size: 20.0,
                                //     ),
                                //     const SizedBox(
                                //       width: 6,
                                //     ),
                                //     Text(pasien.noHp ?? '',
                                //         style: const TextStyle(
                                //             fontWeight: FontWeight.bold, fontSize: 13)),
                                //   ],
                                // ),
                                const SizedBox(
                                  height: 3,
                                ),
                                // Row(
                                //   children: [
                                //     const Icon(
                                //       Icons.person,
                                //       color: Colors.grey,
                                //       size: 20.0,
                                //     ),
                                //     const SizedBox(
                                //       width: 6,
                                //     ),
                                //     FutureBuilder(
                                //         future: API.cekJenisKelamin(
                                //             jenis_kelamin: pasien.jenKelamin ?? ''),
                                //         builder: (context, snapshot) {
                                //           if (snapshot.hasData &&
                                //               snapshot.connectionState !=
                                //                   ConnectionState.waiting &&
                                //               snapshot.data != null) {
                                //             return Text(snapshot.data!.msg ?? '',
                                //                 style: const TextStyle(
                                //                     fontWeight: FontWeight.bold,
                                //                     fontSize: 13));
                                //           } else {
                                //             return const Center(
                                //               child: CircularProgressIndicator(),
                                //             );
                                //           }
                                //         }),
                                //   ],
                                // ),

                                // Row(
                                //   children: [
                                //     const Icon(
                                //       Icons.bloodtype,
                                //       color: Colors.grey,
                                //       size: 20.0,
                                //     ),
                                //     const SizedBox(
                                //       width: 6,
                                //     ),
                                //     Text(pasien.golDarah ?? '',
                                //         style: const TextStyle(
                                //             fontWeight: FontWeight.bold, fontSize: 13)),
                                //   ],
                                // ),
                              ],
                            )),
                      ]),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ]),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
