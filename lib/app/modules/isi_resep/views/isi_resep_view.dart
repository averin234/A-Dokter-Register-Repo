import 'package:a_dokter_register/app/modules/isi_resep/controllers/isi_resep_controller.dart';
import 'package:a_dokter_register/app/modules/isi_resep/views/componen/form_isi_resep.dart';
import 'package:a_dokter_register/app/modules/isi_resep/views/componen/hasil_resep.dart';
import 'package:a_dokter_register/app/modules/isi_tindakan/views/componen/nama_pemeriksa.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/componen/fetch_data.dart';
import '../../../data/model/list_data.dart';

class IsiResepView extends GetView<IsiResepController> {
  const IsiResepView({Key? key}) : super(key: key);
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
            title: const Text("Resep", style: TextStyle(color: Colors.black)),
            bottom: AppBar(
              toolbarHeight: 0,
              automaticallyImplyLeading: false,
              elevation: 0,
            ),
          ),
          // Other Sliver Widgets
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Column(
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
                      const NamaPemeriksa(),
                      const SizedBox(
                        height: 10,
                      ),
                      const FormIsiResep(),
                      const SizedBox(
                        height: 30,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text('Hasil Resep',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FutureBuilder(
                          future: API.getDetailMR(
                              no_registrasi: controller.noRegistrasi),
                          builder: (context, snapshot) {
                            if (snapshot.hasData &&
                                snapshot.connectionState !=
                                    ConnectionState.waiting &&
                                snapshot.data != null) {
                              final data = snapshot.data!.resep ?? [];
                              return data.isEmpty
                                  ? const Text('Tidak Ada Resep')
                                  : Column(
                                      children: AnimationConfiguration
                                          .toStaggeredList(
                                              duration: const Duration(
                                                  milliseconds: 475),
                                              childAnimationBuilder: (widget) =>
                                                  SlideAnimation(
                                                    child: FadeInAnimation(
                                                      child: widget,
                                                    ),
                                                  ),
                                              children: data
                                                  .map((e) =>
                                                      HasilResep(resep: e))
                                                  .toList()),
                                    );
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          }),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
