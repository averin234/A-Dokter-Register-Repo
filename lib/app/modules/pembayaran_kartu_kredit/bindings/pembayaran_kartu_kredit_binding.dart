import 'package:get/get.dart';

import '../controllers/pembayaran_kartu_kredit_controller.dart';

class PembayaranKartuKreditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PembayaranKartuKreditController>(
      () => PembayaranKartuKreditController(),
    );
  }
}
