import 'package:a_dokter_register/app/data/componen/fetch_data.dart';
import 'package:a_dokter_register/app/data/componen/publics.dart';
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
      children: AnimationConfiguration.toStaggeredList(
        duration: const Duration(milliseconds: 375),
        childAnimationBuilder: (widget) => ScaleAnimation(
          child: FadeInAnimation(
            child: widget,
          ),
        ),
        children: <Widget>[
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
            padding:
                const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              // Text(
              //   'Pengaturan Akun',
              //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              // ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () => showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  builder: (context) => UbahPassword(),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.history_edu,
                      color: Colors.grey,
                      size: 24.0,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Ubah Password',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          Text(
                            'Mengubah Password agar kerahasiaan akun terjaga',
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // InkWell(
              //     onTap: () => Get.toNamed(Routes.RIWAYAT_PRAKTEK),
              //     child :
              //       Row(
              //         children: [
              //           Icon(
              //             Icons.history_edu,
              //             color: Colors.grey,
              //             size: 24.0,
              //           ),
              //           SizedBox(
              //             width: 10,
              //           ),
              //           Expanded(child:
              //           Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Text('Riwayat Praktek',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              //               Text('Menambahkan Nomer Izin Peraktek, Provinsi, Kota, Status',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 12),),
              //             ],),),
              //         ],),),
              // SizedBox(
              //   height: 20,
              // ),
              // InkWell(
              //   onTap: () => Get.toNamed(Routes.RIWAYAT_PENDIDIKAN),
              //   child: Row(
              //     children: [
              //       Icon(
              //         Icons.history_edu,
              //         color: Colors.grey,
              //         size: 24.0,
              //       ),
              //       SizedBox(
              //         width: 10,
              //       ),
              //       Expanded(
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Text(
              //               'Riwayat Pendidikan',
              //               style: TextStyle(
              //                   fontWeight: FontWeight.bold, fontSize: 15),
              //             ),
              //             Text(
              //               'Menambahkan Nama Instansi, Tahun Mulai, Tahun Lulus, Jurusan, Gelar',
              //               style: TextStyle(
              //                   fontWeight: FontWeight.normal, fontSize: 12),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),

              // SizedBox(
              //   height: 20,
              // ),
              // InkWell(
              //   onTap: () => Get.toNamed(Routes.RIWAYAT_JABATAN),
              //   child: Row(
              //     children: [
              //       Icon(
              //         Icons.history_edu,
              //         color: Colors.grey,
              //         size: 24.0,
              //       ),
              //       SizedBox(
              //         width: 10,
              //       ),
              //       Expanded(
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Text(
              //               'Riwayat Jabatan',
              //               style: TextStyle(
              //                   fontWeight: FontWeight.bold, fontSize: 15),
              //             ),
              //             Text(
              //               'Menambahkan Nama Instansi, Spesialisasi, Tahun Jabatan',
              //               style: TextStyle(
              //                   fontWeight: FontWeight.normal, fontSize: 12),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: 20,
              // ),
              // InkWell(
              //   onTap: () => Get.toNamed(Routes.RIWAYAT_KELUARGA),
              //   child: Row(
              //     children: [
              //       Icon(
              //         Icons.history_edu,
              //         color: Colors.grey,
              //         size: 24.0,
              //       ),
              //       SizedBox(
              //         width: 10,
              //       ),
              //       Expanded(
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Text(
              //               'Riwayat Keluarga',
              //               style: TextStyle(
              //                   fontWeight: FontWeight.bold, fontSize: 15),
              //             ),
              //             Text(
              //               'Menambahkan Nama Keluarga, Status Keluarga, Tanggal Lahir',
              //               style: TextStyle(
              //                   fontWeight: FontWeight.normal, fontSize: 12),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: 20,
              // ),
              InkWell(
                onTap: () => Get.toNamed(Routes.CV),
                child: Row(
                  children: [
                    const Icon(
                      Icons.history_edu,
                      color: Colors.grey,
                      size: 24.0,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'CV',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          Text(
                            'Melihat Riwayat CV',
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // InkWell(
              //   onTap: () => Get.toNamed(Routes.PERJANJIAN_DOKTER),
              //   child: Row(
              //     children: [
              //       Icon(
              //         Icons.history_edu,
              //         color: Colors.grey,
              //         size: 24.0,
              //       ),
              //       SizedBox(
              //         width: 10,
              //       ),
              //       Expanded(
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Text(
              //               'Perjanjian Dokter',
              //               style: TextStyle(
              //                   fontWeight: FontWeight.bold, fontSize: 15),
              //             ),
              //             Text(
              //               'Menambahkan Nomer STR, Nomer Kontrak, Masa Berlaku',
              //               style: TextStyle(
              //                   fontWeight: FontWeight.normal, fontSize: 12),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: 20,
              // ),
              InkWell(
                onTap: () => Get.toNamed(Routes.PRIVYID),
                child: Row(
                  children: [
                    const Icon(
                      Icons.history_edu,
                      color: Colors.grey,
                      size: 24.0,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Privyid',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          Text(
                            'Privyid Connect',
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ]),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
            padding:
                const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
            decoration: BoxDecoration(
              color: Colors.redAccent,
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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              InkWell(
                onTap: () => showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  builder: (context) => buildSheet(),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.logout,
                      color: Colors.white,
                      size: 24.0,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Logout',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Widget UbahPassword() {
    final controller = Get.put(ProfileController());
    return Container(
        height: 380,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.transparent,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 4,
              margin: EdgeInsets.only(
                right: Get.width / 2 - 40,
                left: Get.width / 2 - 40,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFe0e0e0),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
                child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text("Password Lama",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: const Color(0x6cc7d1db)),
                          ),
                          child: TextFormField(
                            controller: controller.pwlamaController,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                  left: 15, bottom: 11, top: 13, right: 15),
                              filled: true,
                              fillColor: Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text("Password Baru",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: const Color(0x6cc7d1db)),
                          ),
                          child: TextFormField(
                            controller: controller.pwbaruController,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                  left: 15, bottom: 11, top: 13, right: 15),
                              filled: true,
                              fillColor: Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text("Comfirm Password Baru",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: const Color(0x6cc7d1db)),
                          ),
                          child: TextFormField(
                            controller: controller.confirmpwbaruController,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                  left: 15, bottom: 11, top: 13, right: 15),
                              filled: true,
                              fillColor: Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10, top: 20),
                  child: GestureDetector(
                    onTap: () async {
                      if (controller.pwbaruController.text.isNotEmpty &&
                          controller.confirmpwbaruController.text.isNotEmpty) {
                        final postUbahPassword = await API.postUbahPassword(
                          email: Publics.controller.getDataRegist.value.email ??
                              '',
                          pw_baru: controller.pwbaruController.text,
                          pw_lama: controller.pwlamaController.text,
                        );
                        if (postUbahPassword.code == 200) {
                          Get.back();
                        } else {
                          Get.defaultDialog(
                            title: (postUbahPassword.code ?? 0).toString(),
                            content: Text(postUbahPassword.msg ?? ''),
                          );
                        }
                      } else {
                        Get.snackbar(
                            '500', 'Password dan Confirm Password harus sama');
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Colors.blue,
                      ),
                      child: Column(
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(16),
                            child: Text("Ubah Password",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }

  Widget buildSheet() {
    return Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.transparent,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 4,
              margin: EdgeInsets.only(
                right: Get.width / 2 - 40,
                left: Get.width / 2 - 40,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFe0e0e0),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
                child: Center(
              child: Column(
                children: [
                  const Text("Apkah ingin Logout/ keluar dari Aplikasi?",
                      style: TextStyle(
                          color: Colors.black45,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center),
                  const SizedBox(
                    height: 5,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Image.asset(
                  //   "assets/images/login_sukses.png",
                  //   gaplessPlayback: true,
                  //   fit: BoxFit.fitHeight,
                  //   width: 200,
                  //   height: 200,
                  // ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 10, left: 10, top: 20),
                        child: GestureDetector(
                          onTap: () => Get.toNamed(Routes.LOGIN),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: Colors.redAccent,
                            ),
                            child: Column(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Text("Logout",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )),
          ],
        ));
  }
}
