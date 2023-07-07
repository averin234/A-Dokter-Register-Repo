import 'package:a_dokter_register/app/data/model/get_detail_mr.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../routes/app_pages.dart';

class VitalSignView extends StatelessWidget {
  final VitalSign vitalSign;
  const VitalSignView({super.key, required this.vitalSign});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.only(right: 10, left: 10),
        padding: const EdgeInsets.only(right: 10, left: 10, bottom: 10),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0x6cc7d1db)),
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
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  width: 210,
                  child: Text("VITAL SIGN",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () => showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
        builder: (BuildContext context) {
          return DraggableScrollableSheet(
              initialChildSize: 0.95, //set this as you want
              maxChildSize: 0.95, //set this as you want
              minChildSize: 0.95, //set this as you want
              expand: true,

              builder: (context, scrollController) {
                return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.transparent,
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 4,
                          margin: EdgeInsets.only(
                            right: Get.width / 2 - 40,
                            left: Get.width / 2 - 40,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFe0e0e0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Text("Edit Vital Sign",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.blue)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                    Expanded(
                      child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: AnimationConfiguration.toStaggeredList(
                              duration: const Duration(milliseconds: 275),
                              childAnimationBuilder: (widget) => SlideAnimation(
                                child: FadeInAnimation(
                                  child: widget,
                                ),
                              ),
                              children: <Widget>[
                                const SizedBox(
                                  height: 10,
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Text("Keadaan Umum",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),

                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 10, right: 10),
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: const Color(0xfff3f3f3),
                                    borderRadius: BorderRadius.circular(22),
                                  ),
                                  child: const TextField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      contentPadding: EdgeInsets.only(
                                          left: 15, bottom: 11, top: 13, right: 15),
                                      filled: true,
                                      fillColor: Colors.transparent,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Text("Tekanan Darah",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(

                                  margin: const EdgeInsets.only(left: 10, right: 10),
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: const Color(0xfff3f3f3),
                                    borderRadius: BorderRadius.circular(22),
                                  ),
                                  child: const TextField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      contentPadding: EdgeInsets.only(
                                          left: 15, bottom: 11, top: 13, right: 15),
                                      filled: true,
                                      fillColor: Colors.transparent,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Text("Suhu",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 10, right: 10),
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: const Color(0xfff3f3f3),
                                    borderRadius: BorderRadius.circular(22),
                                  ),
                                  child: const TextField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      contentPadding: EdgeInsets.only(
                                          left: 15, bottom: 11, top: 13, right: 15),
                                      filled: true,
                                      fillColor: Colors.transparent,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Text("Tinggi Badan",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 10, right: 10),
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: const Color(0xfff3f3f3),
                                    borderRadius: BorderRadius.circular(22),
                                  ),
                                  child: const TextField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      contentPadding: EdgeInsets.only(
                                          left: 15, bottom: 11, top: 13, right: 15),
                                      filled: true,
                                      fillColor: Colors.transparent,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Text("Heart Rate",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 10, right: 10),
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: const Color(0xfff3f3f3),
                                    borderRadius: BorderRadius.circular(22),
                                  ),
                                  child: const TextField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      contentPadding: EdgeInsets.only(
                                          left: 15, bottom: 11, top: 13, right: 15),
                                      filled: true,
                                      fillColor: Colors.transparent,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Text("Kesadaran",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 10, right: 10),
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: const Color(0xfff3f3f3),
                                    borderRadius: BorderRadius.circular(22),
                                  ),
                                  child: const TextField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      contentPadding: EdgeInsets.only(
                                          left: 15, bottom: 11, top: 13, right: 15),
                                      filled: true,
                                      fillColor: Colors.transparent,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Text("Nadi",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 10, right: 10),
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: const Color(0xfff3f3f3),
                                    borderRadius: BorderRadius.circular(22),
                                  ),
                                  child: const TextField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      contentPadding: EdgeInsets.only(
                                          left: 15, bottom: 11, top: 13, right: 15),
                                      filled: true,
                                      fillColor: Colors.transparent,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Text("Pernafasan",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 10, right: 10),
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: const Color(0xfff3f3f3),
                                    borderRadius: BorderRadius.circular(22),
                                  ),
                                  child: const TextField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      contentPadding: EdgeInsets.only(
                                          left: 15, bottom: 11, top: 13, right: 15),
                                      filled: true,
                                      fillColor: Colors.transparent,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Text("Berat Badan",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 10, right: 10),
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: const Color(0xfff3f3f3),
                                    borderRadius: BorderRadius.circular(22),
                                  ),
                                  child: const TextField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      contentPadding: EdgeInsets.only(
                                          left: 15, bottom: 11, top: 13, right: 15),
                                      filled: true,
                                      fillColor: Colors.transparent,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Text("Lingkar Perut",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 10, right: 10),
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: const Color(0xfff3f3f3),
                                    borderRadius: BorderRadius.circular(22),
                                  ),
                                  child: const TextField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      contentPadding: EdgeInsets.only(
                                          left: 15, bottom: 11, top: 13, right: 15),
                                      filled: true,
                                      fillColor: Colors.transparent,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 200,
                                ),
                              ],
                            ),
                          ),

                        ),
                ),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          // onTap: () => showModalBottomSheet(
                          //   context: Get.context!,
                          //   shape: const RoundedRectangleBorder(
                          //     borderRadius: BorderRadius.vertical(
                          //       top: Radius.circular(20),
                          //     ),
                          //   ),
                          //   builder: (context) => buildSheet(context),
                          // ),
                          child: Container(
                            height: 45,
                            width: 145,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 56, 229, 77),
                              borderRadius: BorderRadius.circular(10),
                              // boxShadow: [
                              //   BoxShadow(
                              //     color: Colors.green.withOpacity(0.5),
                              //     spreadRadius: 0,
                              //     blurRadius: 10,
                              //     offset: const Offset(2, 1),
                              //   ),
                              // ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "Update Vital Sign",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ));}
          );}
                  ),
                  child: Container(
                    height: 30,
                    width: 120,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 33, 146, 255),
                      borderRadius: BorderRadius.circular(10),
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: Colors.blue.withOpacity(0.5),
                      //     spreadRadius: 0,
                      //     blurRadius: 10,
                      //     offset: const Offset(2, 1),
                      //   ),
                      // ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Update Vital Sign",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 13),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            const Divider(
              height: 10,
              color: Colors.grey,
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Keadaan Umum :",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.blue)),
                      SizedBox(
                        height: 5,
                      ),
                      Text(vitalSign.keadaanUmum ?? '',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14)),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Tekanan Darah :",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.blue)),
                      SizedBox(
                        height: 5,
                      ),
                      Text(vitalSign.tekananDarah ?? '',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14)),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Suhu :",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.blue)),
                      SizedBox(
                        height: 5,
                      ),
                      Text(vitalSign.suhu ?? '',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14)),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Tinggi Badan :",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.blue)),
                      SizedBox(
                        height: 5,
                      ),
                      Text(vitalSign.tinggiBadan?? '',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14)),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Heart Rate :",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.blue)),
                      SizedBox(
                        height: 5,
                      ),
                      Text("",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14)),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 80,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      Text("Kesadaran :",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.blue)),
                      SizedBox(
                        height: 5,
                      ),
                      Text(vitalSign.kesadaranPasien?? '',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14)),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Nadi :",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.blue)),
                      SizedBox(
                        height: 5,
                      ),
                      Text(vitalSign.nadi ?? '',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14)),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Pernafasan :",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.blue)),
                      SizedBox(
                        height: 5,
                      ),
                      Text(vitalSign.pernafasan ?? '',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14)),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Berat Badan :",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.blue)),
                      SizedBox(
                        height: 5,
                      ),
                      Text(vitalSign.beratBadan?? '',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14)),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Lingkar Perut :",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.blue)),
                      SizedBox(
                        height: 5,
                      ),
                      Text("",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14)),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildSheet(context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Padding(padding: mediaQueryData.viewInsets,
      child : Container(
        height: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.transparent,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 4,
              margin: EdgeInsets.only(
                right: Get.width / 2 - 40,
                left: Get.width / 2 - 40,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFe0e0e0),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text("Edit Vital Sign",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.blue)),
            ),
            const SizedBox(
              height: 10,
            ),
             SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: AnimationConfiguration.toStaggeredList(
                    duration: const Duration(milliseconds: 275),
                    childAnimationBuilder: (widget) => SlideAnimation(
                      child: FadeInAnimation(
                        child: widget,
                      ),
                    ),
                    children: <Widget>[
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text("Keadaan Umum",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xfff3f3f3),
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: const TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 15, bottom: 11, top: 13, right: 15),
                            filled: true,
                            fillColor: Colors.transparent,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text("Tekanan Darah",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xfff3f3f3),
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: const TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 15, bottom: 11, top: 13, right: 15),
                            filled: true,
                            fillColor: Colors.transparent,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text("Suhu",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xfff3f3f3),
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: const TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 15, bottom: 11, top: 13, right: 15),
                            filled: true,
                            fillColor: Colors.transparent,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text("Tinggi Badan",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xfff3f3f3),
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: const TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 15, bottom: 11, top: 13, right: 15),
                            filled: true,
                            fillColor: Colors.transparent,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text("Heart Rate",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xfff3f3f3),
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: const TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 15, bottom: 11, top: 13, right: 15),
                            filled: true,
                            fillColor: Colors.transparent,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text("Kesadaran",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xfff3f3f3),
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: const TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 15, bottom: 11, top: 13, right: 15),
                            filled: true,
                            fillColor: Colors.transparent,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text("Nadi",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xfff3f3f3),
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: const TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 15, bottom: 11, top: 13, right: 15),
                            filled: true,
                            fillColor: Colors.transparent,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text("Pernafasan",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xfff3f3f3),
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: const TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 15, bottom: 11, top: 13, right: 15),
                            filled: true,
                            fillColor: Colors.transparent,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text("Berat Badan",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xfff3f3f3),
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: const TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 15, bottom: 11, top: 13, right: 15),
                            filled: true,
                            fillColor: Colors.transparent,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text("Lingkar Perut",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xfff3f3f3),
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: const TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 15, bottom: 11, top: 13, right: 15),
                            filled: true,
                            fillColor: Colors.transparent,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 200,
                      ),
                    ],
                  ),
                ),
              ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              // onTap: () => showModalBottomSheet(
              //   context: Get.context!,
              //   shape: const RoundedRectangleBorder(
              //     borderRadius: BorderRadius.vertical(
              //       top: Radius.circular(20),
              //     ),
              //   ),
              //   builder: (context) => buildSheet(context),
              // ),
              child: Container(
                height: 45,
                width: 145,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 56, 229, 77),
                  borderRadius: BorderRadius.circular(10),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.green.withOpacity(0.5),
                  //     spreadRadius: 0,
                  //     blurRadius: 10,
                  //     offset: const Offset(2, 1),
                  //   ),
                  // ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Update Vital Sign",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        )));
  }
}
