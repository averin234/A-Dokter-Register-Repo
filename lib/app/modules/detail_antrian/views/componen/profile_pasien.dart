import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../routes/app_pages.dart';

class ProfilePasienTindakan extends StatefulWidget {
  const ProfilePasienTindakan({super.key});

  @override
  State<ProfilePasienTindakan> createState() => _ProfilePasienTindakanState();
}

class _ProfilePasienTindakanState extends State<ProfilePasienTindakan> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10, left: 10),
      padding: EdgeInsets.only(right: 10, left: 10, bottom: 10),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 270,
                child: Text("Taufik fik",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              CircleAvatar(
                radius: 30.0,
                backgroundImage: NetworkImage(
                    'https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg'),
                backgroundColor: Colors.transparent,
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Divider(
            height: 3,
            color: Colors.grey,
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("No MR",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13)),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Umur",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13)),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Golongan Darah",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13)),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Jenis Kelamin",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13)),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Alergi",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13)),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10, top: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(":",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13)),
                        SizedBox(
                          width: 6,
                        ),
                        Text("9754856765",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13)),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(":",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13)),
                        SizedBox(
                          width: 6,
                        ),
                        Text("12 tahun",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13)),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(":",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13)),
                        SizedBox(
                          width: 6,
                        ),
                        Text("A+",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13)),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(":",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13)),
                        SizedBox(
                          width: 6,
                        ),
                        Text("Laki - Laki",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13)),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(":",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13)),
                        SizedBox(
                          width: 6,
                        ),
                        Text("Tidak Ada",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13)),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () => Get.toNamed(Routes.RIWAYAT_MEDICAL_RECORD),
                    child: Container(
                      height: 45,
                      width: 230,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 56, 229, 77),
                        borderRadius: BorderRadius.circular(10),
                         // boxShadow: [
                         //   BoxShadow(
                         //     color: Colors.green.withOpacity(0.5),
                         //     spreadRadius: 0,
                         //     blurRadius: 10,
                         //     offset: const Offset(6, 6),
                         //   ),
                         // ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Lihat Riwayat MR",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
