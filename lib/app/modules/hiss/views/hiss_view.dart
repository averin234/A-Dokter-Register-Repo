import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../controllers/hiss_controller.dart';
import 'componen/hiss_soap/assestment.dart';
import 'componen/hiss_soap/objektive.dart';
import 'componen/hiss_soap/subyektif.dart';
import 'componen/search_dropdown_hiss.dart';
import 'componen/search_hiss.dart';

class HissView extends StatelessWidget {
  const HissView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class HissView1 extends StatefulWidget {
  const HissView1({super.key});

  @override
  State<StatefulWidget> createState() {
    return HissView1State();
  }
}

class HissView1State extends State<HissView1>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            SizedBox(
              width: 230,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                          "Pastikan Data yang di cari sudah sesuai sebelum melakukan ",
                          style: TextStyle(color: Colors.black))),
                ],
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    builder: (context) => buildSheetberhasil(),
                  );
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
                    "Kirim",
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
      appBar: AppBar(
          elevation: 0,
          toolbarHeight: 160,
          automaticallyImplyLeading: false,
          title: Column(
            children: [
              const SearchHISS(),
              const SizedBox(
                height: 10,
              ),
              const SearchHISSdropdowmn(),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  TextButton(
                      onPressed: () {}, child: const Text('ICD X & Diagnosa')),
                  const SizedBox(
                    width: 10,
                  ),
                  TextButton(onPressed: () {}, child: const Text('Gejala')),
                  const SizedBox(
                    width: 10,
                  ),
                  TextButton(onPressed: () {}, child: const Text('Penyebab')),
                  const SizedBox(
                    width: 10,
                  ),
                  TextButton(onPressed: () {}, child: const Text('Penunjang')),
                  const SizedBox(
                    width: 10,
                  ),
                  TextButton(onPressed: () {}, child: const Text('Pengobatan')),
                  const SizedBox(
                    width: 10,
                  ),
                  TextButton(onPressed: () {}, child: const Text('Komplikasi')),
                  const SizedBox(
                    width: 10,
                  ),
                  TextButton(
                      onPressed: () {}, child: const Text('Differensial')),
                  const SizedBox(
                    width: 10,
                  ),
                  TextButton(onPressed: () {}, child: const Text('Catatan')),
                  const SizedBox(
                    width: 10,
                  ),
                  TextButton(
                      onPressed: () {}, child: const Text('Pre Existing')),
                  const SizedBox(
                    width: 10,
                  ),
                ]),
              ),
            ],
          )),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              SizedBox(
                height: 10,
              ),
              Subyektifhiss(),
              SizedBox(
                height: 10,
              ),
              objektivehiss(),
              SizedBox(
                height: 10,
              ),
              Assestmenthiss(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSheetberhasil() {
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
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text("Berhasil Kirim Ke Soap",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.blue)),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: AnimationConfiguration.toStaggeredList(
                    duration: const Duration(milliseconds: 275),
                    childAnimationBuilder: (widget) => SlideAnimation(
                      child: FadeInAnimation(
                        child: widget,
                      ),
                    ),
                    children: <Widget>[
                      Container(
                        margin:
                            const EdgeInsets.only(right: 20, left: 20, top: 20),
                        child: const Center(
                          child: Text(
                            'Pastikan Data yang di inputkan sudah benar',
                            textAlign: TextAlign.center,
                            style: TextStyle(),
                          ),
                        ),
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
              child: Container(
                height: 45,
                width: 145,
                decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Pergi Ke Soap",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ));
  }
}
