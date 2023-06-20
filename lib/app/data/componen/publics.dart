import 'package:a_dokter_register/app/data/model/login_and_regist/local_storage.dart';
import 'package:get/get.dart';

class UniverseController extends GetxController {
  final getDataRegist = LocalStorages.getDataRegist.obs;
  final getToken = LocalStorages.getToken.obs;
}

class Publics {
  static var controller = Get.put(UniverseController());
}
