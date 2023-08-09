import 'dart:async';
import 'dart:math';

import 'package:a_dokter_register/app/data/componen/fetch_data.dart';
import 'package:a_dokter_register/app/data/componen/publics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '../../loading_summer/loading.pendapatan.dart';
import '../controllers/pendapatan_dokter_controller.dart';
import 'componen/tabel_pendapatan.dart';


class PendapatanDokterView extends StatefulWidget {
  const PendapatanDokterView({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _PendapatanDokterViewState createState() => _PendapatanDokterViewState();
}

class _PendapatanDokterViewState extends State<PendapatanDokterView> {
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
  final controller = Get.put(PendapatanDokterController());
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
        builder: (context, snapshot)
    {
      return CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
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
            title: const Text('Kasir'),
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
              // title: Column(
              //   children: const [
              //     SearchPendapatan1(),
              //     SizedBox(
              //       height: 10,
              //     ),
              //   ],
              // ),
              automaticallyImplyLeading: false,
              elevation: 0,
            ),
          ),
          // Other Sliver Widgets
          SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(
                height: 20,
              ),
              FutureBuilder(
                  future: API.getListKasir(
                      kode_dokter:
                      Publics.controller.getDataRegist.value.kode ?? ''),
                  builder: (context, snapshot) {
                    if (snapshot.hasData &&
                        snapshot.connectionState != ConnectionState.waiting &&
                        snapshot.data != null) {
                      final data = snapshot.data!.kasir ?? [];
                      return data.isEmpty
                          ? Center(
                        child: Column(
                          children: [
                            const Text('Belum Ada Teransaksi Saat ini'),
                            const SizedBox(
                              height: 10,
                            ),
                            Image.asset(
                              'assets/images/nopendapatan.png',
                              height: 300,
                            ),
                          ],
                        ),
                      )
                          : Column(
                        children: AnimationConfiguration.toStaggeredList(
                          duration: const Duration(milliseconds: 375),
                          childAnimationBuilder: (widget) =>
                              ScaleAnimation(
                                child: SlideAnimation(
                                  child: widget,
                                ),
                              ),
                          children: data
                              .map((e) =>
                          e.jamKeluar != null
                              ? Pendapatan(kasir: e)
                              : Container())
                              .toList(),
                        ),
                      );
                    } else {
                      return const SingleChildScrollView(
                        child: Column(
                          children: [
                            shimmerPendapatan(),
                            shimmerPendapatan(),
                            shimmerPendapatan(),
                            shimmerPendapatan(),
                            shimmerPendapatan(),
                            shimmerPendapatan(),
                          ],
                        ),
                      );
                    }
                  }),
            ]),
          ),
        ],
      );
  }
    ),
        ),
      ),
    );
  }
}
