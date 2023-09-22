import 'package:a_dokter_register/app/data/model/get_list_mr.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';

class ListViewRiwayat extends StatelessWidget {
  final ListMr listMr;
  ListViewRiwayat({super.key, required this.listMr});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(Routes.DETAIL_RIWAYAT,
          parameters: {'no_registrasi': listMr.noRegistrasi ?? ''}),
      child: Container(
        margin: EdgeInsets.only(right: 10, left: 10, top: 10),
        padding: EdgeInsets.only(right: 0, left: 10, bottom: 10),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0x6cc7d1db)),
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text(listMr.namaPegawai ?? '',
                      //     style:  TextStyle(
                      //         fontWeight: FontWeight.bold, fontSize: 16)),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 6,
                          ),
                          Text("Bagian :",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                  color: Colors.grey)),
                          SizedBox(
                            width: 6,
                          ),
                          Text(listMr.namaBagian ?? '',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                  color: Colors.grey)),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      Container(
                        padding: EdgeInsets.only(
                            right: 7, left: 7, top: 7, bottom: 7),
                        decoration: BoxDecoration(
                            // color:  Color.fromARGB(255, 219, 246, 253),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Tanggal Pemeriksaan",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.calendar_month_rounded,
                                  color: Color.fromARGB(255, 35, 163, 223),
                                  size: 24.0,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(listMr.tglPemeriksaan ?? ''),
                                SizedBox(
                                  width: 10,
                                ),
                                //  Icon(
                                //   Icons.access_time_filled_rounded,
                                //   color: Color.fromARGB(255, 35, 163, 223),
                                //   size: 24.0,
                                // ),
                                // SizedBox(
                                //   width: 4,
                                // ),
                                // Text("20:00:00"),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
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
