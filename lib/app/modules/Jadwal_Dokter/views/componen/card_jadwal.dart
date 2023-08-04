import 'package:a_dokter_register/app/data/componen/fetch_data.dart';
import 'package:a_dokter_register/app/data/model/jadwal_dokter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';
import '../../../loading_summer/loading_screen_animed.dart';

class CardJadwal extends StatefulWidget {
  final Jadwal jadwal;
  const CardJadwal({super.key, required this.jadwal});

  @override
  State<CardJadwal> createState() => _CardJadwalState();
}

class _CardJadwalState extends State<CardJadwal> {
  // final List<String> items = [
  //   'Item1',
  //   'Item2',
  //   'Item3',
  //   'Item4',
  //   'Item5',
  //   'Item6',
  //   'Item7',
  //   'Item8',
  // ];
  // String? selectedValue;
  // bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0x6cc7d1db)),
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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                const Expanded(
                  child: Text(
                    "Jadwal Dokter",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                // GestureDetector(
                //     onTap: () => showModalBottomSheet(
                //           context: context,
                //           shape: const RoundedRectangleBorder(
                //             borderRadius: BorderRadius.vertical(
                //               top: Radius.circular(20),
                //             ),
                //           ),
                //           builder: (context) => buildSheetJadwal(),
                //         ),
                //     child: const Icon(
                //       Icons.edit,
                //       color: Colors.blueAccent,
                //     )),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                    onTap: () => showModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                          ),
                          builder: (context) =>
                              buildSheetHapus(id: widget.jadwal.id.toString()),
                        ),
                    child: const Icon(
                      Icons.delete,
                      color: Colors.redAccent,
                    )),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
            const Divider(
              color: Colors.grey,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Text('Hari : ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(widget.jadwal.rangeHari ?? ''),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Text('Jam Mulai : ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(widget.jadwal.jamMulai ?? ''),
                const SizedBox(
                  width: 10,
                ),
                const Text('Jam Akhir : ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(widget.jadwal.jamAkhir ?? ''),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Text('Interval : ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text((widget.jadwal.waktu ?? 0).toString()),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ));
  }

