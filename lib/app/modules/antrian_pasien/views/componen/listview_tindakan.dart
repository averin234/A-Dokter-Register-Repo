import 'package:a_dokter_register/app/data/model/get_antrian_pasien.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import '../../../../data/componen/avatar.dart';
import '../../../../routes/app_pages.dart';

class ListViewTindakan extends StatelessWidget {
  final Antrian antrian;
  ListViewTindakan({super.key, required this.antrian});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () => Get.toNamed(Routes.DETAIL_TINDAKAN, parameters: {
            'no_registrasi': antrian.noRegistrasi ?? '',
            'no_mr': antrian.noMr ?? ''
          }),
          child: Container(
            padding: EdgeInsets.only(right: 0, left: 10, bottom: 10),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin:
                              EdgeInsets.only(left: 10, bottom: 10, top: 10),
                          child: CircleAvatar(
                            radius: 30.0,
                            backgroundImage: NetworkImage(antrian.fotoPasien ??
                                (antrian.jenisKelamin == '2'
                                    ? Avatar.lakiLaki
                                    : Avatar.perempuan)),
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              child: Text(
                                antrian.namaPasien ?? '',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("No MR :",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13)),
                                SizedBox(
                                  width: 6,
                                ),
                                Text(antrian.noMr ?? '',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13)),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                margin: EdgeInsets.only(
                                    right: 10, top: 10, bottom: 10),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 233, 231, 253),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      "Antrian",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "${antrian.noAntrian ?? ''}",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  padding:
                      EdgeInsets.only(right: 7, left: 7, top: 7, bottom: 7),
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 219, 246, 253),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Pendaftaran",
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
                          Text((antrian.tglJamPoli ?? '').substring(0, 10)),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.access_time_filled_rounded,
                            color: Color.fromARGB(255, 35, 163, 223),
                            size: 24.0,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text((antrian.tglJamPoli ?? '').substring(10)),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () => showModalBottomSheet(
                                  context: context,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20),
                                    ),
                                  ),
                                  builder: (context) => lihat(),
                                ),
                                child: Container(
                                  width: 160,
                                  padding: EdgeInsets.only(
                                      right: 10, left: 10, bottom: 10, top: 10),
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 254, 228, 203),
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(0.0),
                                        bottomRight: Radius.circular(0.0),
                                        topLeft: Radius.circular(10.0),
                                        bottomLeft: Radius.circular(10.0)),
                                  ),
                                  child: Text(
                                    'Lihat',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () => Get.toNamed(Routes.DETAIL_TINDAKAN,
                                    parameters: {
                                      'no_registrasi':
                                          antrian.noRegistrasi ?? '',
                                      'no_mr': antrian.noMr ?? ''
                                    }),
                                child: Container(
                                  width: 160,
                                  padding: EdgeInsets.only(
                                      right: 10, left: 10, bottom: 10, top: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10.0),
                                        bottomRight: Radius.circular(10.0),
                                        topLeft: Radius.circular(0.0),
                                        bottomLeft: Radius.circular(0.0)),
                                  ),
                                  child: Text(
                                    'SOAP',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget lihat() {
    return Container(
        height: 230,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.transparent,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              height: 4,
              margin: EdgeInsets.only(
                right: Get.width / 2 - 40,
                left: Get.width / 2 - 40,
              ),
              decoration: BoxDecoration(
                color: Color(0xFFe0e0e0),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text("Pasien ${antrian.namaPasien ?? ''}",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black)),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: AnimationConfiguration.toStaggeredList(
                    duration: Duration(milliseconds: 275),
                    childAnimationBuilder: (widget) => SlideAnimation(
                      child: FadeInAnimation(
                        child: widget,
                      ),
                    ),
                    children: <Widget>[
                      Row(
                        children: [
                          Container(
                            margin:
                                EdgeInsets.only(left: 0, bottom: 10, top: 10),
                            child: CircleAvatar(
                              radius: 30.0,
                              backgroundImage:
                                  NetworkImage(antrian.fotoPasien ?? ''),
                              backgroundColor: Colors.transparent,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Text("Umur :",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13)),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    Text("${antrian.umur ?? ''} Tahun",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13)),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Text("Golongan Darah :",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13)),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    Text(antrian.golDarah ?? '',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13)),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Text("Alergi :",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13)),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    Text(antrian.alergi ?? '',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13)),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Text("No Hp :",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13)),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    Text(antrian.noHp ?? '',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13)),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Text("Alamat :",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13)),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    SizedBox(
                                      width: 170,
                                      child: Text(antrian.alamat ?? '',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13)),
                                    ),
                                  ],
                                ),
                              ]),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ));
  }
}
