import 'package:a_dokter_register/app/modules/privyid/views/componen/form_privyid_connect.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:get/get.dart';

import '../controllers/privyid_controller.dart';

class PrivyidView extends GetView<PrivyidController> {
  const PrivyidView({Key? key}) : super(key: key);

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
            title: Text("Privyid", style: TextStyle(color: Colors.black)),
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
                        height: 20,
                      ),
                      FromPrivyidConnect(),
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
