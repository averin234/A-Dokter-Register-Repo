import 'package:a_dokter_register/app/modules/pendapatan_dokter/views/componen/search_icd_10.dart';
import 'package:a_dokter_register/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:get/get.dart';

import '../../home/views/componen/chart.dart';
import '../../antrian_pasien/views/componen/search_medical_record.dart';
import '../controllers/pendapatan_dokter_controller.dart';
import 'componen/tabel_pendapatan.dart';

class PendapatanDokterView extends GetView<PendapatanDokterController> {
  const PendapatanDokterView({Key? key}) : super(key: key);
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
            title: Text('Pendapatan'),

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
              toolbarHeight: 50,
              title: Column(
                children: [
                  SearchPendapatan(),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
              automaticallyImplyLeading: false,
              elevation: 0,
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
                    InkWell(
                      onTap: () => Get.toNamed(Routes.REGISTER_DOKTER),
                      child: Container(
                        height: 45,
                        width: 305,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.green.withOpacity(0.5),
                              spreadRadius: 0,
                              blurRadius: 10,
                              offset: const Offset(2, 1),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "Kasir",
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
                      height: 20,
                    ),
                    Pendapatan(),
                    SizedBox(
                      height: 10,
                    ),
                    Pendapatan(),
                    SizedBox(
                      height: 10,
                    ),
                    Pendapatan(),
                    SizedBox(
                      height: 10,
                    ),
                    Pendapatan(),
                    SizedBox(
                      height: 10,
                    ),
                    Pendapatan(),
                    SizedBox(
                      height: 10,
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
