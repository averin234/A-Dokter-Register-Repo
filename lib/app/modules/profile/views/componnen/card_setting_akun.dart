import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';
import '../../controllers/profile_controller.dart';

class CardSettingAkun extends GetView<ProfileController> {
  const CardSettingAkun({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children:AnimationConfiguration.toStaggeredList(
        duration: const Duration(milliseconds: 375),
        childAnimationBuilder: (widget) => ScaleAnimation(
          child: FadeInAnimation(
            child: widget,
          ),
        ),
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.only(top: 10,left: 10,right: 10),
            padding: EdgeInsets.only(top: 10, left: 10,right: 10,bottom: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFe0e0e0).withOpacity(0.5),
                  spreadRadius: 0,
                  blurRadius: 10,
                  offset: const Offset(2, 1),
                ),
              ],
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Pengaturan Akun',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  SizedBox(
                    height: 40,
                  ),
            InkWell(
                onTap: () => Get.toNamed(Routes.JADWAL_DOKTER),
                child :
                  Row(
                    children: [
                      Icon(
                        Icons.history_edu,
                        color: Colors.grey,
                        size: 24.0,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                       Expanded(
                        child:
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Jadwal Dokter',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                          Text('Menambahkan Jadwal Prakter, Jam Mulai, Jam Akhir, Interval',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 12),),
                        ],),),
                    ],),),
                  SizedBox(
                    height: 20,
                  ),
            InkWell(
                onTap: () => Get.toNamed(Routes.RIWAYAT_PRAKTEK),
                child :
                  Row(
                    children: [
                      Icon(
                        Icons.history_edu,
                        color: Colors.grey,
                        size: 24.0,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child:
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Riwayat Praktek',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                          Text('Menambahkan Nomer Izin Peraktek, Provinsi, Kota, Status',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 12),),
                        ],),),
                    ],),),
                  SizedBox(
                    height: 20,
                  ),
            InkWell(
                onTap: () => Get.toNamed(Routes.RIWAYAT_PENDIDIKAN),
                child :
                  Row(
                    children: [
                      Icon(
                        Icons.history_edu,
                        color: Colors.grey,
                        size: 24.0,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child:
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Riwayat Pendidikan',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                          Text('Menambahkan Nama Instansi, Tahun Mulai, Tahun Lulus, Jurusan, Gelar',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 12),),
                        ],),),
                    ],),),

                  SizedBox(
                    height: 20,
                  ),
            InkWell(
                onTap: () => Get.toNamed(Routes.RIWAYAT_JABATAN),
                child :
                  Row(
                    children: [
                      Icon(
                        Icons.history_edu,
                        color: Colors.grey,
                        size: 24.0,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child:
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Riwayat Jabatan',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                          Text('Menambahkan Nama Instansi, Spesialisasi, Tahun Jabatan',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 12),),
                        ],),),
                    ],),),
                  SizedBox(
                    height: 20,
                  ),
            InkWell(
                onTap: () => Get.toNamed(Routes.RIWAYAT_KELUARGA),
                child :
                  Row(
                    children: [
                      Icon(
                        Icons.history_edu,
                        color: Colors.grey,
                        size: 24.0,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child:
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Riwayat Keluarga',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                          Text('Menambahkan Nama Keluarga, Status Keluarga, Tanggal Lahir',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 12),),
                        ],),),
                    ],),),
                  SizedBox(
                    height: 20,
                  ),
            InkWell(
                onTap: () => Get.toNamed(Routes.CV),
                child :
                  Row(
                    children: [
                      Icon(
                        Icons.history_edu,
                        color: Colors.grey,
                        size: 24.0,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child:
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('CV',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                          Text('Melihat Riwayat CV',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 12),),
                        ],),),
                    ],),),
                  SizedBox(
                    height: 20,
                  ),
            InkWell(
                onTap: () => Get.toNamed(Routes.PERJANJIAN_DOKTER),
                child :
                  Row(
                    children: [
                      Icon(
                        Icons.history_edu,
                        color: Colors.grey,
                        size: 24.0,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child:
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Perjanjian Dokter',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                          Text('Menambahkan Nomer STR, Nomer Kontrak, Masa Berlaku',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 12),),
                        ],),),
                    ],),),
                  SizedBox(
                    height: 20,
                  ),
            InkWell(
                onTap: () => Get.toNamed(Routes.PRIVYID),
                child :
                  Row(
                    children: [
                      Icon(
                        Icons.history_edu,
                        color: Colors.grey,
                        size: 24.0,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child:
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Privyid',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                          Text('Privyid Connect',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 12),),
                        ],),),
                    ],),),
                  SizedBox(
                    height: 20,
                  ),

                ]),
          ),
        ],),);
  }

}
