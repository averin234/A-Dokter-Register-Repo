import 'dart:async';
import 'dart:math';

import 'package:a_dokter_register/app/data/componen/publics.dart';
import 'package:a_dokter_register/app/modules/antrian_pasien/views/componen/listview_tindakan.dart';
import 'package:a_dokter_register/app/modules/pendapatan_dokter/views/pendapatan_dokter_view.dart';
import 'package:a_dokter_register/app/modules/profile/views/componnen/card_setting_dokter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:get/get.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:intl/intl.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../data/componen/fetch_data.dart';
import '../../../routes/app_pages.dart';
import '../../loading_summer/loading.home.dart';
import '../../loading_summer/loading_profile_home.dart';
import '../../profile/views/profile_view.dart';
import '../../medical_record/views/tindakan_view.dart';
import '../controllers/home_controller.dart';
import 'componen/menu.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Obx(() {
        return BottomAppBar(
          notchMargin: 5.0,
          shape: CircularNotchedRectangle(),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.0),
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
                      Text(
                        "Home",
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
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
                      Text(
                        "Kasir",
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
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
                      Text(
                        "Pasien",
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10.0),
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
                      Text(
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
            ? Home()
            : controller.currentIndex.value == 1
                ? PendapatanDokterView()
                : controller.currentIndex.value == 2
                    ? TindakanView()
                    : ProfileView();
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
          //  Padding(
          //   padding: EdgeInsets.only(left: 15),
          //   child: Text("Tambah",
          //       style: TextStyle(
          //           fontWeight: FontWeight.bold,
          //           fontSize: 16,
          //           color: Colors.blue)),
          // ),
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
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Column(
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
                          SizedBox(
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
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Column(
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
                          SizedBox(
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
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Column(
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
  Home({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // this enable our app to able to pull down
  final updateController = Get.put(HomeController());
  late final String currentVersion;
  AppUpdateInfo? _updateInfo;

  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  bool _flexibleUpdateAvailable = false;

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> checkForUpdate() async {
    InAppUpdate.checkForUpdate().then((info) {
      setState(() {
        _updateInfo = info;
      });
    }).catchError((e) {
      showSnack(e.toString());
    });
  }

  void showSnack(String text) {
    if (_scaffoldKey.currentContext != null) {
      ScaffoldMessenger.of(_scaffoldKey.currentContext!)
          .showSnackBar(SnackBar(content: Text(text)));
    }
  }

  late RefreshController
      _refreshController; // this is our key to the scaffold widget
  @override
  void initState() {
    _refreshController =
        RefreshController(); // we have to use initState because this part of the app have to restart
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    updateController.checkForUpdate();
    return SafeArea(
      child: Scaffold(
        body: SmartRefresher(
          controller: _refreshController,
          enablePullDown: true,
          header: WaterDropHeader(),
          onLoading: _onLoading,
          onRefresh: _onRefresh,
          child: CustomScrollView(
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
                  title: FutureBuilder(
                      future: API.getDetailDokter(
                          kode_dokter:
                              Publics.controller.getDataRegist.value.kode ??
                                  ''),
                      builder: (context, snapshot) {
                        if (snapshot.hasData &&
                            snapshot.connectionState !=
                                ConnectionState.waiting &&
                            snapshot.data != null) {
                          final data = snapshot.data!.dokter![0];
                          return CardDokterSetting(dokter: data);
                        } else {
                          return Center(
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
                        duration: Duration(milliseconds: 375),
                        childAnimationBuilder: (widget) => SlideAnimation(
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
                          // BarChartSample2()
                          Padding(
                            padding: EdgeInsets.only(right: 10, left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Antrian Pasien",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                    ),
                                    SizedBox(
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
                                    SizedBox(
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
                                  ),
                                ),
                                SizedBox(
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
                                          ? Center(
                                              child: Column(children: [
                                                Text(
                                                    'Tidak ada Antrian Saat ini'),
                                                Image.asset(
                                                  'assets/images/noantri.png',
                                                  height: 200,
                                                ),
                                              ]),
                                            )
                                          : Column(
                                              children: data
                                                  .map((e) => ListViewTindakan(
                                                      antrian: e))
                                                  .toList(),
                                            );
                                    } else {
                                      return SingleChildScrollView(
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
                                SizedBox(
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
        ),
      ),
    );
  }

  _onLoading() {
    _refreshController
        .loadComplete(); // after data returned,set the //footer state to idle
  }

  _onRefresh() {
    setState(() {
// so whatever you want to refresh it must be inside the setState
      Home(); // if you only want to refresh the list you can place this, so the two can be inside setState
      _refreshController
          .refreshCompleted(); // request complete,the header will enter complete state,
// resetFooterState : it will set the footer state from noData to idle
    });
  }
}
