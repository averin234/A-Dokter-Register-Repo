import 'package:a_dokter_register/app/data/componen/fetch_data.dart';
import 'package:a_dokter_register/app/data/componen/publics.dart';
import 'package:a_dokter_register/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../data/model/get_detail_pasien.dart';
import '../../loading_summer/loading_card_profile.dart';
import '../../loading_summer/loading_screen_animed.dart';
import '../controllers/detail_regist_pasien_lama_controller.dart';
import 'componen/card_profile_pasien.dart';
import 'componen/form_pasien_lama.dart';

class DetailRegistPasienLamaView
    extends GetView<DetailRegistPasienLamaController> {
  DetailRegistPasienLamaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).popUntil((route) => route.isFirst);
        return true;
      },
      child: Scaffold(
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color(0xFFe0e0e0).withOpacity(0.5),
                spreadRadius: 0,
                blurRadius: 10,
                offset: Offset(2, 1),
              ),
            ],
          ),
          height: 75,
          margin: EdgeInsets.symmetric(vertical: 2, horizontal: 0),
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 230,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                            "Pastikan Data Pasien Sudah Benar Sebelum Di Daftarkan",
                            style: TextStyle(color: Colors.black))),
                  ],
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () async {
                    Get.defaultDialog(
                      backgroundColor: Color(0x00e0e0e0),
                      content: Loading(),
                      title: '',
                      barrierDismissible: false,
                    );
                    final postAntrian = await API.postDaftarPx(
                      no_antrian: controller.antrianController.text,
                      kode_dokter:
                          Publics.controller.getDataRegist.value.kode ?? '',
                      jam_awal: controller.jadwalController.text,
                      no_mr: controller.noMr,
                      durasi: controller.durasiController.text,
                      nasabah: controller.nasabahController.text,
                      no_polis: controller.noPolisController.text,
                      no_bpjs: controller.noBPJSController.text,
                      yankes: controller.yankesController.text,
                      jadwal: DateFormat('yyyy-MM-dd').format(DateTime.now()),
                    );
                    Get.back();
                    if (postAntrian.code == 200) {
                      await showModalBottomSheet(
                        context: context,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        builder: (context) => buildSheetberhasil(),
                      );
                    } else {
                      await showModalBottomSheet(
                        context: context,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        builder: (context) => buildSheetGagal(),
                      );
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        right: 15, left: 15, top: 10, bottom: 10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
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
              leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_circle_left_rounded,
                    size: 40,
                  ),
                  color: Color.fromARGB(255, 192, 192, 192)),
              title: Text("Data Pasien Lama",
                  style: TextStyle(color: Colors.black)),
              // actions: [
              //   IconButton(
              //       onPressed: () {},
              //       icon: Icon(Icons.notifications_active),
              //       color: Colors.white),
              // ],
              bottom: AppBar(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(30),
                  ),
                ),
                toolbarHeight: 0,
                automaticallyImplyLeading: false,
                elevation: 0,
                // title: Container(
                //   padding:  EdgeInsets.all(0),
                //   margin:  EdgeInsets.only(top: 15),
                //   decoration:
                //       BoxDecoration(borderRadius: BorderRadius.circular(10)),
                //   child:  HorizontalCalendermr(),
                // ),
              ),
            ),
            // Other Sliver Widgets
            SliverList(
              delegate: SliverChildListDelegate([
                SizedBox(
                  height: 10,
                ),
                FutureBuilder(
                    future: API.getDetailPasien(no_mr: controller.noMr),
                    builder: (context, snapshot) {
                      if (snapshot.hasData &&
                          snapshot.connectionState != ConnectionState.waiting &&
                          snapshot.data != null) {
                        final data = snapshot.data!.pasien ?? Pasien();
                        return ProfilePasienLama(pasien: data);
                      } else {
                        return Column(
                          children: [
                            shimmerCardProfile(),
                          ],
                        );
                      }
                    }),
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
            SizedBox(
              height: 10,
            ),
            Container(
              height: 4,
              margin: EdgeInsets.only(
                right: Get.width / 2 - 40,
                left: Get.width / 2 - 40,
              ),
              decoration: BoxDecoration(
                color: Color(0xFFe0e0e0),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text("Gagal Mendaftarkan Pasien",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.redAccent)),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: AnimationConfiguration.toStaggeredList(
                    duration: Duration(milliseconds: 275),
                    childAnimationBuilder: (widget) => SlideAnimation(
                      child: FadeInAnimation(
                        child: widget,
                      ),
                    ),
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: 20, left: 20, top: 20),
                        child: Center(
                          child: Text(
                            'Periksa Kembali Data yang di inputkan apakah sudah sesuai atau belum ada yang di inputkan',
                            textAlign: TextAlign.center,
                            style: TextStyle(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
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
            //       children:  [
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
            SizedBox(
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
            SizedBox(
              height: 10,
            ),
            Container(
              height: 4,
              margin: EdgeInsets.only(
                right: Get.width / 2 - 40,
                left: Get.width / 2 - 40,
              ),
              decoration: BoxDecoration(
                color: Color(0xFFe0e0e0),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text("Berhasil Mendaftarkan Pasien",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.blue)),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: AnimationConfiguration.toStaggeredList(
                    duration: Duration(milliseconds: 275),
                    childAnimationBuilder: (widget) => SlideAnimation(
                      child: FadeInAnimation(
                        child: widget,
                      ),
                    ),
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: 20, left: 20, top: 20),
                        child: Center(
                          child: Text(
                            'Lanjut untuk melakukan pemeriksaan pasien yang sudah di daftarkan',
                            textAlign: TextAlign.center,
                            style: TextStyle(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () => Get.toNamed(Routes.ANTRIAN_PASIEN),
              child: Container(
                height: 45,
                width: 145,
                decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
            SizedBox(
              height: 10,
            ),
          ],
        ));
  }
}
