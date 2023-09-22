import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/detail_tindakan_controller.dart';

class Subyektif extends StatefulWidget {
  Subyektif({super.key});

  @override
  State<Subyektif> createState() => _SubyektifState();
}

class _SubyektifState extends State<Subyektif> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DetailTindakanController());
    return Container(
      margin: EdgeInsets.only(right: 10, left: 10),
      padding: EdgeInsets.only(right: 10, left: 10, bottom: 10),
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
                child: Text("Subyektif",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              // CircleAvatar(
              //   radius: 30.0,
              //   backgroundImage:
              //   NetworkImage('https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg'),
              //   backgroundColor: Colors.transparent,
              // ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Divider(
            height: 3,
            color: Colors.grey,
          ),
          TextField(
            controller: controller.subjectiveController,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.none,
            maxLines: 7,
            decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              enabled: true,
              disabledBorder: InputBorder.none,
              contentPadding:
                  EdgeInsets.only(left: 15, bottom: 11, top: 13, right: 15),
              filled: true,
              fillColor: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}
