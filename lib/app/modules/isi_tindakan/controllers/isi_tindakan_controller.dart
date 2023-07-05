import 'package:a_dokter_register/app/data/model/get_detail_mr.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IsiTindakanController extends GetxController {
  //TODO: Implement IsiTindakanController

  final detailMr = Get.arguments as GetDetailMR;
  final namaTindakanController = TextEditingController();
  final jumlahTindakanController = TextEditingController();
  final obatTindakanController = TextEditingController();
  final jumlahObatTindakanController = TextEditingController();
}
