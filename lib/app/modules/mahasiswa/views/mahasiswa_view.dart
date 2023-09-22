import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/mahasiswa_controller.dart';

class MahasiswaView extends GetView<MahasiswaController> {
  MahasiswaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MahasiswaView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'MahasiswaView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
