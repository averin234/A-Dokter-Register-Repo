import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:a_dokter_register/app/modules/hiss/views/componen/dropdown_hiss.dart';
import 'package:a_dokter_register/app/modules/hiss/views/componen/search_hiss.dart';

import '../controllers/hiss_controller.dart';
import 'componen/card_hiss/icdx.dart';
import 'componen/hiss_soap/soap.dart';
import 'componen/tabbar.dart';

class HissView extends GetView<HissController> {
  const HissView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(10),
              ),
            ),
            backgroundColor: Color.fromARGB(255, 35, 163, 223),
            floating: true,
            pinned: true,
            snap: true,
            centerTitle: true,
            leading: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_circle_left_rounded,
                  size: 40,
                ),
                color: Colors.white),
            title: Text("HISS", style: TextStyle(color: Colors.white)),
            bottom: AppBar(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(30),
                  ),
                ),
                toolbarHeight: 120,
                automaticallyImplyLeading: false,
                elevation: 0,
                backgroundColor: Color.fromARGB(255, 35, 163, 223),
                title: Column(
                  children: [
                    SearchHISS(),
                    SizedBox(
                      height: 5,
                    ),
                    DropdownHISS(),
                  ],
                )),
          ),
          // Other Sliver Widgets
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(
                height: 10,
              ),
              Padding(padding: EdgeInsets.only(left: 10),
              child : Text("Hasil Pencarian",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(right: 10, left: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFe0e0e0).withOpacity(0.5),
                      spreadRadius: 0,
                      blurRadius: 10,
                      offset: const Offset(2, 1),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 0),
                      child: Text("Category HISS",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Tabbar(),
                    SizedBox(
                      height: 10,
                    ),
                    icdx(),
                    SizedBox(
                      height: 10,
                    ),
                    HISSSoap(),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),

            ]),
          ),
        ],
      ),
    );
  }
}
