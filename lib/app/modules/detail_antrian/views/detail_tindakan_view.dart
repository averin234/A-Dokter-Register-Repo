import 'package:a_dokter_register/app/modules/detail_antrian/views/componen/surat.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:get/get.dart';

import '../controllers/detail_tindakan_controller.dart';
import 'componen/planning.dart';
import 'componen/planning/laboratorium.dart';
import 'componen/planning/radiologi.dart';
import 'componen/planning/resep.dart';
import 'componen/soap/assestment.dart';
import 'componen/soap/objektive.dart';
import 'componen/soap/soap.dart';
import 'componen/soap/subyektif.dart';
import 'componen/profile_pasien.dart';
import 'componen/vital_sign.dart';

class DetailTindakanView extends GetView<DetailTindakanController> {
  const DetailTindakanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              color: Color.fromARGB(255, 192, 192, 192),
            ),
            title: Text("SOAP", style: TextStyle(color: Colors.black)),
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
            ),
          ),
          // Other Sliver Widgets
          SliverList(
            delegate: SliverChildListDelegate([
              Column(
                children: AnimationConfiguration.toStaggeredList(
                  duration: const Duration(milliseconds: 375),
                  childAnimationBuilder: (widget) => ScaleAnimation(
                    child: SlideAnimation(
                      child: widget,
                    ),
                  ),
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    ProfilePasienTindakan(),
                    SizedBox(
                      height: 10,
                    ),
                    VitalSign(),
                    SizedBox(
                      height: 10,
                    ),
                    Soap(),
                    SizedBox(
                      height: 10,
                    ),
                    // PlanningResep(),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    // PalanningLaboratorium(),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    // PlanningRadiologi(),
                    Surat(),
                    SizedBox(
                      height: 10,
                    ),
                    Planning(),
                    SizedBox(
                      height: 40,
                    ),
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
