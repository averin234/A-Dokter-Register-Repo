import 'dart:async';
import 'dart:math';

import 'package:a_dokter_register/app/data/componen/fetch_data.dart';
import 'package:a_dokter_register/app/data/model/get_detail_mr.dart';
import 'package:a_dokter_register/app/modules/detail_antrian/views/componen/surat.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import '../../../data/model/list_data.dart';
import '../../../routes/app_pages.dart';
import '../../bottomsheet/bottomsheet_pulang.dart';
import '../../loading_summer/loading.surat.dart';
import '../../loading_summer/loading_card_profile.dart';
import '../../loading_summer/loading_screen_animed.dart';
import '../../loading_summer/loading_soap.dart';
import '../../loading_summer/loading_vital_sign.dart';
import '../controllers/detail_tindakan_controller.dart';
import 'componen/planning.dart';
import 'componen/planning/resep.dart';
import 'componen/soap/soap.dart';
import 'componen/profile_pasien.dart';
import 'componen/text_field.dart';
import 'componen/vital_sign.dart';

class DetailTindakanView extends GetView<DetailTindakanController> {
  const DetailTindakanView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
        Scaffold(
      backgroundColor: Colors.white,
        bottomNavigationBar:
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFe0e0e0).withOpacity(0.5),
                spreadRadius: 0,
                blurRadius: 10,
                offset: const Offset(2, 1),
              ),
            ],
          ),
          height: 75,
          margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 0),
          child: Row(
            children: <Widget>[
              const SizedBox(
                width: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                            "Pastikan Pemeriksaan Pasien sudah benar ",
                            style: TextStyle(color: Colors.black))),
                  ],
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    bottomSheetPulang();
                  },
                  child:
                  Container(
                    margin: const EdgeInsets.only(
                        right: 15, left: 5, top: 10, bottom: 10),
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Colors.redAccent,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.white12,
                          offset: Offset(2, 1),
                          blurRadius: 1,
                          spreadRadius: 2,
                        )
                      ],
                    ),
                    child: const Text(
                      "Pulang",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      body: DetailMR(),
        ),
    );
  }
}