  // Widget buildSheetJadwal() {
  //   return Container(
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(50),
  //         color: Colors.transparent,
  //       ),
  //       child: Column(
  //         children: [
  //           const SizedBox(
  //             height: 10,
  //           ),
  //           Container(
  //             height: 4,
  //             margin: EdgeInsets.only(
  //               right: Get.width / 2 - 40,
  //               left: Get.width / 2 - 40,
  //             ),
  //             decoration: BoxDecoration(
  //               color: const Color(0xFFe0e0e0),
  //               borderRadius: BorderRadius.circular(10),
  //             ),
  //           ),
  //           const SizedBox(
  //             height: 25,
  //           ),
  //           const Padding(
  //             padding: EdgeInsets.only(left: 15),
  //             child: Text("Edit Jadwal",
  //                 style: TextStyle(
  //                     fontWeight: FontWeight.bold,
  //                     fontSize: 16,
  //                     color: Colors.blue)),
  //           ),
  //           const SizedBox(
  //             height: 10,
  //           ),
  //           Expanded(
  //             child: SingleChildScrollView(
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 mainAxisAlignment: MainAxisAlignment.start,
  //                 children: AnimationConfiguration.toStaggeredList(
  //                   duration: const Duration(milliseconds: 275),
  //                   childAnimationBuilder: (widget) => SlideAnimation(
  //                     child: FadeInAnimation(
  //                       child: widget,
  //                     ),
  //                   ),
  //                   children: <Widget>[
  //                     const Padding(
  //                       padding: EdgeInsets.only(left: 15),
  //                       child: Text("Interval *",
  //                           style: TextStyle(
  //                             fontWeight: FontWeight.bold,
  //                           )),
  //                     ),
  //                     const SizedBox(
  //                       height: 10,
  //                     ),
  //                     Row(
  //                       children: [
  //                         const SizedBox(
  //                           width: 5,
  //                         ),
  //                         Expanded(
  //                           child: Container(
  //                             margin: const EdgeInsets.only(left: 10),
  //                             decoration: BoxDecoration(
  //                               color: Colors.white,
  //                               borderRadius: BorderRadius.circular(10),
  //                               border:
  //                                   Border.all(color: const Color(0x6cc7d1db)),
  //                             ),
  //                             child: TextFormField(
  //                               keyboardType: TextInputType.text,
  //                               textInputAction: TextInputAction.done,
  //                               decoration: const InputDecoration(
  //                                 border: InputBorder.none,
  //                                 focusedBorder: InputBorder.none,
  //                                 enabledBorder: InputBorder.none,
  //                                 errorBorder: InputBorder.none,
  //                                 disabledBorder: InputBorder.none,
  //                                 contentPadding: EdgeInsets.only(
  //                                     left: 15, bottom: 11, top: 13, right: 15),
  //                                 filled: true,
  //                                 fillColor: Colors.transparent,
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                         const SizedBox(
  //                           width: 5,
  //                         ),
  //                         const Text('Menit'),
  //                         const SizedBox(
  //                           width: 10,
  //                         ),
  //                       ],
  //                     ),
  //                     const SizedBox(
  //                       height: 10,
  //                     ),
  //                     const Padding(
  //                       padding: EdgeInsets.only(left: 15),
  //                       child: Text("Jam Mulai *",
  //                           style: TextStyle(
  //                             fontWeight: FontWeight.bold,
  //                           )),
  //                     ),
  //                     const SizedBox(
  //                       height: 10,
  //                     ),
  //                     Row(
  //                       children: [
  //                         const SizedBox(
  //                           width: 5,
  //                         ),
  //                         Expanded(
  //                           child: Container(
  //                             padding: const EdgeInsets.only(right: 10),
  //                             margin:
  //                                 const EdgeInsets.only(left: 10, right: 10),
  //                             decoration: BoxDecoration(
  //                               color: Colors.white,
  //                               borderRadius: BorderRadius.circular(10),
  //                               border:
  //                                   Border.all(color: const Color(0x6cc7d1db)),
  //                             ),
  //                             child: Column(
  //                               crossAxisAlignment: CrossAxisAlignment.start,
  //                               mainAxisAlignment: MainAxisAlignment.start,
  //                               children: [
  //                                 DropdownButtonHideUnderline(
  //                                   child: DropdownButton2(
  //                                     isExpanded: true,
  //                                     hint: const Row(
  //                                       children: [
  //                                         SizedBox(
  //                                           width: 4,
  //                                         ),
  //                                         Expanded(
  //                                           child: Text(
  //                                             '0',
  //                                             style: TextStyle(
  //                                               fontSize: 14,
  //                                               fontWeight: FontWeight.normal,
  //                                               color: Colors.black,
  //                                             ),
  //                                             overflow: TextOverflow.ellipsis,
  //                                           ),
  //                                         ),
  //                                       ],
  //                                     ),
  //                                     items: items
  //                                         .map((item) =>
  //                                             DropdownMenuItem<String>(
  //                                               value: item,
  //                                               child: Text(
  //                                                 item,
  //                                                 style: const TextStyle(
  //                                                   fontSize: 14,
  //                                                   fontWeight: FontWeight.bold,
  //                                                   color: Colors.black,
  //                                                 ),
  //                                                 overflow:
  //                                                     TextOverflow.ellipsis,
  //                                               ),
  //                                             ))
  //                                         .toList(),
  //                                     value: selectedValue,
  //                                     onChanged: (value) {
  //                                       setState(() {
  //                                         selectedValue = value as String;
  //                                       });
  //                                     },
  //                                   ),
  //                                 ),
  //                               ],
  //                             ),
  //                           ),
  //                         ),
  //                         Expanded(
  //                           child: Container(
  //                             padding: const EdgeInsets.only(right: 10),
  //                             margin:
  //                                 const EdgeInsets.only(left: 10, right: 10),
  //                             decoration: BoxDecoration(
  //                               color: Colors.white,
  //                               borderRadius: BorderRadius.circular(10),
  //                               border:
  //                                   Border.all(color: const Color(0x6cc7d1db)),
  //                             ),
  //                             child: Column(
  //                               crossAxisAlignment: CrossAxisAlignment.start,
  //                               mainAxisAlignment: MainAxisAlignment.start,
  //                               children: [
  //                                 DropdownButtonHideUnderline(
  //                                   child: DropdownButton2(
  //                                     isExpanded: true,
  //                                     hint: const Row(
  //                                       children: [
  //                                         SizedBox(
  //                                           width: 4,
  //                                         ),
  //                                         Expanded(
  //                                           child: Text(
  //                                             '00',
  //                                             style: TextStyle(
  //                                               fontSize: 14,
  //                                               fontWeight: FontWeight.normal,
  //                                               color: Colors.black,
  //                                             ),
  //                                             overflow: TextOverflow.ellipsis,
  //                                           ),
  //                                         ),
  //                                       ],
  //                                     ),
  //                                     items: items
  //                                         .map((item) =>
  //                                             DropdownMenuItem<String>(
  //                                               value: item,
  //                                               child: Text(
  //                                                 item,
  //                                                 style: const TextStyle(
  //                                                   fontSize: 14,
  //                                                   fontWeight: FontWeight.bold,
  //                                                   color: Colors.black,
  //                                                 ),
  //                                                 overflow:
  //                                                     TextOverflow.ellipsis,
  //                                               ),
  //                                             ))
  //                                         .toList(),
  //                                     value: selectedValue,
  //                                     onChanged: (value) {
  //                                       setState(() {
  //                                         selectedValue = value as String;
  //                                       });
  //                                     },
  //                                   ),
  //                                 ),
  //                               ],
  //                             ),
  //                           ),
  //                         ),
  //                         const SizedBox(
  //                           width: 10,
  //                         ),
  //                       ],
  //                     ),
  //                     const SizedBox(
  //                       height: 10,
  //                     ),
  //                     const Padding(
  //                       padding: EdgeInsets.only(left: 15),
  //                       child: Text("Jam Akhir *",
  //                           style: TextStyle(
  //                             fontWeight: FontWeight.bold,
  //                           )),
  //                     ),
  //                     const SizedBox(
  //                       height: 10,
  //                     ),
  //                     Row(
  //                       children: [
  //                         const SizedBox(
  //                           width: 5,
  //                         ),
  //                         Expanded(
  //                           child: Container(
  //                             padding: const EdgeInsets.only(right: 10),
  //                             margin:
  //                                 const EdgeInsets.only(left: 10, right: 10),
  //                             decoration: BoxDecoration(
  //                               color: Colors.white,
  //                               borderRadius: BorderRadius.circular(10),
  //                               border:
  //                                   Border.all(color: const Color(0x6cc7d1db)),
  //                             ),
  //                             child: Column(
  //                               crossAxisAlignment: CrossAxisAlignment.start,
  //                               mainAxisAlignment: MainAxisAlignment.start,
  //                               children: [
  //                                 DropdownButtonHideUnderline(
  //                                   child: DropdownButton2(
  //                                     isExpanded: true,
  //                                     hint: const Row(
  //                                       children: [
  //                                         SizedBox(
  //                                           width: 4,
  //                                         ),
  //                                         Expanded(
  //                                           child: Text(
  //                                             '0',
  //                                             style: TextStyle(
  //                                               fontSize: 14,
  //                                               fontWeight: FontWeight.normal,
  //                                               color: Colors.black,
  //                                             ),
  //                                             overflow: TextOverflow.ellipsis,
  //                                           ),
  //                                         ),
  //                                       ],
  //                                     ),
  //                                     items: items
  //                                         .map((item) =>
  //                                             DropdownMenuItem<String>(
  //                                               value: item,
  //                                               child: Text(
  //                                                 item,
  //                                                 style: const TextStyle(
  //                                                   fontSize: 14,
  //                                                   fontWeight: FontWeight.bold,
  //                                                   color: Colors.black,
  //                                                 ),
  //                                                 overflow:
  //                                                     TextOverflow.ellipsis,
  //                                               ),
  //                                             ))
  //                                         .toList(),
  //                                     value: selectedValue,
  //                                     onChanged: (value) {
  //                                       setState(() {
  //                                         selectedValue = value as String;
  //                                       });
  //                                     },
  //                                   ),
  //                                 ),
  //                               ],
  //                             ),
  //                           ),
  //                         ),
  //                         Expanded(
  //                           child: Container(
  //                             padding: const EdgeInsets.only(right: 10),
  //                             margin:
  //                                 const EdgeInsets.only(left: 10, right: 10),
  //                             decoration: BoxDecoration(
  //                               color: Colors.white,
  //                               borderRadius: BorderRadius.circular(10),
  //                               border:
  //                                   Border.all(color: const Color(0x6cc7d1db)),
  //                             ),
  //                             child: Column(
  //                               crossAxisAlignment: CrossAxisAlignment.start,
  //                               mainAxisAlignment: MainAxisAlignment.start,
  //                               children: [
  //                                 DropdownButtonHideUnderline(
  //                                   child: DropdownButton2(
  //                                     isExpanded: true,
  //                                     hint: const Row(
  //                                       children: [
  //                                         SizedBox(
  //                                           width: 4,
  //                                         ),
  //                                         Expanded(
  //                                           child: Text(
  //                                             '00',
  //                                             style: TextStyle(
  //                                               fontSize: 14,
  //                                               fontWeight: FontWeight.normal,
  //                                               color: Colors.black,
  //                                             ),
  //                                             overflow: TextOverflow.ellipsis,
  //                                           ),
  //                                         ),
  //                                       ],
  //                                     ),
  //                                     items: items
  //                                         .map((item) =>
  //                                             DropdownMenuItem<String>(
  //                                               value: item,
  //                                               child: Text(
  //                                                 item,
  //                                                 style: const TextStyle(
  //                                                   fontSize: 14,
  //                                                   fontWeight: FontWeight.bold,
  //                                                   color: Colors.black,
  //                                                 ),
  //                                                 overflow:
  //                                                     TextOverflow.ellipsis,
  //                                               ),
  //                                             ))
  //                                         .toList(),
  //                                     value: selectedValue,
  //                                     onChanged: (value) {
  //                                       setState(() {
  //                                         selectedValue = value as String;
  //                                       });
  //                                     },
  //                                   ),
  //                                 ),
  //                               ],
  //                             ),
  //                           ),
  //                         ),
  //                         const SizedBox(
  //                           width: 10,
  //                         ),
  //                       ],
  //                     ),
  //                     const SizedBox(
  //                       height: 10,
  //                     ),
  //                     const Padding(
  //                       padding: EdgeInsets.only(left: 15),
  //                       child: Text("Hari Dokter Masuk",
  //                           style: TextStyle(
  //                               fontWeight: FontWeight.bold, fontSize: 17)),
  //                     ),
  //                     const SizedBox(
  //                       height: 10,
  //                     ),
  //                     Row(
  //                       children: [
  //                         Checkbox(
  //                           checkColor: Colors.white,
  //                           value: isChecked,
  //                           onChanged: (bool? value) {
  //                             setState(() {
  //                               isChecked = value!;
  //                             });
  //                           },
  //                         ),
  //                         const Padding(
  //                           padding: EdgeInsets.only(left: 0),
  //                           child: Text("Senin",
  //                               style:
  //                                   TextStyle(fontWeight: FontWeight.normal)),
  //                         ),
  //                         Checkbox(
  //                           checkColor: Colors.white,
  //                           value: isChecked,
  //                           onChanged: (bool? value) {
  //                             setState(() {
  //                               isChecked = value!;
  //                             });
  //                           },
  //                         ),
  //                         const Padding(
  //                           padding: EdgeInsets.only(left: 0),
  //                           child: Text("Selasa",
  //                               style:
  //                                   TextStyle(fontWeight: FontWeight.normal)),
  //                         ),
  //                         Checkbox(
  //                           checkColor: Colors.white,
  //                           value: isChecked,
  //                           onChanged: (bool? value) {
  //                             setState(() {
  //                               isChecked = value!;
  //                             });
  //                           },
  //                         ),
  //                         const Padding(
  //                           padding: EdgeInsets.only(left: 0),
  //                           child: Text("Rabu",
  //                               style: TextStyle(
  //                                 fontWeight: FontWeight.normal,
  //                               )),
  //                         ),
  //                         Checkbox(
  //                           checkColor: Colors.white,
  //                           value: isChecked,
  //                           onChanged: (bool? value) {
  //                             setState(() {
  //                               isChecked = value!;
  //                             });
  //                           },
  //                         ),
  //                         const Padding(
  //                           padding: EdgeInsets.only(left: 0),
  //                           child: Text("Kamis",
  //                               style: TextStyle(
  //                                 fontWeight: FontWeight.normal,
  //                               )),
  //                         ),
  //                       ],
  //                     ),
  //                     Row(
  //                       children: [
  //                         Checkbox(
  //                           checkColor: Colors.white,
  //                           value: isChecked,
  //                           onChanged: (bool? value) {
  //                             setState(() {
  //                               isChecked = value!;
  //                             });
  //                           },
  //                         ),
  //                         const Padding(
  //                           padding: EdgeInsets.only(left: 0),
  //                           child: Text("Sabtu",
  //                               style:
  //                                   TextStyle(fontWeight: FontWeight.normal)),
  //                         ),
  //                         Checkbox(
  //                           checkColor: Colors.white,
  //                           value: isChecked,
  //                           onChanged: (bool? value) {
  //                             setState(() {
  //                               isChecked = value!;
  //                             });
  //                           },
  //                         ),
  //                         const Padding(
  //                           padding: EdgeInsets.only(left: 0),
  //                           child: Text("Minggu",
  //                               style:
  //                                   TextStyle(fontWeight: FontWeight.normal)),
  //                         ),
  //                       ],
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ),
  //           const SizedBox(
  //             height: 10,
  //           ),
  //           InkWell(
  //             child: Container(
  //               height: 45,
  //               width: 145,
  //               decoration: BoxDecoration(
  //                 color: const Color.fromARGB(255, 56, 229, 77),
  //                 borderRadius: BorderRadius.circular(10),
  //               ),
  //               child: const Column(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: [
  //                   Text(
  //                     "Tambah",
  //                     style: TextStyle(
  //                         color: Colors.white,
  //                         fontWeight: FontWeight.bold,
  //                         fontSize: 14),
  //                   )
  //                 ],
  //               ),
  //             ),
  //           ),
  //           const SizedBox(
  //             height: 10,
  //           ),
  //         ],
  //       ));
  // }

  Widget buildSheetHapus({required String id}) {
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
              child: Text("Hapus Jadwal Dokter",
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
                      const Center(
                        child: Text(
                            'Apakah anda ingin menghapus Jadwal Dokter ini ?'),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: () async {
                HapticFeedback.lightImpact();
                Get.defaultDialog(
                  backgroundColor: const Color(0x00e0e0e0),
                  content: Loading(),
                  title: '',
                  barrierDismissible: false,
                );
                final deleteJadwal = await API.deleteJadwalDokter(id: id);
                print(id);
                Get.back();
                if (deleteJadwal.code != 200) {
                  Get.snackbar(deleteJadwal.code.toString(),
                      deleteJadwal.msg.toString());
                } else {
                  Get.offNamed(Routes.JADWAL_DOKTER);
                }
              },
              child: Container(
                height: 45,
                width: 145,
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Hapus",
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
