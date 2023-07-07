import 'package:a_dokter_register/app/data/componen/fetch_data.dart';
import 'package:a_dokter_register/app/data/componen/publics.dart';
import 'package:a_dokter_register/app/modules/pendapatan_dokter/views/componen/searchpendapatan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:get/get.dart';

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
            title: const Text('Pendapatan'),

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
              toolbarHeight: 50,
              title: Column(
                children: const [
                  SearchPendapatan1(),
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
              SizedBox(
                height: 20,
              ),
              FutureBuilder(
                  future: API.getListKasir(
                      kode_dokter:
                          Publics.controller.getDataRegist.value.kode ?? ''),
                  builder: (context, snapshot) {
                    if (snapshot.hasData &&
                        snapshot.connectionState != ConnectionState.waiting &&
                        snapshot.data != null) {
                      final data = snapshot.data!.kasir ?? [];
                      return data.isEmpty
                          ? Center(
                        child: Image.asset(
                          'assets/images/tidakadapendapatan.png',
                          height: 100,
                        ),
                      )
                          : Column(
                              children: AnimationConfiguration.toStaggeredList(
                                duration: const Duration(milliseconds: 375),
                                childAnimationBuilder: (widget) =>
                                    ScaleAnimation(
                                  child: SlideAnimation(
                                    child: widget,
                                  ),
                                ),
                                children: data
                                    .map((e) => Pendapatan(kasir: e))
                                    .toList(),
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
