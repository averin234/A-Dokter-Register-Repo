import 'package:a_dokter_register/app/data/componen/fetch_data.dart';
import 'package:a_dokter_register/app/data/componen/publics.dart';
import 'package:a_dokter_register/app/modules/medical_record/views/componen/search_medical_record.dart';
import 'package:a_dokter_register/app/modules/medical_record/views/componen/listview_tindakan.dart';
import 'package:a_dokter_register/app/modules/regist_pasien_lama/views/componen/listview_pasien_lama.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:get/get.dart';

import '../../detail_regist_pasien_lama/views/detail_regist_pasien_lama_view.dart';
import '../../loading_summer/loading_pasien_lama.dart';
import '../controllers/tambah_pasien_lama_controller.dart';

class TambahPasienLamaView extends GetView<TambahPasienLamaController> {
  TambahPasienLamaView({Key? key}) : super(key: key);
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
              icon: Icon(
                Icons.arrow_circle_left_rounded,
                size: 40,
              ),
              color: Color.fromARGB(255, 192, 192, 192),
            ),
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
            automaticallyImplyLeading: false,
            title: Text('Daftar Pasien Lama'),
            bottom: AppBar(
              shape: RoundedRectangleBorder(
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
              Container(
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                ),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                      "Cari/Pilih Pasien Lama yang sudah berkunjung sebelumnya untuk dapat di tangani kembali",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(right: 10, left: 10),
                child: Text(
                  "List Riwayat Pasien",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
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
                      return data.isEmpty
                          ? Center(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                      'Belum ada Pasien yg terdaftar sebagai Pasien Lama',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Image.asset(
                                    'assets/images/pasienlama.png',
                                    height: 200,
                                  ),
                                ],
                              ),
                            )
                          : Column(
                              children: AnimationConfiguration.toStaggeredList(
                                  duration: Duration(milliseconds: 475),
                                  childAnimationBuilder: (widget) =>
                                      SlideAnimation(
                                        child: FadeInAnimation(
                                          child: widget,
                                        ),
                                      ),
                                  children: data
                                      .map((e) => ListViewPasienLama(pasien: e))
                                      .toList()),
                            );
                    } else {
                      return Column(
                        children: [
                          shimmerPasienLama(),
                          shimmerPasienLama(),
                          shimmerPasienLama(),
                          shimmerPasienLama(),
                          shimmerPasienLama(),
                          shimmerPasienLama(),
                          shimmerPasienLama(),
                          shimmerPasienLama(),
                          shimmerPasienLama(),
                          shimmerPasienLama(),
                          shimmerPasienLama(),
                          shimmerPasienLama(),
                        ],
                      );
                    }
                  }),
              // DetailRegistPasienLamaView(),
            ]),
          ),
        ],
      ),
    );
  }
}
