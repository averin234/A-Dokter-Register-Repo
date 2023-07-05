import 'package:a_dokter_register/app/data/componen/fetch_data.dart';
import 'package:a_dokter_register/app/data/componen/publics.dart';
import 'package:a_dokter_register/app/modules/antrian_pasien/views/componen/search_medical_record.dart';
import 'package:a_dokter_register/app/modules/medical_record/views/componen/listview_tindakan.dart';
import 'package:a_dokter_register/app/modules/tambah_pasien_lama/views/componen/listview_pasien_lama.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:get/get.dart';

import '../controllers/tambah_pasien_lama_controller.dart';

class TambahPasienLamaView extends GetView<TambahPasienLamaController> {
  const TambahPasienLamaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
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
            automaticallyImplyLeading: false,
            title: Text('Daftar Pasien'),
            bottom: AppBar(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
              ),
              toolbarHeight: 50,
              automaticallyImplyLeading: false,
              elevation: 0,
              title: Column(
                children: [
                  SearchTindakanDokter(),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
          // Other Sliver Widgets
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(
                height: 10,
              ),
              FutureBuilder(
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
                                .map((e) => ListViewPasienLama(pasien: e))
                                .toList()),
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
