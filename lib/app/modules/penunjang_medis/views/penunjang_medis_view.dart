import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/penunjang_medis_controller.dart';

class PenunjangMedisView extends GetView<PenunjangMedisController> {
  PenunjangMedisView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PenunjangMedisView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'PenunjangMedisView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
