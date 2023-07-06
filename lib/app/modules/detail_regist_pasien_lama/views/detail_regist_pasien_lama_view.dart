import 'package:a_dokter_register/app/data/componen/fetch_data.dart';
import 'package:a_dokter_register/app/modules/detail_regist_pasien_lama/views/componen/form_asuransi_perusahaan.dart';
import 'package:a_dokter_register/app/modules/detail_regist_pasien_lama/views/componen/form_bpjs.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:get/get.dart';

import '../../../data/model/get_detail_mr.dart';
import '../../../data/model/get_detail_pasien.dart';
import '../controllers/detail_regist_pasien_lama_controller.dart';
import 'componen/card_profile_pasien.dart';
import 'componen/form_pasien_lama.dart';

class DetailRegistPasienLamaView extends StatefulWidget {
  const DetailRegistPasienLamaView({super.key});

  @override
  State<DetailRegistPasienLamaView> createState() =>
      _DetailRegistPasienLamaViewState();
}

class _DetailRegistPasienLamaViewState
    extends State<DetailRegistPasienLamaView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFe0e0e0).withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 10,
              offset: const Offset(2, 1),
            ),
          ],
        ),
        height: 75,
        margin: EdgeInsets.symmetric(vertical: 2, horizontal: 0),
        child: Row(
          children: <Widget>[
            Container(
              width: 230,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text("Pastikan Data Pasien Sudah Benar Sebelum Di Daftarkan",
                          style: TextStyle(color: Colors.black))),
                ],
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: ()  {
                  showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    builder: (context) => buildSheetberhasil(),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(
                      right: 15, left: 15, top: 10, bottom: 10),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.white12,
                        offset: Offset(2, 1),
                        blurRadius: 1,
                        spreadRadius: 2,
                      )
                    ],
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Color(0xff4babe7), Color(0xff4babe7)],
                    ),
                  ),
                  child: Text(
                    "Kirim",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
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
            title: const Text("Data Pasien Lama",
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
              SizedBox(
                height: 10,
              ),
              ProfileLama(),
              SizedBox(
                height: 5,
              ),
              // VitalSignPasienLama(),
              // FormPasienLama(),
              FormRegisPasienLama(),
              // FormPasienLama()
              SizedBox(
                height: 10,
              ),
              // AuransiPerusahaan1(),
              // SizedBox(
              //   height: 10,
              // ),
              // FormBPJS(),
              // SizedBox(
              //   height: 40,
              // ),
            ]),
          ),
        ],
      ),
    );
  }
  Widget buildSheetGagal() {
    return Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.transparent,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 4,
              margin: EdgeInsets.only(
                right: Get.width / 2 - 40,
                left: Get.width / 2 - 40,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFe0e0e0),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text("Gagal Mendaftarkan Pasien",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.redAccent)),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: AnimationConfiguration.toStaggeredList(
                    duration: const Duration(milliseconds: 275),
                    childAnimationBuilder: (widget) => SlideAnimation(
                      child: FadeInAnimation(
                        child: widget,
                      ),
                    ),
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: 20, left: 20, top: 20),
                        child : Center(
                          child: Text('Periksa Kembali Data yang di inputkan apakah sudah sesuai atau belum ada yang di inputkan',
                            textAlign: TextAlign.center,
                            style: TextStyle(),
                          ),),),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            // InkWell(
            //   child: Container(
            //     height: 45,
            //     width: 145,
            //     decoration: BoxDecoration(
            //       color: Colors.greenAccent,
            //       borderRadius: BorderRadius.circular(10),
            //     ),
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: const [
            //         Text(
            //           "Lihat Antrian",
            //           style: TextStyle(
            //               color: Colors.white,
            //               fontWeight: FontWeight.bold,
            //               fontSize: 14),
            //         )
            //       ],
            //     ),
            //   ),
            // ),
            const SizedBox(
              height: 10,
            ),
          ],
        ));
  }
  Widget buildSheetberhasil() {
    return Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.transparent,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 4,
              margin: EdgeInsets.only(
                right: Get.width / 2 - 40,
                left: Get.width / 2 - 40,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFe0e0e0),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text("Berhasil Mendaftarkan Pasien",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.blue)),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: AnimationConfiguration.toStaggeredList(
                    duration: const Duration(milliseconds: 275),
                    childAnimationBuilder: (widget) => SlideAnimation(
                      child: FadeInAnimation(
                        child: widget,
                      ),
                    ),
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: 20, left: 20, top: 20),
                      child : Center(
                        child: Text('Lanjut untuk melakukan pemeriksaan pasien yang sudah di daftarkan',
                          textAlign: TextAlign.center,
                          style: TextStyle(),
                      ),),),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              child: Container(
                height: 45,
                width: 145,
                decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Lihat Antrian",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ));
  }
}
