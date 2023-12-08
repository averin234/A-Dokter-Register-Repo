import 'package:a_dokter_register/app/data/model/dropdown_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class RegisterDosenController extends GetxController {
  final namaController = TextEditingController();
  final emailController = TextEditingController();
  final noTelpController = TextEditingController();
  final falkultasController = TextEditingController();
  final universitasController = TextEditingController();
  final noindukdosenController = TextEditingController();
  final gender = [
    Dropdowns(kategori: 'Pria', initialValue: 'L'),
    Dropdowns(kategori: 'Wanita', initialValue: 'P')
  ];
  final golDar = [
    Dropdowns(kategori: 'A+', initialValue: 'A+'),
    Dropdowns(kategori: 'A-', initialValue: 'A-'),
    Dropdowns(kategori: 'B+', initialValue: 'B+'),
    Dropdowns(kategori: 'B-', initialValue: 'B-'),
    Dropdowns(kategori: 'AB+', initialValue: 'AB+'),
    Dropdowns(kategori: 'AB-', initialValue: 'AB-'),
    Dropdowns(kategori: 'O+', initialValue: 'O+'),
    Dropdowns(kategori: 'O-', initialValue: 'O-'),
    Dropdowns(kategori: 'Belum Diperiksa', initialValue: 'Belum Diperiksa'),
  ];

  @override
  void onInit() async {
    if (!await launchUrl(Uri.parse("https://a-dokter.id/register_dosen.php"))) {
      throw Exception(
          'Could not launch https://a-dokter.id/register_dosen.php');
    }
    super.onInit();
  }
}
