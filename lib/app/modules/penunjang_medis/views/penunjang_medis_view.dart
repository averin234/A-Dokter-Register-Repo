import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/penunjang_medis_controller.dart';

class PenunjangMedisView extends GetView<PenunjangMedisController> {
  const PenunjangMedisView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PenunjangMedisView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PenunjangMedisView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
