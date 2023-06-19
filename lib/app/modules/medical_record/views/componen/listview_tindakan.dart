import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../routes/app_pages.dart';

class ListViewPasien extends StatefulWidget {
  const ListViewPasien({super.key});

  @override
  State<ListViewPasien> createState() => _ListViewPasienState();
}

class _ListViewPasienState extends State<ListViewPasien> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(Routes.RIWAYAT_MEDICAL_RECORD),
      child: Container(
        margin: EdgeInsets.only(right: 10, left: 10, bottom: 5),
        padding: EdgeInsets.only(right: 0, left: 10, bottom: 10),
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
                    margin: EdgeInsets.only(left: 10, bottom: 10, top: 10),
                    child: CircleAvatar(
                      radius: 30.0,
                      backgroundImage: NetworkImage(
                          'https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg'),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text("Adni Maulidin",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 13)),
                            SizedBox(
                              width: 100,
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 219, 246, 253),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text("Cek MR",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
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
                                    fontWeight: FontWeight.bold, fontSize: 13)),
                            SizedBox(
                              width: 6,
                            ),
                            Text("8909009897",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 13)),
                          ],
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.phone,
                              color: Colors.grey,
                              size: 20.0,
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Text("087724023543",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 13)),
                          ],
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.person,
                              color: Colors.grey,
                              size: 20.0,
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Text("Lak-Laki",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 13)),
                          ],
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.bloodtype,
                              color: Colors.grey,
                              size: 20.0,
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Text("A+",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 13)),
                          ],
                        ),
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
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
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
