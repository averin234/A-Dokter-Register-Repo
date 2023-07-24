import 'package:a_dokter_register/app/data/componen/fetch_data.dart';
import 'package:a_dokter_register/app/data/componen/publics.dart';
import 'package:a_dokter_register/app/data/model/get_detail_pasien.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../loading_summer/loading.listmr.dart';
import '../../loading_summer/loading_card_profile.dart';
import '../controllers/riwayat_medical_record_controller.dart';
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
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_circle_left_rounded,
                  size: 40,
                ),
                color: const Color.fromARGB(255, 192, 192, 192)),
            title: const Text("Medical Record",
                style: TextStyle(color: Colors.black)),
            // actions: [
            //   IconButton(
            //       onPressed: () {},
            //       icon: Icon(Icons.notifications_active),
            //       color: Colors.white),
            // ],
            bottom: AppBar(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
              ),
              toolbarHeight: 0,
              automaticallyImplyLeading: false,
              elevation: 0,
              // title: Container(
              //   padding: const EdgeInsets.all(0),
              //   margin: const EdgeInsets.only(top: 15),
              //   decoration:
              //       BoxDecoration(borderRadius: BorderRadius.circular(10)),
              //   child: const HorizontalCalendermr(),
              // ),
            ),
          ),
          // Other Sliver Widgets
          SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(
                height: 20,
              ),
              FutureBuilder(
                  future: API.getDetailPasien(no_mr: controller.noMr),
                  builder: (context, snapshot) {
                    if (snapshot.hasData &&
                        snapshot.connectionState != ConnectionState.waiting &&
                        snapshot.data != null) {
                      final data = snapshot.data!.pasien ?? Pasien();
                      return ProfileRiwayat(pasien: data);
                    } else {
                      return Column(children: [
                        shimmerCardProfile(),
                      ],);
                    }
                  }),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text("Riwayat Medical Record Pasien",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
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
                child: FutureBuilder(
                    future: API.getListMR(
                        kode_dokter:
                            Publics.controller.getDataRegist.value.kode ?? '',
                        no_mr: controller.noMr),
                    builder: (context, snapshot) {
                      if (snapshot.hasData &&
                          snapshot.connectionState != ConnectionState.waiting &&
                          snapshot.data != null) {
                        final data = snapshot.data!.listMr ?? [];
                        return data.isEmpty
                            ? Column(
                          children: [
                            const Text('Belum Ada Pasien yang diperiksa'),
                            Image.asset(
                              'assets/images/tidakadamedicalrecord.jpg',
                              height: 300,
                            ),
                          ],
                        )
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
                                            .map((e) => ListViewRiwayat(
                                                  listMr: e,
                                                ))
                                            .toList()),
                              );
                      } else {
                        return Column(children: [
                          shimmerListMr(),
                          shimmerListMr(),
                          shimmerListMr(),
                          shimmerListMr(),
                          shimmerListMr(),
                          shimmerListMr(),
                          shimmerListMr(),
                        ],);
                      }
                    }),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
