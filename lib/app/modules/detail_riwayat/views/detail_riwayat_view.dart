import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:get/get.dart';

import '../controllers/detail_riwayat_controller.dart';
import 'componen/riwayat.vitalsign.dart';
import 'componen/riwayat_laboratorium.dart';
import 'componen/riwayat_radiologi.dart';
import 'componen/riwayat_resep.dart';
import 'componen/riwayat_soap/soap.dart';

class DetailRiwayatView extends GetView<DetailRiwayatController> {
  const DetailRiwayatView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.white, // <-- SEE HERE
              statusBarIconBrightness:
                  Brightness.dark, //<-- For Android SEE HERE (dark icons)
              statusBarBrightness:
                  Brightness.light, //<-- For iOS SEE HERE (dark icons)
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(10),
              ),
            ),
            floating: true,
            pinned: true,
            snap: true,
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_circle_left_rounded,
                  size: 40,
                ),
                color: Color.fromARGB(255, 192, 192, 192)),
            title:
                Text("Detail Riwayat", style: TextStyle(color: Colors.black)),
            // actions: [
            //   IconButton(
            //       onPressed: () {},
            //       icon: Icon(Icons.notifications_active),
            //       color: Colors.white),
            // ],
            bottom: AppBar(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
              ),
              toolbarHeight: 0,
              automaticallyImplyLeading: false,
              elevation: 0,
              backgroundColor: Color.fromARGB(255, 35, 163, 223),
              // title: SearchMedicalRecord(),
            ),
          ),
          // Other Sliver Widgets
          SliverList(
            delegate: SliverChildListDelegate([
              Column(
                children: AnimationConfiguration.toStaggeredList(
                  duration: const Duration(milliseconds: 375),
                  childAnimationBuilder: (widget) => ScaleAnimation(
                    child: FadeInAnimation(
                      child: widget,
                    ),
                  ),
                  children: <Widget>[
                    SizedBox(
                      height: 15,
                    ),
                    RiwayatVitalSign(),
                    SizedBox(
                      height: 10,
                    ),
                    RiwayatSoap(),
                    SizedBox(
                      height: 10,
                    ),
                    RiwayatResep(),
                    SizedBox(
                      height: 10,
                    ),
                    RiwayatRadiologi(),
                    SizedBox(
                      height: 10,
                    ),
                    RiwayatLaboratorium(),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
