import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../controllers/pembayaran_tunai_controller.dart';

class Databilling extends GetView<PembayaranTunaiController> {
  const Databilling({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(controller.kasir.namaBagian ?? ''),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Text(controller.kasir.billing ?? ''),
        ),
      ],
    );
  }
}
