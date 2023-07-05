import 'package:a_dokter_register/app/data/componen/fetch_data.dart';
import 'package:a_dokter_register/app/data/model/get_detail_mr.dart';
import 'package:a_dokter_register/app/modules/detail_riwayat/controllers/detail_riwayat_controller.dart';
import 'package:a_dokter_register/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RiwayatResep extends StatelessWidget {
  final List<Resep> resep;
  const RiwayatResep({super.key, required this.resep});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DetailRiwayatController());
    return Container(
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
        crossAxisAlignment: CrossAxisAlignment.center,
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
                child: Text("Resep",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () async {
                  final cetakResep = await API.cetakResep(
                      no_registrasi: controller.noRegistrasi);
                  print('resep : $cetakResep');
                  Get.toNamed(Routes.CETAKAN, arguments: {'file': cetakResep});
                },
                child: Container(
                  height: 30,
                  width: 120,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.5),
                        spreadRadius: 0,
                        blurRadius: 10,
                        offset: const Offset(2, 1),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Print",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
