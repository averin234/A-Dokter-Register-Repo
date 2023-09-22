import 'package:a_dokter_register/app/data/model/get_pasien_by.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/componen/fetch_data.dart';
import '../../../../routes/app_pages.dart';

class ListViewPasienLama extends StatelessWidget {
  final Pasien pasien;
  ListViewPasienLama({super.key, required this.pasien});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(Routes.DETAIL_REGIST_PASIEN_LAMA,
          parameters: {'no_mr': pasien.noMr ?? ''}),
      child: Container(
        margin: EdgeInsets.only(right: 10, left: 10, bottom: 5, top: 10),
        padding: EdgeInsets.only(right: 0, left: 10, bottom: 5),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0x6cc7d1db)),
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
                    margin: EdgeInsets.only(left: 0, bottom: 5, top: 5),
                    // child: CircleAvatar(
                    //   radius: 30.0,
                    //   backgroundImage: NetworkImage(pasien.foto ?? ''),
                    //   backgroundColor: Colors.transparent,
                    // ),
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            padding: EdgeInsets.all(0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text("Nama :",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13)),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    SizedBox(
                                      width: 70,
                                      child: Text(pasien.namaPasien ?? '',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13)),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Row(
                                  children: [
                                    Text("No MR :",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13)),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    Text(pasien.noMr ?? '',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13)),
                                  ],
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                // Row(
                                //   children: [
                                //      Icon(
                                //       Icons.phone,
                                //       color: Colors.grey,
                                //       size: 20.0,
                                //     ),
                                //      SizedBox(
                                //       width: 6,
                                //     ),
                                //     Text(pasien.noHp ?? '',
                                //         style:  TextStyle(
                                //             fontWeight: FontWeight.bold, fontSize: 13)),
                                //   ],
                                // ),
                                SizedBox(
                                  height: 3,
                                ),
                                // Row(
                                //   children: [
                                //      Icon(
                                //       Icons.person,
                                //       color: Colors.grey,
                                //       size: 20.0,
                                //     ),
                                //      SizedBox(
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
                                //                 style:  TextStyle(
                                //                     fontWeight: FontWeight.bold,
                                //                     fontSize: 13));
                                //           } else {
                                //             return  Center(
                                //               child: CircularProgressIndicator(),
                                //             );
                                //           }
                                //         }),
                                //   ],
                                // ),

                                // Row(
                                //   children: [
                                //      Icon(
                                //       Icons.bloodtype,
                                //       color: Colors.grey,
                                //       size: 20.0,
                                //     ),
                                //      SizedBox(
                                //       width: 6,
                                //     ),
                                //     Text(pasien.golDarah ?? '',
                                //         style:  TextStyle(
                                //             fontWeight: FontWeight.bold, fontSize: 13)),
                                //   ],
                                // ),
                              ],
                            )),
                      ]),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ]),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [],
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
