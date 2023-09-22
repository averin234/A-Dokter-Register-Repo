import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/dosen_controller.dart';

class DosenView extends GetView<DosenController> {
  DosenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DosenView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DosenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
