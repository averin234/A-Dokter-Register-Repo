import 'package:a_dokter_register/app/modules/riwayat_medical_record/views/componen/horizontal_calendermr.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:get/get.dart';

import '../../riwayat_medical_record/views/componen/horizontal_calender.dart';
import '../controllers/antrian_pasien_controller.dart';
import 'componen/listview_tindakan.dart';
import 'componen/search_medical_record.dart';

class AntrianPasienView extends GetView<AntrianPasienController> {
  const AntrianPasienView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 0,
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
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_circle_left_rounded,
                  size: 40,
                ),
                color: Color.fromARGB(255, 192, 192, 192)),
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
              toolbarHeight: 120,
              automaticallyImplyLeading: false,
              elevation: 0,
              title: HorizontalCalender(),
            ),
          ),
          // Other Sliver Widgets
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
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
                  children: AnimationConfiguration.toStaggeredList(
                      duration: const Duration(milliseconds: 475),
                      childAnimationBuilder: (widget) => SlideAnimation(
                            child: FadeInAnimation(
                              child: widget,
                            ),
                          ),
                      children: <Widget>[
                        ListViewTindakan(),
                        ListViewTindakan(),
                        ListViewTindakan(),
                        ListViewTindakan(),
                        ListViewTindakan(),
                        ListViewTindakan(),
                      ]),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
