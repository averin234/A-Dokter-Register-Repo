import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../routes/app_pages.dart';

class Assestmenthiss extends StatefulWidget {
  const Assestmenthiss({super.key});

  @override
  State<Assestmenthiss> createState() => _AssestmenthissState();
}

class _AssestmenthissState extends State<Assestmenthiss> {
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
                SizedBox(
                  width: 270,
                  child : Text("Subyektif",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,)),),
                SizedBox(
                  height: 10,
                ),
                // CircleAvatar(
                //   radius: 30.0,
                //   backgroundImage:
                //   NetworkImage('https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg'),
                //   backgroundColor: Colors.transparent,
                // ),
              ],),
            SizedBox(
              height: 5,
            ),
            Divider(
              height: 3,
              color: Colors.grey,
            ),
            // Row(
            //   children: [
            //     TextFormField(
            //       decoration: InputDecoration(
            //       ),
            //     )
            //   ],
            // )
          ],),
      ),
    );
  }
}