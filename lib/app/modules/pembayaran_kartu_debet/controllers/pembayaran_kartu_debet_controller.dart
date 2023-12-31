import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/get_list_kasir.dart';

class PembayaranKartuDebetController extends GetxController {
  //TODO: Implement PembayaranKartuDebetController
  final nr = Get.parameters['nr'] as String;
  Kasir kasir = Get.arguments;
  final pembayar = TextEditingController();
  final pembulatan = TextEditingController();
  final totalcontroller = TextEditingController();
  final jumlahcontroller = TextEditingController();
  final kartukreditcontroller = TextEditingController();
  final kartudebetcontroller = TextEditingController();
  final nokartucontroller = TextEditingController();
  final nobatchcontroller = TextEditingController();
  final bankcontroller = TextEditingController();
  final namabankcontroller = TextEditingController();
  final count = 0.obs;
  @override
  void onInit() {
    pembayar.text = kasir.namaPasien ?? '';
    pembulatan.text = '0,00';
    super.onInit();
  }



  void increment() => count.value++;
}
