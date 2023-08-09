import 'dart:async';
import 'dart:math';
import 'package:a_dokter_register/app/data/componen/publics.dart';
import 'package:a_dokter_register/app/modules/medical_record/views/componen/cari_pasien.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import '../../../data/componen/fetch_data.dart';
import '../../loading_summer/loading_listpasien.dart';
import '../controllers/tindakan_controller.dart';
import 'componen/listview_tindakan.dart';

class TindakanView extends StatefulWidget {
  const TindakanView({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _TindakanViewState createState() => _TindakanViewState();
}

class _TindakanViewState extends State<TindakanView> {
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
  final controller = Get.put(TindakanController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
      Scaffold(
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
            automaticallyImplyLeading: false,
            title: const Text('List Pasien'),
            actions: const [
              CariPasien(),
            ],
          ),
          // Other Sliver Widgets
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: FutureBuilder(
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
                              const Text(
                                  'Belum Ada Pasien yang diperiksa'),
                              Image.asset(
                                'assets/images/pasient.jpg',
                                height: 300,
                              ),
                            ],
                          ),
                        )
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
                                  ListViewPasien(pasien: e))
                                  .toList()),
                        );
                      } else {
                        return const SingleChildScrollView(
                          child: Column(
                            children: [
                              shimmerListPasien(),
                              shimmerListPasien(),
                              shimmerListPasien(),
                              shimmerListPasien(),
                              shimmerListPasien(),
                            ],
                          ),
                        );
                      }
                    }),
              ),
            ]),
          ),
        ],
      );
  }
    ),),),);
  }
}
