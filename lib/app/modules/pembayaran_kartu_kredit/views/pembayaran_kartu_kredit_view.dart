import 'package:a_dokter_register/app/modules/pembayaran_kartu_kredit/views/widgets/card_infokaryawan_kasir2.dart';
import 'package:a_dokter_register/app/modules/pembayaran_kartu_kredit/views/widgets/card_pembayaran_kredit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../data/componen/fetch_data.dart';
import '../../../routes/app_pages.dart';
import '../../loading_summer/loading_screen_animed.dart';
import '../controllers/pembayaran_kartu_kredit_controller.dart';

class PembayaranKartuKreditView extends StatefulWidget {
  const PembayaranKartuKreditView({
    super.key,
  });

  @override
  _PembayaranKartuKreditViewState createState() =>
      _PembayaranKartuKreditViewState();
}

class _PembayaranKartuKreditViewState extends State<PembayaranKartuKreditView> {
  // this enable our app to able to pull down
  late final RefreshController _refreshController; // the refresh controller
  final _scaffoldKey =
      GlobalKey<ScaffoldState>(); // this is our key to the scaffold widget
  @override
  void initState() {
    _refreshController = RefreshController();
    super.initState();
  }

  final controller = Get.put(PembayaranKartuKreditController());
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
                  width: 230,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                              "Pastikan pembayaran Debet sudah sesuai, Mohon periksa lagi ",
                              style: TextStyle(color: Colors.black))),
                    ],
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      Get.defaultDialog(
                        backgroundColor: const Color(0x00e0e0e0),
                        content: const Loading(),
                        title: '',
                        barrierDismissible: false,
                      );
                      final postTunai = await API.postKredit(
                        tagihan: controller.totalcontroller.text,
                        bank: controller.kartudebetcontroller.text,
                        batch: controller.nobatchcontroller.text,
                        pembayar: controller.pembayar.text,
                        pembulatan: controller.pembulatan.text,
                        jumlah: controller.jumlahcontroller.text,
                        kartu: controller.nokartucontroller.text,
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
                      margin: const EdgeInsets.only(
                          right: 15, left: 15, top: 10, bottom: 10),
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
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
                      child: const Text(
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
            header: const WaterDropHeader(),
            onLoading: _onLoading,
            onRefresh: _onRefresh,
            child: CustomScrollView(
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
                  title: const Text("Pembayaran Kredit",
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
                      const SizedBox(
                        height: 10,
                      ),
                      const CardKaryawan2(),
                      const SizedBox(
                        height: 10,
                      ),
                      const PembayaranKredit(),
                      const SizedBox(
                        height: 20,
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
      const PembayaranKartuKreditView(); // if you only want to refresh the list you can place this, so the two can be inside setState
      _refreshController
          .refreshCompleted(); // request complete,the header will enter complete state,
// resetFooterState : it will set the footer state from noData to idle
    });
  }
}
