import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../routes/app_pages.dart';

class Planning extends StatefulWidget {
  const Planning({super.key});

  @override
  State<Planning> createState() => _PlanningState();
}

class _PlanningState extends State<Planning> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(Routes.DETAIL_TINDAKAN),
      child: Container(
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
          crossAxisAlignment: CrossAxisAlignment.center,
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
                Text("Planning",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    )),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    InkWell(
                      onTap: () => showModalBottomSheet(
                        context: context,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        builder: (context) => buildSheet(),
                      ),
                      child: Container(
                        width: 80.0,
                        height: 80.0,
                        decoration: BoxDecoration(
                          image: new DecorationImage(
                            image: new AssetImage("assets/consultation.png"),
                            fit: BoxFit.fill,
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(.1),
                                blurRadius: 3,
                                spreadRadius: 1)
                          ],
                          border: Border.all(
                            width: 1.5,
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Penunjang Medis")
                  ],
                ),
                SizedBox(
                  width: 60,
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () => Get.toNamed(Routes.ISI_TINDAKAN),
                      child: Container(
                        width: 80.0,
                        height: 80.0,
                        decoration: BoxDecoration(
                          image: new DecorationImage(
                            image: new AssetImage("assets/prescription.png"),
                            fit: BoxFit.fill,
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(.1),
                                blurRadius: 3,
                                spreadRadius: 1)
                          ],
                          border: Border.all(
                            width: 1.5,
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        padding: EdgeInsets.all(5),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Tindakan")
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
            SizedBox(
              width: 60,
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    InkWell(
                      onTap: () => Get.toNamed(Routes.ISI_RESEP),
                      child: Container(
                        width: 80.0,
                        height: 80.0,
                        decoration: BoxDecoration(
                          image: new DecorationImage(
                            image:
                                new AssetImage("assets/medical-equipment.png"),
                            fit: BoxFit.fill,
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(.1),
                                blurRadius: 3,
                                spreadRadius: 1)
                          ],
                          border: Border.all(
                            width: 1.5,
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        padding: EdgeInsets.all(5),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Isi Resep")
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () => Get.toNamed(Routes.ISI_ICD_10),
                      child: Container(
                        width: 80.0,
                        height: 80.0,
                        decoration: BoxDecoration(
                          image: new DecorationImage(
                            image: new AssetImage("assets/monitoring.png"),
                            fit: BoxFit.fill,
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(.1),
                                blurRadius: 3,
                                spreadRadius: 1)
                          ],
                          border: Border.all(
                            width: 1.5,
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        padding: EdgeInsets.all(5),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Isi ICD 10")
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () => Get.toNamed(Routes.PEMERIKSAAN),
                      child: Container(
                        width: 80.0,
                        height: 80.0,
                        decoration: BoxDecoration(
                          image: new DecorationImage(
                            image: new AssetImage("assets/monitoring.png"),
                            fit: BoxFit.fill,
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(.1),
                                blurRadius: 3,
                                spreadRadius: 1)
                          ],
                          border: Border.all(
                            width: 1.5,
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        padding: EdgeInsets.all(5),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Pemeriksaan")
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSheet() {
    return Container(
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
              child: Text("Surat Rujukan Penunjang Medis",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.blue)),
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
                    duration: const Duration(milliseconds: 275),
                    childAnimationBuilder: (widget) => SlideAnimation(
                      child: FadeInAnimation(
                        child: widget,
                      ),
                    ),
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text("Kepada Yth.",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color(0xfff3f3f3),
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: TextField(
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
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text("Pemeriksaan Penujang",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        height: 120,
                        decoration: BoxDecoration(
                          color: Color(0xfff3f3f3),
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: TextField(
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          maxLines: 7,
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
                      SizedBox(
                        height: 200,
                      ),
                    ],
                  ),
                ),
              ),
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
                    builder: (context) => buildSheet(),
                  ),
                  child: Container(
                    height: 45,
                    width: 145,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 56, 229, 77),
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
                      children: [
                        Text(
                          "Simpan",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () => showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    builder: (context) => buildSheet(),
                  ),
                  child: Container(
                    height: 45,
                    width: 145,
                    decoration: BoxDecoration(
                      color: Colors.amber,
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
                      children: [
                        Text(
                          "Cetak",
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
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ));
  }
}
