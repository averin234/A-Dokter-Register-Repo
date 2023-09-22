import 'package:a_dokter_register/app/data/componen/fetch_data.dart';
import 'package:a_dokter_register/app/data/model/jadwal_dokter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../routes/app_pages.dart';
import '../../../loading_summer/loading_screen_animed.dart';
import '../jadwal_dokter_view.dart';

class CardJadwal extends StatefulWidget {
  final Jadwal jadwal;
  CardJadwal({super.key, required this.jadwal});

  @override
  State<CardJadwal> createState() => _CardJadwalState();
}

class _CardJadwalState extends State<CardJadwal> {
  late RefreshController _refreshController;
  void _refreshPage() {
    setState(() {
      _refreshController = RefreshController();
      Get.back();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(left: 10, right: 10, top: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color(0x6cc7d1db)),
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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Jadwal Dokter",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                // GestureDetector(
                //     onTap: () => showModalBottomSheet(
                //           context: context,
                //           shape:  RoundedRectangleBorder(
                //             borderRadius: BorderRadius.vertical(
                //               top: Radius.circular(20),
                //             ),
                //           ),
                //           builder: (context) => buildSheetJadwal(),
                //         ),
                //     child:  Icon(
                //       Icons.edit,
                //       color: Colors.blueAccent,
                //     )),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                    onTap: () => showModalBottomSheet(
                          context: context,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                          ),
                          builder: (context) =>
                              buildSheetHapus(id: widget.jadwal.id.toString()),
                        ),
                    child: Icon(
                      Icons.delete,
                      color: Colors.redAccent,
                    )),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            Divider(
              color: Colors.grey,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text('Hari : ', style: TextStyle(fontWeight: FontWeight.bold)),
                Text(widget.jadwal.rangeHari ?? ''),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text('Jam Mulai : ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(widget.jadwal.jamMulai ?? ''),
                SizedBox(
                  width: 10,
                ),
                Text('Jam Akhir : ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(widget.jadwal.jamAkhir ?? ''),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text('Interval : ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text((widget.jadwal.waktu ?? 0).toString()),
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ));
  }

  Widget buildSheetHapus({required String id}) {
    return Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.transparent,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              height: 4,
              margin: EdgeInsets.only(
                right: Get.width / 2 - 40,
                left: Get.width / 2 - 40,
              ),
              decoration: BoxDecoration(
                color: Color(0xFFe0e0e0),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text("Hapus Jadwal Dokter",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.blue)),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: AnimationConfiguration.toStaggeredList(
                    duration: Duration(milliseconds: 275),
                    childAnimationBuilder: (widget) => SlideAnimation(
                      child: FadeInAnimation(
                        child: widget,
                      ),
                    ),
                    children: <Widget>[
                      Center(
                        child: Text(
                            'Apakah anda ingin menghapus Jadwal Dokter ini ?'),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            InkWell(
              onTap: () async {
                HapticFeedback.lightImpact();
                Get.defaultDialog(
                  backgroundColor: Color(0x00e0e0e0),
                  content: Loading(),
                  title: '',
                  barrierDismissible: false,
                );
                final deleteJadwal = await API.deleteJadwalDokter(id: id);
                if (deleteJadwal.code != 200) {
                  Get.snackbar(deleteJadwal.code.toString(),
                      deleteJadwal.msg.toString());
                } else {
                  Get.back();
                  Navigator.pop(context); // Close the bottom sheet
                  _refreshPage();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => JadwalDokterView()));
                }
              },
              child: Container(
                height: 45,
                width: 145,
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
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
            SizedBox(
              height: 10,
            ),
          ],
        ));
  }
}
