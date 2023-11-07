import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/mahasiswa_controller.dart';

class MahasiswaView extends GetView<MahasiswaController> {
  const MahasiswaView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MahasiswaView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MahasiswaView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
