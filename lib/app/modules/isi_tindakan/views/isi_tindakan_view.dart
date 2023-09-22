import 'dart:async';
import 'dart:math';

import 'package:a_dokter_register/app/data/componen/fetch_data.dart';
import 'package:a_dokter_register/app/modules/isi_tindakan/controllers/isi_tindakan_controller.dart';
import 'package:a_dokter_register/app/modules/isi_tindakan/views/componen/form_isi_tindakan.dart';
import 'package:a_dokter_register/app/modules/isi_tindakan/views/componen/hasil_tindakan.dart';
import 'package:a_dokter_register/app/modules/isi_tindakan/views/componen/nama_pemeriksa.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class IsiTindakanView extends StatefulWidget {
  IsiTindakanView({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _IsiTindakanViewState createState() => _IsiTindakanViewState();
}

class _IsiTindakanViewState extends State<IsiTindakanView> {
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

  final controller = Get.put(IsiTindakanController());
  @override
  Widget build(BuildContext context) {
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
                leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_circle_left_rounded,
                    size: 40,
                  ),
                  color: Color.fromARGB(255, 192, 192, 192),
                ),
                title:
                    Text("Isi Tindakan", style: TextStyle(color: Colors.black)),
                bottom: AppBar(
                  toolbarHeight: 0,
                  automaticallyImplyLeading: false,
                  elevation: 0,
                ),
              ),
              // Other Sliver Widgets
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Column(
                      children: AnimationConfiguration.toStaggeredList(
                        duration: Duration(milliseconds: 375),
                        childAnimationBuilder: (widget) => ScaleAnimation(
                          child: SlideAnimation(
                            child: widget,
                          ),
                        ),
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          NamaPemeriksa(),
                          SizedBox(
                            height: 10,
                          ),
                          FormIsiTindakan(),
                          SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text('Hasil Tindakan',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          FutureBuilder(
                              future: API.getDetailMR(
                                  no_registrasi: controller.noRegistrasi),
                              builder: (context, snapshot) {
                                if (snapshot.hasData &&
                                    snapshot.connectionState !=
                                        ConnectionState.waiting &&
                                    snapshot.data != null) {
                                  final data = snapshot.data!.tindakan ?? [];
                                  return data.isEmpty
                                      ? Text('Tidak Ada Tindakan')
                                      : Column(
                                          children: AnimationConfiguration
                                              .toStaggeredList(
                                                  duration: Duration(
                                                      milliseconds: 475),
                                                  childAnimationBuilder:
                                                      (widget) =>
                                                          SlideAnimation(
                                                            child:
                                                                FadeInAnimation(
                                                              child: widget,
                                                            ),
                                                          ),
                                                  children: data
                                                      .map((e) => HasilTindakan(
                                                          tindakan: e))
                                                      .toList()),
                                        );
                                } else {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              }),
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
      IsiTindakanView(); // if you only want to refresh the list you can place this, so the two can be inside setState
      _refreshController
          .refreshCompleted(); // request complete,the header will enter complete state,
// resetFooterState : it will set the footer state from noData to idle
    });
  }
}
