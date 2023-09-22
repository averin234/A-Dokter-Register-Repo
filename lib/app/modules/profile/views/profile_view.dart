import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:get/get.dart';

import '../../../data/componen/fetch_data.dart';
import '../../../data/componen/publics.dart';
import '../../cv/views/componen/card_dokter_cv.dart';
import '../../loading_summer/loading_setting.dart';
import '../controllers/profile_controller.dart';
import 'componnen/card_setting_akun.dart';

class ProfileView extends GetView<ProfileController> {
  ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor:
                  Color.fromARGB(255, 255, 255, 255), // <-- SEE HERE
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
            title: Text('Pengaturan Akun'),
            bottom: AppBar(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
              ),
              // title: CardDokterSetting(),
              toolbarHeight: 0,
              automaticallyImplyLeading: false,
              elevation: 0,
            ),
          ),
          // Other Sliver Widgets
          SliverList(
            delegate: SliverChildListDelegate([
              FutureBuilder(
                  future: API.getDetailDokter(
                      kode_dokter:
                          Publics.controller.getDataRegist.value.kode ?? ''),
                  builder: (context, snapshot) {
                    if (snapshot.hasData &&
                        snapshot.connectionState != ConnectionState.waiting &&
                        snapshot.data != null) {
                      final data = snapshot.data!.dokter![0];
                      return Column(
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
                            CardDokterCV(dokter: data),
                          ]));
                    } else {
                      return Center(
                        child: shimmerSetting(),
                      );
                    }
                  }),
              CardSettingAkun(),
            ]),
          ),
        ],
      ),
    );
  }
}
