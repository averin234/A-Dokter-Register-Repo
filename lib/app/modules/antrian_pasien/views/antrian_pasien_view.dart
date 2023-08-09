import 'dart:async';
import 'dart:math';

import 'package:a_dokter_register/app/data/componen/fetch_data.dart';
import 'package:a_dokter_register/app/data/componen/publics.dart';
import 'package:a_dokter_register/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import '../../loading_summer/loading.home.dart';
import '../controllers/antrian_pasien_controller.dart';
import 'componen/horizontal_calender.dart';
import 'componen/listview_tindakan.dart';

class AntrianPasienView extends StatefulWidget {
  const AntrianPasienView({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _AntrianPasienViewState createState() => _AntrianPasienViewState();
}

class _AntrianPasienViewState extends State<AntrianPasienView> {
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
  final controller = Get.put(AntrianPasienController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: LiquidPullToRefresh(
        key: _refreshIndicatorKey,
        onRefresh: _handleRefresh,
        showChildOpacityTransition: false,
        child: StreamBuilder<int>(
        stream: counterStream,
        builder: (context, snapshot)
    {
      return CustomScrollView(
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
            title: const Text('Antrian Pasien'),
            leading: IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(
                  Icons.arrow_circle_left_rounded,
                  size: 40,
                ),
                color: const Color.fromARGB(255, 192, 192, 192)),
            bottom: AppBar(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
              ),
              toolbarHeight: 85,
              automaticallyImplyLeading: false,
              elevation: 0,
              title: const HorizontalCalender(),
            ),
          ),
          // Other Sliver Widgets
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                margin: const EdgeInsets.only(top: 10, right: 10, left: 10),
                padding: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: const Color(0xFFe0e0e0).withOpacity(0.5),
                  //     spreadRadius: 0,
                  //     blurRadius: 10,
                  //     offset: const Offset(2, 1),
                  //   ),
                  // ],
                ),
                child: Obx(() {
                  return FutureBuilder(
                      future: API.getAntrianPasien(
                          tanggal: controller.date.value,
                          kode_dokter:
                          Publics.controller.getDataRegist.value.kode ??
                              ''),
                      builder: (context, snapshot) {
                        if (snapshot.hasData &&
                            snapshot.connectionState !=
                                ConnectionState.waiting &&
                            snapshot.data != null) {
                          final data = snapshot.data!.antrian ?? [];
                          return data.isEmpty
                              ? Column(
                            children: [
                              Text('Tidak ada Antrian Pasien Hari ini'),
                              Image.asset(
                                'assets/images/noantri.png',
                                height: 200,
                              ),
                            ],)
                              : Column(
                            children:
                            AnimationConfiguration.toStaggeredList(
                                duration:
                                const Duration(milliseconds: 475),
                                childAnimationBuilder: (widget) =>
                                    SlideAnimation(
                                      child: FadeInAnimation(
                                        child: widget,
                                      ),
                                    ),
                                children: data
                                    .map((e) =>
                                    ListViewTindakan(antrian: e))
                                    .toList()),
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
                      });
                }),
              ),
            ]),
          ),
        ],
      );
    }),),
    );
  }
}
