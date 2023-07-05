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
}
