import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../controllers/riwayat_medical_record_controller.dart';
import 'componen/horizontal_calender.dart';
import 'componen/horizontal_calendermr.dart';
import 'componen/listview_riwayat_medis.dart';
import 'componen/profile_pasien_riwayat_mr.dart';

class RiwayatMedicalRecordView extends GetView<RiwayatMedicalRecordController> {
  const RiwayatMedicalRecordView({Key? key}) : super(key: key);
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
                color: Color.fromARGB(255, 192, 192, 192)),
            title:
                Text("Medical Record", style: TextStyle(color: Colors.black)),
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
              toolbarHeight: 100,
              automaticallyImplyLeading: false,
              elevation: 0,
              title: Container(
                padding: EdgeInsets.all(0),
                margin: EdgeInsets.only(top: 15),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: HorizontalCalendermr(),
              ),
            ),
          ),
          // Other Sliver Widgets
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(
                height: 20,
              ),
              ProfileRiwayat(),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
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
                  children: AnimationConfiguration.toStaggeredList(
                    duration: const Duration(milliseconds: 475),
                    childAnimationBuilder: (widget) => SlideAnimation(
                      child: FadeInAnimation(
                        child: widget,
                      ),
                    ),
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Text("Riwayat Medical Record Pasien"),
                      SizedBox(
                        height: 10,
                      ),
                      ListViewRiwayat(),
                      SizedBox(
                        height: 10,
                      ),
                      ListViewRiwayat(),
                      SizedBox(
                        height: 10,
                      ),
                      ListViewRiwayat(),
                      SizedBox(
                        height: 10,
                      ),
                      ListViewRiwayat(),
                      SizedBox(
                        height: 10,
                      ),
                      ListViewRiwayat(),
                      SizedBox(
                        height: 10,
                      ),
                      ListViewRiwayat(),
                      SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
