import 'dart:async';
import 'dart:math';

import 'package:a_dokter_register/app/data/componen/fetch_data.dart';
import 'package:a_dokter_register/app/data/componen/publics.dart';
import 'package:a_dokter_register/app/modules/Jadwal_Dokter/controllers/jadwal_dokter_controller.dart';
import 'package:a_dokter_register/app/routes/app_pages.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:text_scroll/text_scroll.dart';
import '../../loading_summer/loading_atur_jadwal_dokter.dart';
import '../../loading_summer/loading_screen_animed.dart';
import 'componen/card_jadwal.dart';

class JadwalDokterView extends StatefulWidget {
  JadwalDokterView({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _JadwalDokterViewState createState() => _JadwalDokterViewState();
}

class _JadwalDokterViewState extends State<JadwalDokterView> {
  // this enable our app to able to pull down
  late final RefreshController _refreshController; // the refresh controller
  var _scaffoldKey =
      GlobalKey<ScaffoldState>(); // this is our key to the scaffold widget
  @override
  void initState() {
    _refreshController = RefreshController();
    super.initState();
  }

  final controller = Get.put(JadwalDokterController());
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).popUntil((route) => route.isFirst);
        return true;
      },
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            builder: (context) => ModalJadwal(),
          ),
          elevation: 0,
          backgroundColor: Colors.tealAccent,
          foregroundColor: Colors.black,
          child: Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(50)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 3,
                  blurRadius: 3,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Icon(Icons.add),
          ),
        ),
        backgroundColor: Colors.white,
        key: _scaffoldKey,
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
                    Text("Atur Jadwal", style: TextStyle(color: Colors.black)),
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
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                            "Atur Jadwal Praktik Anda terlebih dahulu agar dapat menambahkan pasien ke daftar antrian. dengan cara tekan tombol +  ",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FutureBuilder(
                        future: API.getJadwalDokter(
                            kode_dokter:
                                Publics.controller.getDataRegist.value.kode ??
                                    ''),
                        builder: (context, snapshot) {
                          if (snapshot.hasData &&
                              snapshot.connectionState !=
                                  ConnectionState.waiting &&
                              snapshot.data != null) {
                            final data = snapshot.data!.jadwal ?? [];
                            return data.isEmpty
                                ? Column(
                                    children: [
                                      SizedBox(
                                        height: 40,
                                      ),
                                      Text(
                                        'Tidak ada jadwal Dokter',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Center(
                                        child: Image.asset(
                                          'assets/images/timetable.png',
                                          width: 150,
                                        ),
                                      )
                                    ],
                                  )
                                : Column(
                                    children:
                                        AnimationConfiguration.toStaggeredList(
                                            duration:
                                                Duration(milliseconds: 375),
                                            childAnimationBuilder: (widget) =>
                                                ScaleAnimation(
                                                  child: SlideAnimation(
                                                    child: widget,
                                                  ),
                                                ),
                                            children: data
                                                .map(
                                                  (e) => CardJadwal(jadwal: e),
                                                )
                                                .toList()),
                                  );
                          } else {
                            return Column(
                              children: [
                                shimmerAturJadwal(),
                                shimmerAturJadwal(),
                                shimmerAturJadwal(),
                                shimmerAturJadwal(),
                                shimmerAturJadwal(),
                                shimmerAturJadwal(),
                                shimmerAturJadwal(),
                                shimmerAturJadwal(),
                                shimmerAturJadwal(),
                              ],
                            );
                          }
                        }),
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
      JadwalDokterView(); // if you only want to refresh the list you can place this, so the two can be inside setState
      _refreshController
          .refreshCompleted(); // request complete,the header will enter complete state,
// resetFooterState : it will set the footer state from noData to idle
    });
  }
}

class ModalJadwal extends StatefulWidget {
  ModalJadwal({super.key});

  @override
  State<ModalJadwal> createState() => _ModalJadwalState();
}

