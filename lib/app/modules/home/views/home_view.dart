import 'dart:async';
import 'dart:math';

import 'package:a_dokter_register/app/data/componen/publics.dart';
import 'package:a_dokter_register/app/modules/antrian_pasien/views/componen/listview_tindakan.dart';
import 'package:a_dokter_register/app/modules/pendapatan_dokter/views/pendapatan_dokter_view.dart';
import 'package:a_dokter_register/app/modules/profile/views/componnen/card_setting_dokter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '../../../data/componen/fetch_data.dart';
import '../../../routes/app_pages.dart';
import '../../loading_summer/loading.home.dart';
import '../../loading_summer/loading_profile_home.dart';
import '../../profile/views/profile_view.dart';
import '../../medical_record/views/tindakan_view.dart';
import '../controllers/home_controller.dart';
import 'componen/menu.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Obx(() {
        return BottomAppBar(
          notchMargin: 5.0,
          shape: const CircularNotchedRectangle(),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: GestureDetector(
                  onTap: () {
                    controller.currentIndex.value = 0;
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.home,
                          color: controller.currentIndex.value != 0
                              ? Colors.grey
                              : Colors.blue),
                      const Text(
                        "Home",
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: GestureDetector(
                  onTap: () {
                    controller.currentIndex.value = 1;
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.add_chart_rounded,
                        color: controller.currentIndex.value != 1
                            ? Colors.grey
                            : Colors.blue,
                      ),
                      const Text(
                        "Kasir",
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only( top: 10.0, bottom: 10.0),
                child: GestureDetector(
                  onTap: () {
                    controller.currentIndex.value = 2;
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.people_outline_rounded,
                          color: controller.currentIndex.value != 2
                              ? Colors.grey
                              : Colors.blue),
                      const Text(
                        "Pasien",
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: GestureDetector(
                  onTap: () {
                    controller.currentIndex.value = 3;
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.settings,
                          color: controller.currentIndex.value != 3
                              ? Colors.grey
                              : Colors.blue),
                      const Text(
                        "Setting",
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
      body: Obx(() {
        return controller.currentIndex.value == 0
            ? const Home()
            : controller.currentIndex.value == 1
                ? const PendapatanDokterView()
                : controller.currentIndex.value == 2
                    ? const TindakanView()
                    : const ProfileView();
      }),
    );
  }

  Widget buildSheet() {
    return Container(
        height: 330,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.white,
        ),
        child: Column(children: [
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
          // const Padding(
          //   padding: EdgeInsets.only(left: 15),
          //   child: Text("Tambah",
          //       style: TextStyle(
          //           fontWeight: FontWeight.bold,
          //           fontSize: 16,
          //           color: Colors.blue)),
          // ),
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
                          InkWell(
                            onTap: () {
                              Get.back();
                              Get.toNamed(Routes.JADWAL_DOKTER);
                            },
                            // onTap: () => Get.toNamed(Routes.JADWAL_DOKTER),
                            child: Container(
                              width: 305,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/timetable.png',
                                        width: 60,
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      const Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Atur Jadwal Dokter",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "Menambahkan jadwal praktik dokter",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              Get.back();
                              Get.toNamed(Routes.REGISTRASI_PASIEN);
                            },
                            child: Container(
                              width: 305,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/pasienbaru.png',
                                        width: 60,
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      const Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Tambah Pasien Baru",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "Menambahkan Pasien baru ke daftar antrian",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10),
                                          )
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              Get.back();
                              Get.toNamed(Routes.TAMBAH_PASIEN_LAMA);
                            },
                            child: Container(
                              width: 305,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/pasienlama.png',
                                        width: 60,
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      const Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Registrasi Pasien Lama",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "Membuat Antrian/priksa ulang untuk pasien lama",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10),
                                          )
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ))))
        ]));
  }
}

class Home extends StatefulWidget {
  const Home({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
  GlobalKey<LiquidPullToRefreshState>();

  static int refreshNum = 10; // number that changes when refreshed
  Stream<int> counterStream =
  Stream<int>.periodic(const Duration(seconds: 30), (x) => refreshNum);
  ScrollController? _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }
  Future<void> _handleRefresh() {
    final Completer<void> completer = Completer<void>();
    Timer(const Duration(seconds: 3), () {
      completer.complete();
    });
    setState(() {
      refreshNum = Random().nextInt(100);
    });
    return completer.future.then<void>((_) {
      ScaffoldMessenger.of(_scaffoldKey.currentState!.context).showSnackBar(
        SnackBar(
          content: const Text('Refresh complete'),
          action: SnackBarAction(
            label: 'RETRY',
            onPressed: () {
              _refreshIndicatorKey.currentState!.show();
            },
          ),
        ),
      );
    });
  }
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      key: _scaffoldKey,
      body: LiquidPullToRefresh(
        key: _refreshIndicatorKey,
        onRefresh: _handleRefresh,
        showChildOpacityTransition: false,
        child: StreamBuilder<int>(
        stream: counterStream,
        builder: (context, snapshot) {
          return
            CustomScrollView(
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
                            snapshot.connectionState !=
                                ConnectionState.waiting &&
                            snapshot.data != null) {
                          final data = snapshot.data!.dokter![0];
                          return CardDokterSetting(dokter: data);
                        } else {
                          return const Center(
                            child: shimmerProfile(),
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
                        childAnimationBuilder: (widget) =>
                            SlideAnimation(
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
                          // BarChartSample2()
                          Padding(
                            padding: const EdgeInsets.only(right: 10, left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Expanded(
                                      child: Text(
                                        "Antrian Pasien",
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
                                Padding(
                                  padding: EdgeInsets.only(right: 10, left: 0),
                                  child: Text(
                                    "Daftar Pasien Baru-baru ini, yang langsung dapat di tangani",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10),
                                  ),),
                                const SizedBox(
                                  height: 10,
                                ),
                                FutureBuilder(
                                  future: API.getAntrianPasien(
                                      tanggal: DateFormat('yyyy-MM-dd')
                                          .format(DateTime.now()),
                                      kode_dokter: Publics.controller
                                          .getDataRegist
                                          .value.kode ??
                                          ''),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData &&
                                        snapshot.connectionState !=
                                            ConnectionState.waiting &&
                                        snapshot.data != null) {
                                      final data = snapshot.data!.antrian ?? [];
                                      return data.isEmpty
                                          ? Center(
                                        child: Column(children: [
                                          const Text(
                                              'Tidak ada Antrian Saat ini'),
                                          Image.asset(
                                            'assets/images/noantri.png',
                                            height: 200,
                                          ),
                                        ]),
                                      )
                                          : Column(
                                        children: data
                                            .map((e) =>
                                            ListViewTindakan(antrian: e))
                                            .toList(),
                                      );
                                    } else {
                                      return const SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            shimmerHome(),
                                            shimmerHome(),
                                            shimmerHome(),
                                            shimmerHome(),
                                            shimmerHome(),
                                            shimmerHome(),
                                          ],
                                        ),
                                      );
                                    }
                                  },
                                ),
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
          );
        }),
      ),
        ),
    );
  }
}
