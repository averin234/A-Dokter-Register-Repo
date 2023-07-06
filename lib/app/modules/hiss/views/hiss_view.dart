import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../controllers/hiss_controller.dart';
import 'componen/search_dropdown_hiss.dart';
import 'componen/search_hiss.dart';

class HissView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HissViewState();
  }
}

class HissViewState extends State<HissView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: 9, vsync: this); // initialise it here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          toolbarHeight: 160,
          automaticallyImplyLeading: false,
          title: Column(
            children: [
              SearchHISS(),
              SizedBox(
                height: 10,
              ),
              SearchHISSdropdowmn(),
              TabBar(
                labelColor: Colors.black,
                controller: _tabController,
                isScrollable: true,
                tabs: [
                  Tab(text: "ICD X & Diagnosa"),
                  Tab(text: "Gejala"),
                  Tab(text: "Penyebab"),
                  Tab(text: "Penunjang"),
                  Tab(text: "Pengobatan"),
                  Tab(text: "Komplikasi"),
                  Tab(text: "Differensial"),
                  Tab(text: "Catatan"),
                  Tab(text: "Pre Existing"),
                ],
              ),
            ],
          )),
      body: TabBarView(
        controller: _tabController,
        children: [
          Container(),
          Container(),
          Container(),
          Container(),
          Container(),
          Container(),
          Container(),
          Container(),
          Container(),

        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
