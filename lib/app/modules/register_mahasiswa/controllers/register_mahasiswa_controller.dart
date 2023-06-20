import 'package:a_dokter_register/app/data/model/dropdown_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterMahasiswaController extends GetxController {
  final nikPasienController = TextEditingController();
  final namaController = TextEditingController();
  final emailController = TextEditingController();
  final noTelpController = TextEditingController();
  final tglLhrController = TextEditingController();
  final tempatLhrController = TextEditingController();
  final alamatController = TextEditingController();
  final jenisKelaminController = TextEditingController();
  final alergiController = TextEditingController();
  final golDarahController = TextEditingController();
  final passwordController = TextEditingController().obs;
  final confirmPassController = TextEditingController().obs;
  final isObscurePass = true.obs;
  final isObscureConfirmPass = true.obs;
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
}
