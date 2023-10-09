import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:package_info/package_info.dart';

class PendapatanDokterController extends GetxController {
  //TODO: Implement PendapatanDokterController
  final InAppUpdate inAppUpdate = InAppUpdate();
  get updateAvailable => null;

  Future<void> checkForUpdate() async {
    final packageInfo = await PackageInfo.fromPlatform();
    final currentVersion = packageInfo.version;

    try {
      final updateInfo = await InAppUpdate.checkForUpdate();
      if (updateInfo.flexibleUpdateAllowed) {
        final latestVersion = updateInfo.availableVersionCode.toString();
        if (currentVersion != latestVersion) {
          showUpdateDialog();
        }
      }
    } catch (e) {
      print('Error checking for updates: $e');
    }
  }

  void showUpdateDialog() {
    Get.defaultDialog(
      title: 'Pembaruan Tersedia',
      content: Column(
        children: [
          Image.asset(
            "assets/images/adokter_update.png",
            gaplessPlayback: true,
            fit: BoxFit.fitHeight,
            height: 200,
          ),
          Text('Versi baru aplikasi tersedia. Apakah Anda ingin mengunduh pembaruan sekarang?', textAlign: TextAlign.center),
        ],
      ),

      confirm: InkWell(
        onTap: () async{
          await InAppUpdate.performImmediateUpdate();
          Get.back();
        },
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue
          ),
          child : Center(
            child : Text('Unduh Sekarang', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ),
      ),

    );
  }
  final count = TextEditingController();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
