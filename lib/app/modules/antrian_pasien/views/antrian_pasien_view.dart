import 'package:a_dokter_register/app/data/componen/fetch_data.dart';
import 'package:a_dokter_register/app/data/componen/publics.dart';
import 'package:a_dokter_register/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import '../../loading_summer/loading.home.dart';
import '../controllers/antrian_pasien_controller.dart';
import 'componen/horizontal_calender.dart';
import 'componen/listview_tindakan.dart';

class AntrianPasienView extends GetView<AntrianPasienController> {
  const AntrianPasienView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.white, // <-- SEE HERE
              statusBarIconBrightness:
                  Brightness.dark, //<-- For Android SEE HERE (dark icons)
              statusBarBrightness:
                  Brightness.light, //<-- For iOS SEE HERE (dark icons)
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(10),
              ),
            ),
            floating: true,
            pinned: true,
            snap: true,
            title: const Text('Antrian Pasien'),
            leading: IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(
                  Icons.arrow_circle_left_rounded,
                  size: 40,
                ),
                color: const Color.fromARGB(255, 192, 192, 192)),
            bottom: AppBar(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
              ),
              toolbarHeight: 85,
              automaticallyImplyLeading: false,
              elevation: 0,
              title: const HorizontalCalender(),
            ),
          ),
          // Other Sliver Widgets
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                margin: const EdgeInsets.only(top: 10, right: 10, left: 10),
                padding: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: const Color(0xFFe0e0e0).withOpacity(0.5),
                  //     spreadRadius: 0,
                  //     blurRadius: 10,
                  //     offset: const Offset(2, 1),
                  //   ),
                  // ],
                ),
                child: Obx(() {
                  return FutureBuilder(
                      future: API.getAntrianPasien(
                          tanggal: controller.date.value,
                          kode_dokter:
                              Publics.controller.getDataRegist.value.kode ??
                                  ''),
                      builder: (context, snapshot) {
                        if (snapshot.hasData &&
                            snapshot.connectionState !=
                                ConnectionState.waiting &&
                            snapshot.data != null) {
                          final data = snapshot.data!.antrian ?? [];
                          return data.isEmpty
                              ? Column(
                            children: [
                              Text('Tidak ada Antrian Pasien Hari ini'),
                            Image.asset(
                              'assets/images/noantri.png',
                              height: 200,
                            ),
                          ],)
                              : Column(
                                  children:
                                      AnimationConfiguration.toStaggeredList(
                                          duration:
                                              const Duration(milliseconds: 475),
                                          childAnimationBuilder: (widget) =>
                                              SlideAnimation(
                                                child: FadeInAnimation(
                                                  child: widget,
                                                ),
                                              ),
                                          children: data
                                              .map((e) =>
                                                  ListViewTindakan(antrian: e))
                                              .toList()),
                                );
                        } else {
                          return const SingleChildScrollView(
                            child: Column(
                              children: [
                                shimmerHome(),
                                shimmerHome(),
                                shimmerHome(),
                                shimmerHome(),
                                shimmerHome(),
                                shimmerHome(),
                              ],
                            ),
                          );
                        }
                      });
                }),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
