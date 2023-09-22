import 'package:a_dokter_register/app/data/componen/fetch_data.dart';
import 'package:a_dokter_register/app/data/componen/publics.dart';
import 'package:a_dokter_register/app/modules/detail_regist_pasien_lama/controllers/detail_regist_pasien_lama_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../data/model/get_antrian_dokter.dart';

class FormRegisPasienLama extends StatefulWidget {
  FormRegisPasienLama({super.key});

  @override
  State<FormRegisPasienLama> createState() => _FormRegisPasienLamaState();
}

class _FormRegisPasienLamaState extends State<FormRegisPasienLama> {
  final controller = Get.put(DetailRegistPasienLamaController());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10, left: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0x6cc7d1db)),
        color: Color.fromARGB(255, 219, 246, 253),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color(0xFFe0e0e0).withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 10,
            offset: Offset(2, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Padding(
              padding: EdgeInsets.only(right: 15, left: 10),
              child: Row(
                children: [
                  Text('Tanggal :',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(DateFormat('yyyy-MM-dd').format(DateTime.now()),
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      // Text('Jadwal Hari : kamis',
                      //     style: TextStyle(fontWeight: FontWeight.bold)),
                      // Text('06:00 s/d 22:00',
                      //     style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              )),
          SizedBox(
            height: 10,
          ),
          Divider(
            color: Colors.grey,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text("Jam Periksa :",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                )),
          ),
          SizedBox(
            height: 10,
          ),
          Row(children: [
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
                child: FutureBuilder(
                    future: API.getAntrianDokter(
                        tgl_daftar:
                            DateFormat('yyyy-MM-dd').format(DateTime.now()),
                        kode_dokter:
                            Publics.controller.getDataRegist.value.kode ?? ''),
                    builder: (context, snapshot) {
                      if (snapshot.hasData &&
                          snapshot.connectionState != ConnectionState.waiting &&
                          snapshot.data != null) {
                        return dropdown(
                          'Pilih Jadwal',
                          snapshot.data!.list ?? [],
                          controller.jadwalController,
                          controller.durasiController,
                          controller.antrianController,
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
              ),
            ),
            SizedBox(
              width: 5,
            ),
          ]),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text("No Antrian :",
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
                    controller: controller.antrianController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    readOnly: true,
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
              SizedBox(
                width: 10,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          //  Padding(
          //   padding: EdgeInsets.only(left: 15),
          //   child: Text("Nasabah :",
          //       style: TextStyle(
          //         fontWeight: FontWeight.bold,
          //       )),
          // ),
          //  SizedBox(
          //   height: 10,
          // ),
          // Row(children: [
          //    SizedBox(
          //     width: 5,
          //   ),
          //   Expanded(
          //     child: Container(
          //       padding:  EdgeInsets.only(right: 10),
          //       margin:  EdgeInsets.only(left: 10, right: 10),
          //       decoration: BoxDecoration(
          //         color: Colors.white,
          //         borderRadius: BorderRadius.circular(10),
          //         border: Border.all(color:  Color(0x6cc7d1db)),
          //       ),
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         mainAxisAlignment: MainAxisAlignment.start,
          //         children: [
          //           DropdownButtonHideUnderline(
          //             child: DropdownButton2(
          //               isExpanded: true,
          //               hint: Row(
          //                 children:  [
          //                   SizedBox(
          //                     width: 4,
          //                   ),
          //                   Expanded(
          //                     child: Text(
          //                       '---pilih jadwal---',
          //                       style: TextStyle(
          //                         fontSize: 14,
          //                         fontWeight: FontWeight.normal,
          //                         color: Colors.black,
          //                       ),
          //                       overflow: TextOverflow.ellipsis,
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //               items: items
          //                   .map((item) => DropdownMenuItem<String>(
          //                         value: item,
          //                         child: Text(
          //                           item,
          //                           style:  TextStyle(
          //                             fontSize: 14,
          //                             fontWeight: FontWeight.bold,
          //                             color: Colors.black,
          //                           ),
          //                           overflow: TextOverflow.ellipsis,
          //                         ),
          //                       ))
          //                   .toList(),
          //               value: selectedValue,
          //               onChanged: (value) {
          //                 setState(() {
          //                   selectedValue = value as String;
          //                 });
          //               },
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          //    SizedBox(
          //     width: 5,
          //   ),
          // ]),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Widget dropdown(
      String hintText,
      List<ListAntrian> listData,
      TextEditingController controller,
      TextEditingController controller1,
      TextEditingController controller2) {
    return AppTextField(
      textEditingController: controller,
      textEditingController1: controller1,
      textEditingController2: controller2,
      hint: hintText,
      isCitySelected: true,
      lists: listData,
      title: '',
    );
  }
}

class AppTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final TextEditingController textEditingController1;
  final TextEditingController textEditingController2;
  final String title;
  final String hint;
  final bool isCitySelected;
  final List<ListAntrian> lists;

  AppTextField({
    required this.textEditingController,
    required this.textEditingController1,
    required this.textEditingController2,
    required this.title,
    required this.hint,
    required this.isCitySelected,
    required this.lists,
    Key? key,
  }) : super(key: key);

  /// This is on text changed method which will display on city text field on changed.
  void onTextFieldTap() {
    showModalBottomSheet<void>(
      context: Get.context!,
      enableDrag: true,
      // showDragHandle: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) {
        return Column(
          children: [
            Expanded(
              child: ListView(
                children: lists.isEmpty
                    ? [
                        Image.asset(
                          'assets/images/timetable.png',
                          height: 100,
                        ),
                        Center(
                          child: Text('Tidak ada waktu periksa yang tersedia.'),
                        ),
                      ]
                    : lists
                        .map(
                          (e) => TextButton(
                            style: TextButton.styleFrom(
                                alignment: Alignment.centerLeft,
                                foregroundColor: Colors.black,
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10)),
                            child: Text(
                              e.jam!,
                              style: GoogleFonts.nunito(
                                fontSize: 17.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            onPressed: () {
                              textEditingController.text = e.jam!;
                              textEditingController1.text = e.durasi!;
                              textEditingController2.text =
                                  e.antrian!.toString();
                              Get.back();
                            },
                          ),
                        )
                        .toList(),
              ),
            ),
          ],
        );
      },
    );
  }

  void showSnackBar(String message) {
    Get.snackbar(title, message);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.width / 8,
      width: Get.width / 1,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextFormField(
        readOnly: true,
        controller: textEditingController,
        cursorColor: Colors.black,
        onTap: onTextFieldTap,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          suffixIcon: Icon(Icons.arrow_drop_down_circle),
          contentPadding: EdgeInsets.only(left: 8, bottom: 0, top: 0, right: 0),
          hintText: hint,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}