class DetailMR extends StatefulWidget {
  const DetailMR({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _DetailMRState createState() => _DetailMRState();
}

class _DetailMRState extends State<DetailMR> {
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
  final controller = Get.put(DetailTindakanController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  WillPopScope(
        onWillPop: () async {
      Navigator.of(context).popUntil((route) => route.isFirst);
      return true;
    },
        child : Scaffold(
        backgroundColor: Colors.white,
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
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_circle_left_rounded,
                size: 40,
              ),
              color: const Color.fromARGB(255, 192, 192, 192),
            ),
            title: const Text("SOAP", style: TextStyle(color: Colors.black)),
            bottom: AppBar(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
              ),
              toolbarHeight: 0,
              automaticallyImplyLeading: false,
              elevation: 0,
              backgroundColor: const Color.fromARGB(255, 35, 163, 223),
            ),
          ),
          // Other Sliver Widgets
          SliverList(
            delegate: SliverChildListDelegate([
              FutureBuilder(
                  future:
                  API.getDetailMR(no_registrasi: controller.noRegistrasi),
                  builder: (context, snapshot) {
                    if (snapshot.hasData &&
                        snapshot.connectionState != ConnectionState.waiting &&
                        snapshot.data != null) {
                      final data = snapshot.data!;
                      if (data.riwayatPemeriksaan != null) {
                        controller.analystController.text =
                            data.riwayatPemeriksaan!.analyst ?? '';
                        controller.subjectiveController.text =
                            data.riwayatPemeriksaan!.subyektive ?? '';
                        controller.objectiveController.text =
                            data.riwayatPemeriksaan!.objective ?? '';
                      }
                      return Column(
                        children: AnimationConfiguration.toStaggeredList(
                          duration: const Duration(milliseconds: 375),
                          childAnimationBuilder: (widget) =>
                              ScaleAnimation(
                                child: SlideAnimation(
                                  child: widget,
                                ),
                              ),
                          children: <Widget>[
                            const SizedBox(
                              height: 10,
                            ),
                            ProfilePasienTindakan(
                                pasien: data.pasien ?? Pasien()),
                            const SizedBox(
                              height: 10,
                            ),
                            data.vitalSign == null
                                ? ElevatedButton.icon(
                              onPressed: () {
                                showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    isDismissible: true,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20),
                                      ),
                                    ),
                                    builder: (BuildContext context) {
                                      return DraggableScrollableSheet(
                                          initialChildSize:
                                          0.95,
                                          //set this as you want
                                          maxChildSize:
                                          0.95,
                                          //set this as you want
                                          minChildSize:
                                          0.95,
                                          //set this as you want
                                          expand: true,
                                          builder: (context,
                                              scrollController) {
                                            return Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(50),
                                                  color:
                                                  Colors.transparent,
                                                ),
                                                child: Column(
                                                  children: [
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Container(
                                                      height: 4,
                                                      margin:
                                                      EdgeInsets.only(
                                                        right: Get.width /
                                                            2 -
                                                            40,
                                                        left: Get.width /
                                                            2 -
                                                            40,
                                                      ),
                                                      decoration:
                                                      BoxDecoration(
                                                        color: const Color(
                                                            0xFFe0e0e0),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            10),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 4,
                                                    ),
                                                    const Text(
                                                        'Geser Kebawah',
                                                        style: TextStyle(
                                                            fontWeight:
                                                            FontWeight
                                                                .bold,
                                                            color: Colors
                                                                .grey)),
                                                    const SizedBox(
                                                      height: 25,
                                                    ),
                                                    const Padding(
                                                      padding:
                                                      EdgeInsets.only(
                                                          left: 0),
                                                      child: Text(
                                                          "Tambah Vital Sign",
                                                          style: TextStyle(
                                                              fontWeight:
                                                              FontWeight
                                                                  .bold,
                                                              fontSize:
                                                              16,
                                                              color: Colors
                                                                  .blue)),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Expanded(
                                                      child:
                                                      SingleChildScrollView(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                          children:
                                                          AnimationConfiguration
                                                              .toStaggeredList(
                                                            duration: const Duration(
                                                                milliseconds:
                                                                275),
                                                            childAnimationBuilder:
                                                                (widget) =>
                                                                SlideAnimation(
                                                                  child:
                                                                  FadeInAnimation(
                                                                    child:
                                                                    widget,
                                                                  ),
                                                                ),
                                                            children: <Widget>[
                                                              const SizedBox(
                                                                height:
                                                                10,
                                                              ),
                                                              const Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                    left:
                                                                    15),
                                                                child: Text(
                                                                    "Keadaan Umum",
                                                                    style:
                                                                    TextStyle(
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                    )),
                                                              ),
                                                              const SizedBox(
                                                                height:
                                                                10,
                                                              ),
                                                              Container(
                                                                margin: const EdgeInsets
                                                                    .only(
                                                                    left:
                                                                    10,
                                                                    right:
                                                                    10),
                                                                child:
                                                                FutureBuilder(
                                                                  future:
                                                                  API
                                                                      .getkeadaanUmum(),
                                                                  builder:
                                                                      (context,
                                                                      snapshot) {
                                                                    if (snapshot
                                                                        .hasData &&
                                                                        snapshot
                                                                            .connectionState !=
                                                                            ConnectionState
                                                                                .waiting &&
                                                                        snapshot
                                                                            .data !=
                                                                            null) {
                                                                      final data =
                                                                          snapshot
                                                                              .data!
                                                                              .list ??
                                                                              [
                                                                              ];
                                                                      return data
                                                                          .isEmpty
                                                                          ? Text(
                                                                          snapshot
                                                                              .data!
                                                                              .msg ??
                                                                              '')
                                                                          : dropdown(
                                                                          'Keadaan Umum',
                                                                          data,
                                                                          controller
                                                                              .keadaanUmumController,
                                                                          controller
                                                                              .namaKeadaanUmumController);
                                                                    } else {
                                                                      return const Center(
                                                                        child: CircularProgressIndicator(),
                                                                      );
                                                                    }
                                                                  },
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                height:
                                                                10,
                                                              ),
                                                              const Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                    left:
                                                                    15),
                                                                child: Text(
                                                                    "Tekanan Darah",
                                                                    style:
                                                                    TextStyle(
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                    )),
                                                              ),
                                                              const SizedBox(
                                                                height:
                                                                10,
                                                              ),
                                                              Container(
                                                                margin: const EdgeInsets
                                                                    .only(
                                                                    left:
                                                                    10,
                                                                    right:
                                                                    10),
                                                                height:
                                                                50,
                                                                decoration:
                                                                BoxDecoration(
                                                                  color: const Color(
                                                                      0xfff3f3f3),
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      22),
                                                                ),
                                                                child:
                                                                TextField(
                                                                  controller:
                                                                  controller
                                                                      .tekananDarahController,
                                                                  decoration:
                                                                  const InputDecoration(
                                                                    border:
                                                                    InputBorder
                                                                        .none,
                                                                    focusedBorder:
                                                                    InputBorder
                                                                        .none,
                                                                    enabledBorder:
                                                                    InputBorder
                                                                        .none,
                                                                    errorBorder:
                                                                    InputBorder
                                                                        .none,
                                                                    disabledBorder:
                                                                    InputBorder
                                                                        .none,
                                                                    contentPadding: EdgeInsets
                                                                        .only(
                                                                        left: 15,
                                                                        bottom: 11,
                                                                        top: 13,
                                                                        right: 15),
                                                                    filled:
                                                                    true,
                                                                    fillColor:
                                                                    Colors
                                                                        .transparent,
                                                                  ),
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                height:
                                                                10,
                                                              ),
                                                              const Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                    left:
                                                                    15),
                                                                child: Text(
                                                                    "Suhu",
                                                                    style:
                                                                    TextStyle(
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                    )),
                                                              ),
                                                              const SizedBox(
                                                                height:
                                                                10,
                                                              ),
                                                              Container(
                                                                margin: const EdgeInsets
                                                                    .only(
                                                                    left:
                                                                    10,
                                                                    right:
                                                                    10),
                                                                height:
                                                                50,
                                                                decoration:
                                                                BoxDecoration(
                                                                  color: const Color(
                                                                      0xfff3f3f3),
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      22),
                                                                ),
                                                                child:
                                                                TextField(
                                                                  controller:
                                                                  controller
                                                                      .suhuController,
                                                                  decoration:
                                                                  const InputDecoration(
                                                                    border:
                                                                    InputBorder
                                                                        .none,
                                                                    focusedBorder:
                                                                    InputBorder
                                                                        .none,
                                                                    enabledBorder:
                                                                    InputBorder
                                                                        .none,
                                                                    errorBorder:
                                                                    InputBorder
                                                                        .none,
                                                                    disabledBorder:
                                                                    InputBorder
                                                                        .none,
                                                                    contentPadding: EdgeInsets
                                                                        .only(
                                                                        left: 15,
                                                                        bottom: 11,
                                                                        top: 13,
                                                                        right: 15),
                                                                    filled:
                                                                    true,
                                                                    fillColor:
                                                                    Colors
                                                                        .transparent,
                                                                  ),
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                height:
                                                                10,
                                                              ),
                                                              const Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                    left:
                                                                    15),
                                                                child: Text(
                                                                    "Tinggi Badan",
                                                                    style:
                                                                    TextStyle(
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                    )),
                                                              ),
                                                              const SizedBox(
                                                                height:
                                                                10,
                                                              ),
                                                              Container(
                                                                margin: const EdgeInsets
                                                                    .only(
                                                                    left:
                                                                    10,
                                                                    right:
                                                                    10),
                                                                height:
                                                                50,
                                                                decoration:
                                                                BoxDecoration(
                                                                  color: const Color(
                                                                      0xfff3f3f3),
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      22),
                                                                ),
                                                                child:
                                                                TextField(
                                                                  controller:
                                                                  controller
                                                                      .tinggiBadanController,
                                                                  decoration:
                                                                  const InputDecoration(
                                                                    border:
                                                                    InputBorder
                                                                        .none,
                                                                    focusedBorder:
                                                                    InputBorder
                                                                        .none,
                                                                    enabledBorder:
                                                                    InputBorder
                                                                        .none,
                                                                    errorBorder:
                                                                    InputBorder
                                                                        .none,
                                                                    disabledBorder:
                                                                    InputBorder
                                                                        .none,
                                                                    contentPadding: EdgeInsets
                                                                        .only(
                                                                        left: 15,
                                                                        bottom: 11,
                                                                        top: 13,
                                                                        right: 15),
                                                                    filled:
                                                                    true,
                                                                    fillColor:
                                                                    Colors
                                                                        .transparent,
                                                                  ),
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                height:
                                                                10,
                                                              ),
                                                              const Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                    left:
                                                                    15),
                                                                child: Text(
                                                                    "Kesadaran",
                                                                    style:
                                                                    TextStyle(
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                    )),
                                                              ),
                                                              const SizedBox(
                                                                height:
                                                                10,
                                                              ),
                                                              Container(
                                                                margin: const EdgeInsets
                                                                    .only(
                                                                    left:
                                                                    10,
                                                                    right:
                                                                    10),
                                                                child:
                                                                FutureBuilder(
                                                                  future:
                                                                  API
                                                                      .getKesadaranPasien(),
                                                                  builder:
                                                                      (context,
                                                                      snapshot) {
                                                                    if (snapshot
                                                                        .hasData &&
                                                                        snapshot
                                                                            .connectionState !=
                                                                            ConnectionState
                                                                                .waiting &&
                                                                        snapshot
                                                                            .data !=
                                                                            null) {
                                                                      final data =
                                                                          snapshot
                                                                              .data!
                                                                              .list ??
                                                                              [
                                                                              ];
                                                                      return data
                                                                          .isEmpty
                                                                          ? Text(
                                                                          snapshot
                                                                              .data!
                                                                              .msg ??
                                                                              '')
                                                                          : dropdown(
                                                                          'Kesadaran',
                                                                          data,
                                                                          controller
                                                                              .kesadaranController,
                                                                          controller
                                                                              .namaKesadaranController);
                                                                    } else {
                                                                      return const Center(
                                                                        child: CircularProgressIndicator(),
                                                                      );
                                                                    }
                                                                  },
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                height:
                                                                10,
                                                              ),
                                                              const Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                    left:
                                                                    15),
                                                                child: Text(
                                                                    "Nadi",
                                                                    style:
                                                                    TextStyle(
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                    )),
                                                              ),
                                                              const SizedBox(
                                                                height:
                                                                10,
                                                              ),
                                                              Container(
                                                                margin: const EdgeInsets
                                                                    .only(
                                                                    left:
                                                                    10,
                                                                    right:
                                                                    10),
                                                                height:
                                                                50,
                                                                decoration:
                                                                BoxDecoration(
                                                                  color: const Color(
                                                                      0xfff3f3f3),
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      22),
                                                                ),
                                                                child:
                                                                TextField(
                                                                  controller:
                                                                  controller
                                                                      .nadiController,
                                                                  decoration:
                                                                  const InputDecoration(
                                                                    border:
                                                                    InputBorder
                                                                        .none,
                                                                    focusedBorder:
                                                                    InputBorder
                                                                        .none,
                                                                    enabledBorder:
                                                                    InputBorder
                                                                        .none,
                                                                    errorBorder:
                                                                    InputBorder
                                                                        .none,
                                                                    disabledBorder:
                                                                    InputBorder
                                                                        .none,
                                                                    contentPadding: EdgeInsets
                                                                        .only(
                                                                        left: 15,
                                                                        bottom: 11,
                                                                        top: 13,
                                                                        right: 15),
                                                                    filled:
                                                                    true,
                                                                    fillColor:
                                                                    Colors
                                                                        .transparent,
                                                                  ),
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                height:
                                                                10,
                                                              ),
                                                              const Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                    left:
                                                                    15),
                                                                child: Text(
                                                                    "Pernafasan",
                                                                    style:
                                                                    TextStyle(
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                    )),
                                                              ),
                                                              const SizedBox(
                                                                height:
                                                                10,
                                                              ),
                                                              Container(
                                                                margin: const EdgeInsets
                                                                    .only(
                                                                    left:
                                                                    10,
                                                                    right:
                                                                    10),
                                                                height:
                                                                50,
                                                                decoration:
                                                                BoxDecoration(
                                                                  color: const Color(
                                                                      0xfff3f3f3),
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      22),
                                                                ),
                                                                child:
                                                                TextField(
                                                                  controller:
                                                                  controller
                                                                      .pernapasanController,
                                                                  decoration:
                                                                  const InputDecoration(
                                                                    border:
                                                                    InputBorder
                                                                        .none,
                                                                    focusedBorder:
                                                                    InputBorder
                                                                        .none,
                                                                    enabledBorder:
                                                                    InputBorder
                                                                        .none,
                                                                    errorBorder:
                                                                    InputBorder
                                                                        .none,
                                                                    disabledBorder:
                                                                    InputBorder
                                                                        .none,
                                                                    contentPadding: EdgeInsets
                                                                        .only(
                                                                        left: 15,
                                                                        bottom: 11,
                                                                        top: 13,
                                                                        right: 15),
                                                                    filled:
                                                                    true,
                                                                    fillColor:
                                                                    Colors
                                                                        .transparent,
                                                                  ),
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                height:
                                                                10,
                                                              ),
                                                              const Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                    left:
                                                                    15),
                                                                child: Text(
                                                                    "Berat Badan",
                                                                    style:
                                                                    TextStyle(
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                    )),
                                                              ),
                                                              const SizedBox(
                                                                height:
                                                                10,
                                                              ),
                                                              Container(
                                                                margin: const EdgeInsets
                                                                    .only(
                                                                    left:
                                                                    10,
                                                                    right:
                                                                    10),
                                                                height:
                                                                50,
                                                                decoration:
                                                                BoxDecoration(
                                                                  color: const Color(
                                                                      0xfff3f3f3),
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      22),
                                                                ),
                                                                child:
                                                                TextField(
                                                                  controller:
                                                                  controller
                                                                      .beratBadanController,
                                                                  decoration:
                                                                  const InputDecoration(
                                                                    border:
                                                                    InputBorder
                                                                        .none,
                                                                    focusedBorder:
                                                                    InputBorder
                                                                        .none,
                                                                    enabledBorder:
                                                                    InputBorder
                                                                        .none,
                                                                    errorBorder:
                                                                    InputBorder
                                                                        .none,
                                                                    disabledBorder:
                                                                    InputBorder
                                                                        .none,
                                                                    contentPadding: EdgeInsets
                                                                        .only(
                                                                        left: 15,
                                                                        bottom: 11,
                                                                        top: 13,
                                                                        right: 15),
                                                                    filled:
                                                                    true,
                                                                    fillColor:
                                                                    Colors
                                                                        .transparent,
                                                                  ),
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                height:
                                                                10,
                                                              ),
                                                              // const Padding(
                                                              //   padding: EdgeInsets.only(left: 15),
                                                              //   child: Text("Lingkar Perut",
                                                              //       style: TextStyle(
                                                              //         fontWeight: FontWeight.bold,
                                                              //       )),
                                                              // ),
                                                              // const SizedBox(
                                                              //   height: 10,
                                                              // ),
                                                              // Container(
                                                              //   margin: const EdgeInsets.only(left: 10, right: 10),
                                                              //   height: 50,
                                                              //   decoration: BoxDecoration(
                                                              //     color: const Color(0xfff3f3f3),
                                                              //     borderRadius: BorderRadius.circular(22),
                                                              //   ),
                                                              //   child: const TextField(
                                                              //     decoration: InputDecoration(
                                                              //       border: InputBorder.none,
                                                              //       focusedBorder: InputBorder.none,
                                                              //       enabledBorder: InputBorder.none,
                                                              //       errorBorder: InputBorder.none,
                                                              //       disabledBorder: InputBorder.none,
                                                              //       contentPadding: EdgeInsets.only(
                                                              //           left: 15, bottom: 11, top: 13, right: 15),
                                                              //       filled: true,
                                                              //       fillColor: Colors.transparent,
                                                              //     ),
                                                              //   ),
                                                              // ),
                                                              // const SizedBox(
                                                              //   height: 200,
                                                              // ),
                                                              const SizedBox(
                                                                height:
                                                                400,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    InkWell(
                                                      onTap: () async {
                                                        Get.defaultDialog(
                                                          backgroundColor:
                                                          const Color(
                                                              0x00e0e0e0),
                                                          content:
                                                          Loading(),
                                                          title: '',
                                                          barrierDismissible:
                                                          false,
                                                        );
                                                        final postVS = await API
                                                            .postVitalSign(
                                                            no_registrasi:
                                                            controller
                                                                .noRegistrasi,
                                                            keadaan_umum:
                                                            controller
                                                                .keadaanUmumController
                                                                .text,
                                                            kesadaran_pasien:
                                                            controller
                                                                .kesadaranController
                                                                .text,
                                                            tekanan_darah:
                                                            controller
                                                                .tekananDarahController
                                                                .text,
                                                            nadi: controller
                                                                .nadiController
                                                                .text,
                                                            suhu: controller
                                                                .suhuController
                                                                .text,
                                                            pernapasan:
                                                            controller
                                                                .pernapasanController
                                                                .text,
                                                            tinggi_badan:
                                                            controller
                                                                .tinggiBadanController
                                                                .text,
                                                            berat_badan:
                                                            controller
                                                                .beratBadanController
                                                                .text);
                                                        Get.back();
                                                        if (postVS.code !=
                                                            200) {} else {
                                                          Get.back();
                                                          showModalBottomSheet(
                                                            context:
                                                            context,
                                                            shape:
                                                            const RoundedRectangleBorder(
                                                              borderRadius:
                                                              BorderRadius
                                                                  .vertical(
                                                                top: Radius
                                                                    .circular(
                                                                    20),
                                                              ),
                                                            ),
                                                            builder:
                                                                (context) =>
                                                                buildSheet(),
                                                          );
                                                          // Get.defaultDialog(
                                                          //   title: (postVS.code ?? 0).toString(),
                                                          //   content: Text(postVS.msg ?? ''),
                                                          // );
                                                        }
                                                      },
                                                      child: Container(
                                                        height: 45,
                                                        width: 145,
                                                        decoration:
                                                        BoxDecoration(
                                                          color: const Color
                                                              .fromARGB(
                                                              255,
                                                              56,
                                                              229,
                                                              77),
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              10),
                                                          // boxShadow: [
                                                          //   BoxShadow(
                                                          //     color: Colors.green.withOpacity(0.5),
                                                          //     spreadRadius: 0,
                                                          //     blurRadius: 10,
                                                          //     offset: const Offset(2, 1),
                                                          //   ),
                                                          // ],
                                                        ),
                                                        child:
                                                        const Column(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                          children: [
                                                            Text(
                                                              "Submit",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                                  fontSize:
                                                                  14),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                  ],
                                                )); //whatever you're returning, does not have to be a Container
                                          });
                                    });
                              },
                              icon: const Icon(Icons.add),
                              label: const Text("Tambah Vital Sign"),
                            )
                                : VitalSignView(
                                vitalSign: data.vitalSign ?? VitalSign()),
                            const SizedBox(
                              height: 10,
                            ),
                            const Soap(),
                            const SizedBox(
                              height: 10,
                            ),
                            data.resep == null
                                ? Container()
                                : PlanningResep(resep: data.resep ?? []),
                            const SizedBox(
                              height: 10,
                            ),
                            // const PalanningLaboratorium(),
                            // const SizedBox(
                            //   height: 10,
                            // ),
                            // const PlanningRadiologi(),
                            // const Surat(),
                            const SizedBox(
                              height: 10,
                            ),
                            const Planning(),
                            const SizedBox(
                              height: 40,
                            ),
                          ],
                        ),
                      );
                    } else {
                      return const Column(
                        children: [
                          shimmerCardProfile(),
                          shimmerVitalSign(),
                          shimmerSoap(),
                          shimmerSurat(),
                        ],
                      );
                    }
                  }),
            ]),
          ),
        ],
      );
    } ),),),),
    );
  }

  Widget buildSheet() {
    return Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.transparent,
        ),
        child: Column(
          children: [
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
            const SizedBox(
              height: 10,
            ),
             SingleChildScrollView(
                child: Center(
              child: Column(
                children: [
                  Text('Data Berhasil Di Tambahkan',
                      style: TextStyle(
                          color: Colors.black45,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center),
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // Image.asset(
                  //   "assets/images/login_sukses.png",
                  //   gaplessPlayback: true,
                  //   fit: BoxFit.fitHeight,
                  //   width: 200,
                  //   height: 200,
                  // ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                         EdgeInsets.only(right: 10, left: 10, top: 20),
                        child: GestureDetector(
                          onTap:  () {
                            Get.back();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: Colors.grey[100],
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Text("Kembali",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )),
          ],
        ));
  }

  Widget dropdown(String hintText, List<Lists> listData,
      TextEditingController controller, TextEditingController controller1) {
    return AppTextField(
      textEditingController: controller,
      textEditingController1: controller1,
      hint: hintText,
      isCitySelected: true,
      lists: listData,
      title: '',
    );
  }
}
