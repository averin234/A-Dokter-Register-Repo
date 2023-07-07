import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../../data/componen/avatar.dart';
import '../../../../data/model/get_detail_dokter.dart';

class CardDokterCV extends StatelessWidget {
  Dokter dokter;
  CardDokterCV({super.key, required this.dokter});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(right: 10, left: 10, bottom: 0),
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
                          dokter.foto ?? Avatar.lakiLaki),
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
                            Text("Profil Dokter Hisehat",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                            SizedBox(
                              width: 100,
                            ),
                          ],
                        ),
                        Divider(
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text("Nama Lengkap :",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 13)),
                            SizedBox(
                              width: 6,
                            ),
                            Text(dokter.namaPegawai?? '',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 13)),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text("Email :",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 13)),
                            SizedBox(
                              width: 6,
                            ),
                            Text(dokter.email?? '',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 13)),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text("HP :",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 13)),
                            SizedBox(
                              width: 6,
                            ),
                            Text(dokter.telp?? '',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 13)),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text("Alamat :",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 13)),
                            SizedBox(
                              width: 6,
                            ),
                            Text(dokter.alamat?? '',
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
