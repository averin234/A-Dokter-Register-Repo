import 'package:a_dokter_register/app/data/componen/fetch_data.dart';
import 'package:a_dokter_register/app/data/model/get_detail_mr.dart';
import 'package:a_dokter_register/app/modules/detail_antrian/views/componen/surat.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:get/get.dart';

import '../controllers/detail_tindakan_controller.dart';
import 'componen/planning.dart';
import 'componen/soap/soap.dart';
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
              color: const Color.fromARGB(255, 192, 192, 192),
            ),
            title: const Text("SOAP", style: TextStyle(color: Colors.black)),
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
                            child: SlideAnimation(
                              child: widget,
                            ),
                          ),
                          children: <Widget>[
                            const SizedBox(
                              height: 10,
                            ),
                            ProfilePasienTindakan(),
                            const SizedBox(
                              height: 10,
                            ),
                            VitalSignView(
                                vitalSign: data.vitalSign ?? VitalSign()),
                            const SizedBox(
                              height: 10,
                            ),
                            Soap(),
                            const SizedBox(
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
                            const Surat(),
                            const SizedBox(
                              height: 10,
                            ),
                            const Planning(),
                            const SizedBox(
                              height: 40,
                            ),
                          ],
                        ),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
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
