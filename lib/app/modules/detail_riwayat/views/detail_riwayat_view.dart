import 'package:a_dokter_register/app/data/componen/fetch_data.dart';
import 'package:a_dokter_register/app/data/model/get_detail_mr.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:get/get.dart';

import '../../loading_summer/loading.pendapatan.dart';
import '../../loading_summer/loading_soap.dart';
import '../../loading_summer/loading_vital_sign.dart';
import '../controllers/detail_riwayat_controller.dart';
import 'componen/riwayat.vitalsign.dart';
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
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_circle_left_rounded,
                  size: 40,
                ),
                color: const Color.fromARGB(255, 192, 192, 192)),
            title: const Text("Detail Riwayat",
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
              backgroundColor: const Color.fromARGB(255, 35, 163, 223),
              // title: SearchMedicalRecord(),
            ),
          ),
          // Other Sliver Widgets
          SliverList(
            delegate: SliverChildListDelegate([
              FutureBuilder(
                  future:
                      API.getDetailMR(no_registrasi: controller.noRegistrasi),
                  builder: (context, snapshot) {
                    if (snapshot.hasData &&
                        snapshot.connectionState != ConnectionState.waiting &&
                        snapshot.data != null) {
                      final data = snapshot.data!;
                      return Column(
                        children: AnimationConfiguration.toStaggeredList(
                          duration: const Duration(milliseconds: 375),
                          childAnimationBuilder: (widget) => ScaleAnimation(
                            child: FadeInAnimation(
                              child: widget,
                            ),
                          ),
                          children: <Widget>[
                            const SizedBox(
                              height: 15,
                            ),
                            data.vitalSign == null
                                ?  Container(
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
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text("VITAL SIGN",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        )),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text('Vital Sign Belum di isi',  style: TextStyle(color: Colors.redAccent),)
                            ]),)
                                : RiwayatVitalSign(
                                    vitalSign: data.vitalSign ?? VitalSign()),
                            const SizedBox(
                              height: 10,
                            ),
                            data.riwayatPemeriksaan == null
                                ? Container(
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
                                    const Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text("SOAP",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                            )),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text('Riwayat SOAP Belum di isi', style: TextStyle(color: Colors.redAccent),)
                                  ]),)
                                : RiwayatSoap(
                                    soap: data.riwayatPemeriksaan ??
                                        RiwayatPemeriksaan()),
                            const SizedBox(
                              height: 10,
                            ),
                            data.resep == null
                                ? Container(
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
                                    const Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text("Resep",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                            )),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text('Riwayat Resep Tidak ada', style: TextStyle(color: Colors.redAccent),)
                                  ]),)
                                : RiwayatResep(
                                    resep: data.resep ?? [],
                                    resepi: Resep(),
                                  ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      );
                    } else {
                      return const Column(
                        children: [
                          shimmerVitalSign(),
                          shimmerSoap(),
                          shimmerPendapatan(),
                        ],
                      );
                    }
                  }),
            ]),
          ),
        ],
      ),
    );
  }
}
