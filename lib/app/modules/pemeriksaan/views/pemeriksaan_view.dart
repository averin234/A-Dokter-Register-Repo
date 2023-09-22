import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pemeriksaan_controller.dart';

class PemeriksaanView extends GetView<PemeriksaanController> {
  PemeriksaanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PemeriksaanView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'PemeriksaanView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
