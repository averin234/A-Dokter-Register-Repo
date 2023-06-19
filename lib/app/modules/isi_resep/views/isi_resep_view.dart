import 'package:a_dokter_register/app/modules/isi_resep/views/componen/form_isi_resep.dart';
import 'package:a_dokter_register/app/modules/isi_resep/views/componen/hasil_resep.dart';
import 'package:a_dokter_register/app/modules/isi_tindakan/controllers/isi_tindakan_controller.dart';
import 'package:a_dokter_register/app/modules/isi_tindakan/views/componen/form_isi_tindakan.dart';
import 'package:a_dokter_register/app/modules/isi_tindakan/views/componen/hasil_tindakan.dart';
import 'package:a_dokter_register/app/modules/isi_tindakan/views/componen/nama_pemeriksa.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:get/get.dart';

class IsiResepView extends GetView<IsiTindakanController> {
  const IsiResepView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
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
            centerTitle: true,
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
            title: Text("Resep", style: TextStyle(color: Colors.black)),
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
                    duration: const Duration(milliseconds: 375),
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
                      FormIsiResep(),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text('Hasil Resep',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      HasilResep(),
                      SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
