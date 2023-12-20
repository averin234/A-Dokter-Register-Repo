import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import 'local_storage.dart';

class UniverseController extends GetxController {
  final getDataRegist = LocalStorages.getDataRegist.obs;
  final getToken = LocalStorages.getToken.obs;
}

class Publics {
  static var controller = Get.put(UniverseController());
  static Future<void> launch(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
}
