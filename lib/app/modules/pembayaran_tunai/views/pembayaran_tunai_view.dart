import 'package:a_dokter_register/app/modules/pembayaran_tunai/views/widgets/card_infokaryawan_kasir.dart';
import 'package:a_dokter_register/app/modules/pembayaran_tunai/views/widgets/data_billing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../data/componen/fetch_data.dart';
import '../../../data/componen/publics.dart';
import '../../../data/model/profile_pasien/get_tunai.dart';
import '../../../routes/app_pages.dart';
import '../../loading_summer/loading_screen_animed.dart';
import '../controllers/pembayaran_tunai_controller.dart';

class PembayaranTunaiView extends StatefulWidget {
  PembayaranTunaiView();

  @override
  _PembayaranTunaiViewState createState() => _PembayaranTunaiViewState();
}

class _PembayaranTunaiViewState extends State<PembayaranTunaiView> {
  // this enable our app to able to pull down
  late final RefreshController _refreshController; // the refresh controller
  var _scaffoldKey =
      GlobalKey<ScaffoldState>(); // this is our key to the scaffold widget
  @override
  void initState() {
    _refreshController = RefreshController();
    super.initState();
  }

  final controller = Get.put(PembayaranTunaiController());
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).popUntil((route) => route.isFirst);
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color(0xFFe0e0e0).withOpacity(0.5),
                  spreadRadius: 0,
                  blurRadius: 10,
                  offset: Offset(2, 1),
                ),
              ],
            ),
            height: 75,
            margin: EdgeInsets.symmetric(vertical: 2, horizontal: 0),
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 230,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                              "Pastikan pembayaran Tunai sudah sesuai, Mohon periksa lagi ",
                              style: TextStyle(color: Colors.black))),
                    ],
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      Get.defaultDialog(
                        backgroundColor: Color(0xe0e0e0),
                        content: Loading(),
                        title: '',
                        barrierDismissible: false,
                      );
                      final postTunai = await API.postTunai(
                        pembayar: controller.totalcontroller.text,
                        tagihan: controller.kasir.billing!,
                        tunai: controller.JumlahPembayarancontroller.text,
                        no_registrasi: controller.nr,
                      );
                      Get.back();
                      if (postTunai.code == 200) {
                        Get.toNamed(Routes.PENDAPATAN_DOKTER,
                            parameters: {'nr': postTunai.msg! ?? ''});
                      } else {
                        Get.defaultDialog(
                          title: (postTunai.code ?? 0).toString(),
                          content: Text(postTunai.msg ?? ''),
                        );
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                          right: 15, left: 15, top: 10, bottom: 10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Colors.white12,
                            offset: Offset(2, 1),
                            blurRadius: 1,
                            spreadRadius: 2,
                          )
                        ],
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Color(0xff4babe7), Color(0xff4babe7)],
                        ),
                      ),
                      child: Text(
                        "Bayar",
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
                  automaticallyImplyLeading: false,
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
                  title: Text("Pembayaran Tunai",
                      style: TextStyle(color: Colors.black)),
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
                      SizedBox(
                        height: 10,
                      ),
                      CardKaryawan(),
                      SizedBox(
                        height: 10,
                      ),
                      Databilling(),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
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
      PembayaranTunaiView(); // if you only want to refresh the list you can place this, so the two can be inside setState
      _refreshController
          .refreshCompleted(); // request complete,the header will enter complete state,
// resetFooterState : it will set the footer state from noData to idle
    });
  }
}
