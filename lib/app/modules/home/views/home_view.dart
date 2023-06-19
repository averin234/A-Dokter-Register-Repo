import 'package:a_dokter_register/app/modules/antrian_pasien/views/antrian_pasien_view.dart';
import 'package:a_dokter_register/app/modules/antrian_pasien/views/componen/listview_tindakan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../routes/app_pages.dart';
import '../../profile/views/profile_view.dart';
import '../../medical_record/views/tindakan_view.dart';
import '../controllers/home_controller.dart';
import 'componen/appointment_dokter.dart';
import 'componen/card_indetitas_dokter.dart';
import 'componen/card_pendapatan.dart';
import 'componen/chart.dart';
import 'componen/menu.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.white,
          currentIndex: controller.currentIndex.value,
          onTap: (value) => controller.currentIndex.value = value,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people_alt_rounded),
              label: 'Pasien',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.medical_information_rounded),
              label: 'Medical Record',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_box_outlined),
              label: 'Profile',
            ),
          ],
        );
      }),
      body: Obx(() {
        return controller.currentIndex.value == 0
            ? Home(controller: controller)
            : controller.currentIndex.value == 1
                ? const AntrianPasienView()
                : controller.currentIndex.value == 2
                    ? const TindakanView()
                    : const ProfileView();
      }),
    );
  }
}

class Home extends StatelessWidget {
  const Home({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 0,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.white, // <-- SEE HERE
              statusBarIconBrightness:
                  Brightness.dark, //<-- For Android SEE HERE (dark icons)
              statusBarBrightness:
                  Brightness.light, //<-- For iOS SEE HERE (dark icons)
            ),
            stretch: false,
            brightness: Brightness.dark,
            backgroundColor: Colors.white,
            floating: true,
            pinned: true,
            automaticallyImplyLeading: false,
            snap: true,
            actions: [],
            bottom: AppBar(
              toolbarHeight: 100,
              automaticallyImplyLeading: false,
              elevation: 0,
              backgroundColor: Colors.white,
              title: CardDokter(),
            ),
          ),
          // Other Sliver Widgets
          SliverList(
            delegate: SliverChildListDelegate([
              Column(
                  children: AnimationConfiguration.toStaggeredList(
                duration: const Duration(milliseconds: 375),
                childAnimationBuilder: (widget) => ScaleAnimation(
                  child: FadeInAnimation(
                    child: widget,
                  ),
                ),
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  MenuHome(),
                  SizedBox(),
                  Padding(
                    padding: EdgeInsets.only(right: 10, left: 10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Pendapatan Mingguan",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.PENDAPATAN_DOKTER);
                                },
                                child: Text(
                                  "Lihat Semua",
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: Colors.blue),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  BarChartSample2(),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10, left: 10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Daftar Online",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.ANTRIAN_PASIEN);
                                },
                                child: Text(
                                  "Lihat Semua",
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: Colors.blue),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListViewTindakan(),
                  SizedBox(
                    height: 10,
                  ),
                ],
              )),
            ]),
          ),
        ],
      ),
    );
  }
}
