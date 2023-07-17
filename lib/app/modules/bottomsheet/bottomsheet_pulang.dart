import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import 'bottomsheet_selesai_pemeriksaan.dart';

Future bottomSheetPulang() {
  return showModalBottomSheet(
      context: Get.context!,
      isScrollControlled: true,
      isDismissible: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
            height: 540,
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
                SingleChildScrollView(
                  child: Center(
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
                          const Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                                'Keterangan :\n\n1.Tombol ini dipilih Karena\n-semua tindakan yang dilakukan telah masuk ke dalam sistem\n-obat yang digunakan\n\n2.Prosess akan dilanjutkan ke Kasir\n\n3.Apabila masih ada tindakan yang belum masuk ke dalam sistem ?\n\n-Tekan tombol cancel\n-Masukan tindakan yang belum masuk\n-Masukan obat yang belum Masuk\n4.Jika ada tindak\nyang belum ada di nama tindakan maka :\n-Hubungi orang terkait untuk meminta memasukan tindakan ke dalam data nama tindakan-Hubungi team IT jika terdapat Error\n\nTekan OK untuk melanjutkan ke Kasir atau Cancel untuk membatalkan'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        bottomSheetSelesaiPemeriksaan();
                      },
                      child: Container(
                        height: 45,
                        width: 145,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Pulang",
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
                      width: 10,
                    ),
                    InkWell(
                      child: Container(
                        height: 45,
                        width: 145,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10),
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Cencel",
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
                ),
              ],
            ));
      });
}
