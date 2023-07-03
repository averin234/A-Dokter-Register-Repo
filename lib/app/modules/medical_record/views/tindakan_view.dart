import 'package:a_dokter_register/app/data/componen/publics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:get/get.dart';

import '../../../data/componen/fetch_data.dart';
import '../../antrian_pasien/views/componen/search_medical_record.dart';
import '../controllers/tindakan_controller.dart';
import 'componen/listview_tindakan.dart';

class TindakanView extends GetView<TindakanController> {
  const TindakanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 0,
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
            automaticallyImplyLeading: false,
            bottom: AppBar(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
              ),
              toolbarHeight: 100,
              automaticallyImplyLeading: false,
              elevation: 0,
              title: const SearchTindakanDokter(),
            ),
          ),
          // Other Sliver Widgets
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.only(top: 10),
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
                child: FutureBuilder(
                    future: API.getPasienBy(
                        kode_dokter:
                            Publics.controller.getDataRegist.value.kode ?? ''),
                    builder: (context, snapshot) {
                      if (snapshot.hasData &&
                          snapshot.connectionState != ConnectionState.waiting &&
                          snapshot.data != null) {
                        final data = snapshot.data!.pasien ?? [];
                        return Column(
                          children: AnimationConfiguration.toStaggeredList(
                              duration: const Duration(milliseconds: 475),
                              childAnimationBuilder: (widget) => SlideAnimation(
                                    child: FadeInAnimation(
                                      child: widget,
                                    ),
                                  ),
                              children: data
                                  .map((e) => ListViewPasien(pasien: e))
                                  .toList()),
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
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
