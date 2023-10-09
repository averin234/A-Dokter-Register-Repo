import 'dart:async';
import 'dart:math';
import 'package:a_dokter_register/app/data/componen/publics.dart';
import 'package:a_dokter_register/app/modules/medical_record/views/componen/cari_pasien.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../data/componen/fetch_data.dart';
import '../../loading_summer/loading_listpasien.dart';
import '../controllers/tindakan_controller.dart';
import 'componen/listview_tindakan.dart';

class TindakanView extends StatefulWidget {
  TindakanView({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _TindakanViewState createState() => _TindakanViewState();
}

class _TindakanViewState extends State<TindakanView> {
  // this enable our app to able to pull down
  late RefreshController _refreshController; // the refresh controller
  var _scaffoldKey =
      GlobalKey<ScaffoldState>(); // this is our key to the scaffold widget
  @override
  void initState() {
    _refreshController =
        RefreshController(); // we have to use initState because this part of the app have to restart
    super.initState();
  }
  final updateController = Get.put(TindakanController());
  late final String currentVersion;

  final controller = Get.put(TindakanController());
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
                automaticallyImplyLeading: false,
                title: Text('List Pasien'),
                bottom: AppBar(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(30),
                    ),
                  ),
                  toolbarHeight: 50,
                  title: Column(
                    children: [
                      CariPasien(),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                  automaticallyImplyLeading: false,
                  elevation: 0,
                ),
              ),
              // Other Sliver Widgets
              SliverList(
                delegate: SliverChildListDelegate([
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: FutureBuilder(
                        future: API.getPasienBy(
                            kode_dokter:
                                Publics.controller.getDataRegist.value.kode ??
                                    ''),
                        builder: (context, snapshot) {
                          if (snapshot.hasData &&
                              snapshot.connectionState !=
                                  ConnectionState.waiting &&
                              snapshot.data != null) {
                            final data = snapshot.data!.pasien ?? [];
                            return data.isEmpty
                                ? Center(
                                    child: Column(
                                      children: [
                                        Text('Belum Ada Pasien yang diperiksa'),
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
                                                Duration(milliseconds: 475),
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
                            return SingleChildScrollView(
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
      TindakanView(); // if you only want to refresh the list you can place this, so the two can be inside setState
      _refreshController
          .refreshCompleted(); // request complete,the header will enter complete state,
// resetFooterState : it will set the footer state from noData to idle
    });
  }
}
