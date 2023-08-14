import 'package:a_dokter_register/app/data/model/get_detail_mr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import '../../../../data/componen/fetch_data.dart';
import '../../../registrasi_pasien/views/componen/form_registrasi_pasien.dart';
import '../../controllers/detail_tindakan_controller.dart';

class VitalSignView extends GetView<DetailTindakanController> {
  final VitalSign vitalSign;

  const VitalSignView({super.key, required this.vitalSign});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.only(right: 10, left: 10),
        padding: const EdgeInsets.only(right: 10, left: 10, bottom: 10),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0x6cc7d1db)),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  width: 210,
                  child: Text("VITAL SIGN",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () => showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      builder: (BuildContext context) {
                        return DraggableScrollableSheet(
                            initialChildSize: 0.95,
                            //set this as you want
                            maxChildSize: 0.95,
                            //set this as you want
                            minChildSize: 0.95,
                            //set this as you want
                            expand: true,
                            builder: (context, scrollController) {
                              return Container(
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
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 25,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(left: 15),
                                        child: Text("Tambah Vital Sign",
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: AnimationConfiguration
                                                .toStaggeredList(
                                              duration: const Duration(
                                                  milliseconds: 275),
                                              childAnimationBuilder: (widget) =>
                                                  SlideAnimation(
                                                child: FadeInAnimation(
                                                  child: widget,
                                                ),
                                              ),
                                              children: <Widget>[
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                const Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 15),
                                                  child: Text("Keadaan Umum",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      )),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      left: 10, right: 10),
                                                  child: FutureBuilder(
                                                    future:
                                                        API.getkeadaanUmum(),
                                                    builder:
                                                        (context, snapshot) {
                                                      if (snapshot.hasData &&
                                                          snapshot.connectionState !=
                                                              ConnectionState
                                                                  .waiting &&
                                                          snapshot.data !=
                                                              null) {
                                                        final data = snapshot
                                                                .data!.list ??
                                                            [];
                                                        return data.isEmpty
                                                            ? Text(snapshot
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
                                                          child:
                                                              CircularProgressIndicator(),
                                                        );
                                                      }
                                                    },
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                const Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 15),
                                                  child: Text("Tekanan Darah",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      left: 10, right: 10),
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xfff3f3f3),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            22),
                                                  ),
                                                  child: TextField(
                                                    controller: controller
                                                        .tekananDarahController,
                                                    decoration:
                                                        const InputDecoration(
                                                          suffixIcon: Padding(padding: EdgeInsets.only(top: 15, right: 10),
                                                            child :Text('mmHg'),),
                                                      border: InputBorder.none,
                                                      focusedBorder:
                                                          InputBorder.none,
                                                      enabledBorder:
                                                          InputBorder.none,
                                                      errorBorder:
                                                          InputBorder.none,
                                                      disabledBorder:
                                                          InputBorder.none,
                                                      contentPadding:
                                                          EdgeInsets.only(
                                                              left: 15,
                                                              bottom: 11,
                                                              top: 13,
                                                              right: 15),
                                                      filled: true,
                                                      fillColor:
                                                          Colors.transparent,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                const Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 15),
                                                  child: Text("Suhu",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      )),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      left: 10, right: 10),
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xfff3f3f3),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            22),
                                                  ),
                                                  child: TextField(
                                                    controller: controller
                                                        .suhuController,
                                                    decoration:
                                                        const InputDecoration(
                                                          suffixIcon: Padding(padding: EdgeInsets.only(top: 15, right: 10),
                                                            child :Text('°/Celcius'),),
                                                      border: InputBorder.none,
                                                      focusedBorder:
                                                          InputBorder.none,
                                                      enabledBorder:
                                                          InputBorder.none,
                                                      errorBorder:
                                                          InputBorder.none,
                                                      disabledBorder:
                                                          InputBorder.none,
                                                      contentPadding:
                                                          EdgeInsets.only(
                                                              left: 15,
                                                              bottom: 11,
                                                              top: 13,
                                                              right: 15),
                                                      filled: true,
                                                      fillColor:
                                                          Colors.transparent,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                const Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 15),
                                                  child: Text("Tinggi Badan",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      )),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      left: 10, right: 10),
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xfff3f3f3),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            22),
                                                  ),
                                                  child: TextField(
                                                    controller: controller
                                                        .tinggiBadanController,
                                                    decoration:
                                                        const InputDecoration(
                                                          suffixIcon: Padding(padding: EdgeInsets.only(top: 15, right: 10),
                                                            child :Text('Cm'),),
                                                      border: InputBorder.none,
                                                      focusedBorder:
                                                          InputBorder.none,
                                                      enabledBorder:
                                                          InputBorder.none,
                                                      errorBorder:
                                                          InputBorder.none,
                                                      disabledBorder:
                                                          InputBorder.none,
                                                      contentPadding:
                                                          EdgeInsets.only(
                                                              left: 15,
                                                              bottom: 11,
                                                              top: 13,
                                                              right: 15),
                                                      filled: true,
                                                      fillColor:
                                                          Colors.transparent,
                                                    ),
                                                  ),
                                                ),
                                                // const SizedBox(
                                                //   height: 10,
                                                // ),
                                                // const Padding(
                                                //   padding: EdgeInsets.only(left: 15),
                                                //   child: Text("Heart Rate",
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
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                const Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 15),
                                                  child: Text("Kesadaran",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      )),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      left: 10, right: 10),
                                                  child: FutureBuilder(
                                                    future: API
                                                        .getKesadaranPasien(),
                                                    builder:
                                                        (context, snapshot) {
                                                      if (snapshot.hasData &&
                                                          snapshot.connectionState !=
                                                              ConnectionState
                                                                  .waiting &&
                                                          snapshot.data !=
                                                              null) {
                                                        final data = snapshot
                                                                .data!.list ??
                                                            [];
                                                        return data.isEmpty
                                                            ? Text(snapshot
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
                                                          child:
                                                              CircularProgressIndicator(),
                                                        );
                                                      }
                                                    },
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                const Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 15),
                                                  child: Text("Nadi",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      )),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      left: 10, right: 10),
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xfff3f3f3),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            22),
                                                  ),
                                                  child: TextField(
                                                    controller: controller
                                                        .nadiController,
                                                    decoration:
                                                        const InputDecoration(
                                                          suffixIcon: Padding(padding: EdgeInsets.only(top: 15, right: 10),
                                                            child :Text('x/menit'),),
                                                      border: InputBorder.none,
                                                      focusedBorder:
                                                          InputBorder.none,
                                                      enabledBorder:
                                                          InputBorder.none,
                                                      errorBorder:
                                                          InputBorder.none,
                                                      disabledBorder:
                                                          InputBorder.none,
                                                      contentPadding:
                                                          EdgeInsets.only(
                                                              left: 15,
                                                              bottom: 11,
                                                              top: 13,
                                                              right: 15),
                                                      filled: true,
                                                      fillColor:
                                                          Colors.transparent,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                const Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 15),
                                                  child: Text("Pernafasan",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      )),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      left: 10, right: 10),
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xfff3f3f3),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            22),
                                                  ),
                                                  child: TextField(
                                                    controller: controller
                                                        .pernapasanController,
                                                    decoration:
                                                        const InputDecoration(
                                                          suffixIcon: Padding(padding: EdgeInsets.only(top: 15, right: 10),
                                                            child :Text('x/menit'),),
                                                      border: InputBorder.none,
                                                      focusedBorder:
                                                          InputBorder.none,
                                                      enabledBorder:
                                                          InputBorder.none,
                                                      errorBorder:
                                                          InputBorder.none,
                                                      disabledBorder:
                                                          InputBorder.none,
                                                      contentPadding:
                                                          EdgeInsets.only(
                                                              left: 15,
                                                              bottom: 11,
                                                              top: 13,
                                                              right: 15),
                                                      filled: true,
                                                      fillColor:
                                                          Colors.transparent,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                const Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 15),
                                                  child: Text("Berat Badan",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      )),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      left: 10, right: 10),
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xfff3f3f3),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            22),
                                                  ),
                                                  child: TextField(
                                                    controller: controller
                                                        .beratBadanController,
                                                    decoration:
                                                        const InputDecoration(
                                                          suffixIcon: Padding(padding: EdgeInsets.only(top: 15, right: 10),
                                                            child :Text('kg'),),
                                                      border: InputBorder.none,
                                                      focusedBorder:
                                                          InputBorder.none,
                                                      enabledBorder:
                                                          InputBorder.none,
                                                      errorBorder:
                                                          InputBorder.none,
                                                      disabledBorder:
                                                          InputBorder.none,
                                                      contentPadding:
                                                          EdgeInsets.only(
                                                              left: 15,
                                                              bottom: 11,
                                                              top: 13,
                                                              right: 15),
                                                      filled: true,
                                                      fillColor:
                                                          Colors.transparent,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
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
                                                  height: 400,
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
                                          final postVS = await API.postVitalSign(
                                              no_registrasi:
                                                  controller.noRegistrasi,
                                              keadaan_umum: controller
                                                  .keadaanUmumController.text,
                                              kesadaran_pasien: controller
                                                  .kesadaranController.text,
                                              tekanan_darah: controller
                                                  .tekananDarahController.text,
                                              nadi: controller
                                                  .nadiController.text,
                                              suhu: controller
                                                  .suhuController.text,
                                              pernapasan: controller
                                                  .pernapasanController.text,
                                              tinggi_badan: controller
                                                  .tinggiBadanController.text,
                                              berat_badan: controller
                                                  .beratBadanController.text);
                                          if (postVS.code != 200) {
                                          } else {
                                            // showModalBottomSheet(
                                            //   context: context,
                                            //   shape: const RoundedRectangleBorder(
                                            //     borderRadius: BorderRadius.vertical(
                                            //       top: Radius.circular(20),
                                            //     ),
                                            //   ),
                                            //   builder: (context) => buildSheet(),
                                            // );
                                            Get.defaultDialog(
                                              title:
                                                  (postVS.code ?? 0).toString(),
                                              content: Text(postVS.msg ?? ''),
                                            );
                                          }
                                        },
                                        child: Container(
                                          height: 45,
                                          width: 145,
                                          decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                255, 56, 229, 77),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            // boxShadow: [
                                            //   BoxShadow(
                                            //     color: Colors.green.withOpacity(0.5),
                                            //     spreadRadius: 0,
                                            //     blurRadius: 10,
                                            //     offset: const Offset(2, 1),
                                            //   ),
                                            // ],
                                          ),
                                          child: const Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Submit",
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
                            });
                      }),
                  child: Container(
                    height: 30,
                    width: 120,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 33, 146, 255),
                      borderRadius: BorderRadius.circular(10),
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: Colors.blue.withOpacity(0.5),
                      //     spreadRadius: 0,
                      //     blurRadius: 10,
                      //     offset: const Offset(2, 1),
                      //   ),
                      // ],
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Update Vital Sign",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 13),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            const Divider(
              height: 10,
              color: Colors.grey,
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Keadaan Umum :",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.blue)),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(vitalSign.keadaanUmum ?? '',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14)),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text("Tekanan Darah :",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.blue)),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(children: [
                      Text(vitalSign.tekananDarah ?? '',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14)),
                      SizedBox(
                        width: 10,
                      ),
                      Text('mmHg'),
                      ],),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text("Suhu :",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.blue)),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(children: [
                      Text(vitalSign.suhu ?? '',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14)),
                      SizedBox(
                        width: 10,
                      ),
                        Text('°/Celcius')
                      ],),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text("Tinggi Badan :",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.blue)),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(children: [
                      Text(vitalSign.tinggiBadan ?? '',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14)),
                      SizedBox(
                        width: 10,
                      ),
                        Text('Cm')
                      ],),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 80,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Kesadaran :",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.blue)),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(vitalSign.kesadaranPasien ?? '',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14)),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text("Nadi :",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.blue)),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(children: [
                      Text(vitalSign.nadi ?? '',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14)),
                      SizedBox(
                        width: 10,
                      ),
                        Text('x/menit'),
                      ],),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text("Pernafasan :",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.blue)),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(children: [
                      Text(vitalSign.pernafasan ?? '',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14)),
                      SizedBox(
                        width: 10,
                      ),
                        Text('x/menit')
                      ],),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text("Berat Badan :",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.blue)),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(children: [
                      Text(vitalSign.beratBadan ?? '',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14)),
                      SizedBox(
                        width: 10,
                      ),
                        Text('kg')
                      ],),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
