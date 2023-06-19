import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../routes/app_pages.dart';

class RiwayatVitalSign extends StatefulWidget {
  const RiwayatVitalSign({super.key});

  @override
  State<RiwayatVitalSign> createState() => _RiwayatVitalSignState();
}

class _RiwayatVitalSignState extends State<RiwayatVitalSign> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(Routes.DETAIL_TINDAKAN),
      child : Container(
        margin: EdgeInsets.only(right: 10,left: 10),
        padding: EdgeInsets.only(right: 10,left: 10, bottom: 10),
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
        Text("VITAL SIGN",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,)),
                SizedBox(
                  height: 10,
                ),
              ],),
            SizedBox(
              height: 5,
            ),
            Divider(
              height: 10,
              color: Colors.grey,
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Keadaan Umum :",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13,color: Colors.blue)),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Sedang",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14)),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Tekanan Darah :",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13,color: Colors.blue)),
                      SizedBox(
                        height: 5,
                      ),
                      Text("120/6",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14)),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Suhu :",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13,color: Colors.blue)),
                      SizedBox(
                        height: 5,
                      ),
                      Text("38",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14)),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Tinggi Badan :",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13,color: Colors.blue)),
                      SizedBox(
                        height: 5,
                      ),
                      Text("158",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14)),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Heart Rate :",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.blue)),
                      SizedBox(
                        height: 5,
                      ),
                      Text("1",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14)),
                      SizedBox(
                        height: 10,
                      ),

                    ],),),
                SizedBox(
                  width: 80,
                ),
                Container(
                  padding: EdgeInsets.only(left: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Kesadaran :",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13,color: Colors.blue)),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Compos Menthis",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14)),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Nadi :",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13,color: Colors.blue)),
                      SizedBox(
                        height: 5,
                      ),
                      Text("95",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14)),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Pernafasan :",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13,color: Colors.blue)),
                      SizedBox(
                        height: 5,
                      ),
                      Text("15",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14)),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Berat Badan :",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13,color: Colors.blue)),
                      SizedBox(
                        height: 5,
                      ),
                      Text("50",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14)),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Lingkar Perut :",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13,color: Colors.blue)),
                      SizedBox(
                        height: 5,
                      ),
                      Text("0",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14)),
                      SizedBox(
                        height: 10,
                      ),

                    ],),),

              ],
            )
          ],),
      ),
    );
  }
}