class _ModalJadwalState extends State<ModalJadwal> {
  void initState() {
    _refreshController = RefreshController();
    controller.intervalController.clear();
    super.initState();
  }

  late RefreshController _refreshController;
  final List<String> jadawal1 = [
    '00',
    '01',
    '02',
    '03',
    '04',
    '05',
    '06',
    '07',
    '08',
    '09',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
  ];
  final List<String> jadawal2 = [
    '00',
    '15',
    '30',
    '45',
  ];
  String? selectedValue1;
  String? selectedValue2;
  String? selectedValue3;
  String? selectedValue4;
  bool isSenin = false;
  bool isSelasa = false;
  bool isRabu = false;
  bool isKamis = false;
  bool isJumat = false;
  bool isSabtu = false;
  bool isMinggu = false;
  final controller = Get.put(JadwalDokterController());
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.transparent,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 50,
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
            Text("Geser Kebawah",
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text("Tambah Jadwal",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.blue)),
            ),
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
                      Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text("Interval *",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Color(0x6cc7d1db)),
                              ),
                              child: TextFormField(
                                controller: controller.intervalController,
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.done,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  contentPadding: EdgeInsets.only(
                                      left: 15, bottom: 11, top: 13, right: 15),
                                  filled: true,
                                  fillColor: Colors.transparent,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text('Menit'),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text("Jam Mulai *",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(right: 10),
                              margin: EdgeInsets.only(left: 10, right: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Color(0x6cc7d1db)),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  DropdownButtonHideUnderline(
                                    child: DropdownButton2(
                                      isExpanded: true,
                                      hint: Row(
                                        children: [
                                          SizedBox(
                                            width: 4,
                                          ),
                                          Expanded(
                                            child: Text(
                                              selectedValue1 ?? '00',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.black,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                      items: jadawal1
                                          .map((item) =>
                                              DropdownMenuItem<String>(
                                                value: item,
                                                child: Text(
                                                  item,
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ))
                                          .toList(),
                                      value: selectedValue1,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedValue1 = value as String;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(right: 10),
                              margin: EdgeInsets.only(left: 10, right: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Color(0x6cc7d1db)),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  DropdownButtonHideUnderline(
                                    child: DropdownButton2(
                                      isExpanded: true,
                                      hint: Row(
                                        children: [
                                          SizedBox(
                                            width: 4,
                                          ),
                                          Expanded(
                                            child: Text(
                                              selectedValue2 ?? '00',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.black,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                      items: jadawal2
                                          .map((item) =>
                                              DropdownMenuItem<String>(
                                                value: item,
                                                child: Text(
                                                  item,
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ))
                                          .toList(),
                                      value: selectedValue2,
                                      onChanged: (value) {
                                        selectedValue2 = value as String;
                                        setState(() {});
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text("Jam Akhir *",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(right: 10),
                              margin: EdgeInsets.only(left: 10, right: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Color(0x6cc7d1db)),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  DropdownButtonHideUnderline(
                                    child: DropdownButton2(
                                      isExpanded: true,
                                      hint: Row(
                                        children: [
                                          SizedBox(
                                            width: 4,
                                          ),
                                          Expanded(
                                            child: Text(
                                              selectedValue3 ?? '00',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.black,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                      items: jadawal1
                                          .map((item) =>
                                              DropdownMenuItem<String>(
                                                value: item,
                                                child: Text(
                                                  item,
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ))
                                          .toList(),
                                      value: selectedValue3,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedValue3 = value as String;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(right: 10),
                              margin: EdgeInsets.only(left: 10, right: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Color(0x6cc7d1db)),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  DropdownButtonHideUnderline(
                                    child: DropdownButton2(
                                      isExpanded: true,
                                      hint: Row(
                                        children: [
                                          SizedBox(
                                            width: 4,
                                          ),
                                          Expanded(
                                            child: Text(
                                              selectedValue4 ?? '00',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.black,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                      items: jadawal2
                                          .map((item) =>
                                              DropdownMenuItem<String>(
                                                value: item,
                                                child: Text(
                                                  item,
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ))
                                          .toList(),
                                      value: selectedValue4,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedValue4 = value as String;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text("Hari Dokter Masuk",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Checkbox(
                            checkColor: Colors.white,
                            value: isSenin,
                            onChanged: (bool? value) {
                              setState(() {
                                isSenin = value!;
                              });
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 0),
                            child: Text("Senin",
                                style:
                                    TextStyle(fontWeight: FontWeight.normal)),
                          ),
                          Checkbox(
                            checkColor: Colors.white,
                            value: isSelasa,
                            onChanged: (bool? value) {
                              setState(() {
                                isSelasa = value!;
                              });
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 0),
                            child: Text("Selasa",
                                style:
                                    TextStyle(fontWeight: FontWeight.normal)),
                          ),
                          Checkbox(
                            checkColor: Colors.white,
                            value: isRabu,
                            onChanged: (bool? value) {
                              setState(() {
                                isRabu = value!;
                              });
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 0),
                            child: Text("Rabu",
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                )),
                          ),
                          Checkbox(
                            checkColor: Colors.white,
                            value: isKamis,
                            onChanged: (bool? value) {
                              setState(() {
                                isKamis = value!;
                              });
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 0),
                            child: Text("Kamis",
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                )),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            checkColor: Colors.white,
                            value: isJumat,
                            onChanged: (bool? value) {
                              setState(() {
                                isJumat = value!;
                              });
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 0),
                            child: Text("Jumat",
                                style:
                                    TextStyle(fontWeight: FontWeight.normal)),
                          ),
                          Checkbox(
                            checkColor: Colors.white,
                            value: isSabtu,
                            onChanged: (bool? value) {
                              setState(() {
                                isSabtu = value!;
                              });
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 0),
                            child: Text("Sabtu",
                                style:
                                    TextStyle(fontWeight: FontWeight.normal)),
                          ),
                          Checkbox(
                            checkColor: Colors.white,
                            value: isMinggu,
                            onChanged: (bool? value) {
                              setState(() {
                                isMinggu = value!;
                              });
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 0),
                            child: Text("Minggu",
                                style:
                                    TextStyle(fontWeight: FontWeight.normal)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () async {
                HapticFeedback.lightImpact();
                Get.defaultDialog(
                  backgroundColor: Color(0xe0e0e0),
                  content: Loading(),
                  title: '',
                  barrierDismissible: false,
                );
                final postJadwal = await API.postJadwalDokter(
                  id_jadwal_dokter: '',
                  kode_dokter:
                      Publics.controller.getDataRegist.value.kode ?? '',
                  senin: isSenin == true ? '1' : '0',
                  selasa: isSelasa == true ? '1' : '0',
                  rabu: isRabu == true ? '1' : '0',
                  kamis: isKamis == true ? '1' : '0',
                  jumat: isJumat == true ? '1' : '0',
                  sabtu: isSabtu == true ? '1' : '0',
                  minggu: isMinggu == true ? '1' : '0',
                  jam_awal: "${selectedValue1 ?? ''}:${selectedValue2 ?? ''}",
                  jam_akhir: "${selectedValue3 ?? ''}:${selectedValue4 ?? ''}",
                  waktu_periksa: controller.intervalController.text,
                );
                Get.back();
                Get.toNamed(Routes.JADWAL_DOKTER);
                if (postJadwal.code != 200) {
                  Get.snackbar(
                      postJadwal.code.toString(), postJadwal.msg.toString());
                } else {
                  Navigator.pop(context); // Close the bottom sheet
                  _refreshPage();
                  Get.toNamed(Routes.JADWAL_DOKTER);
                }
              },
              child: Container(
                height: 45,
                width: 145,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 56, 229, 77),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Tambah",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ));
  }

  void _refreshPage() {
    setState(() {
      // Melakukan perubahan pada Rx variable
      Get.back();
    });
  }
}
