import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HissController extends GetxController {
  //TODO: Implement HissController
  final noRegistrasi = Get.parameters['no_registrasi'] as String;
  final noMr = Get.parameters['no_mr'] as String;
  final subjectiveController = TextEditingController();
  final objectiveController = TextEditingController();
  final analystController = TextEditingController();
}
