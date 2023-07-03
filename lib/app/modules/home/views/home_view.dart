import 'package:a_dokter_register/app/data/componen/publics.dart';
import 'package:a_dokter_register/app/modules/antrian_pasien/views/antrian_pasien_view.dart';
import 'package:a_dokter_register/app/modules/antrian_pasien/views/componen/listview_tindakan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../data/componen/fetch_data.dart';
import '../../../routes/app_pages.dart';
import '../../profile/views/profile_view.dart';
import '../../medical_record/views/tindakan_view.dart';
import '../controllers/home_controller.dart';
import 'componen/card_indetitas_dokter.dart';
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
          items: const <BottomNavigationBarItem>[
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
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.white, // <-- SEE HERE
              statusBarIconBrightness:
                  Brightness.dark, //<-- For Android SEE HERE (dark icons)
              statusBarBrightness:
                  Brightness.light, //<-- For iOS SEE HERE (dark icons)
            ),
            stretch: false,
            backgroundColor: Colors.white,
            floating: true,
            pinned: true,
            automaticallyImplyLeading: false,
            snap: true,
            actions: const [],
            bottom: AppBar(
              toolbarHeight: 100,
              automaticallyImplyLeading: false,
              elevation: 0,
              backgroundColor: Colors.white,
              title: FutureBuilder(
                  future: API.getDetailDokter(
                      kode_dokter:
                          Publics.controller.getDataRegist.value.kode ?? ''),
                  builder: (context, snapshot) {
                    if (snapshot.hasData &&
                        snapshot.connectionState != ConnectionState.waiting &&
                        snapshot.data != null) {
                      final data = snapshot.data!.dokter![0];
                      return CardDokter(dokter: data);
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
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
                      child: FadeInAnimation(
                        child: widget,
                      ),
                    ),
                    children: <Widget>[
                      const SizedBox(
                        height: 10,
                      ),
                      const MenuHome(),
                      const SizedBox(),
                      Padding(
                        padding: const EdgeInsets.only(right: 10, left: 10),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Expanded(
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
                                    child: const Text(
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
                      const SizedBox(
                        height: 10,
                      ),
                      BarChartSample2(),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10, left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Expanded(
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
                                  child: const Text(
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
                            const SizedBox(
                              height: 10,
                            ),
                            FutureBuilder(
                                future: API.getAntrianPasien(
                                    tanggal: DateFormat('yyyy-MM-dd')
                                        .format(DateTime.now()),
                                    kode_dokter: Publics.controller
                                            .getDataRegist.value.kode ??
                                        ''),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData &&
                                      snapshot.connectionState !=
                                          ConnectionState.waiting &&
                                      snapshot.data != null) {
                                    final data = snapshot.data!.antrian ?? [];
                                    return data.isEmpty
                                        ? Text(snapshot.data!.msg ?? '')
                                        : ListViewTindakan(antrian: data[0]);
                                  } else {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
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
