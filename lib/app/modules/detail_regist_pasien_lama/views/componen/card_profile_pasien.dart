import 'package:a_dokter_register/app/data/componen/avatar.dart';
import 'package:a_dokter_register/app/data/componen/fetch_data.dart';
import 'package:a_dokter_register/app/data/model/get_detail_pasien.dart';
import 'package:a_dokter_register/app/modules/detail_regist_pasien_lama/controllers/detail_regist_pasien_lama_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileLama extends StatefulWidget {
  const ProfileLama({super.key});

  @override
  State<ProfileLama> createState() => _ProfileLamaState();
}

class _ProfileLamaState extends State<ProfileLama> {
  final controller = Get.put(DetailRegistPasienLamaController());
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10, left: 10),
      padding: const EdgeInsets.only(right: 10, left: 10, bottom: 10),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0x6cc7d1db)),
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
      child: FutureBuilder(
          future: API.getDetailPasien(no_mr: controller.noMr),
          builder: (context, snapshot) {
            if (snapshot.hasData &&
                snapshot.connectionState != ConnectionState.waiting &&
                snapshot.data != null) {
              final data = snapshot.data!.pasien ?? Pasien();
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 270,
                        child: Text(data.namaPasien ?? '',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CircleAvatar(
                        radius: 30.0,
                        backgroundImage: NetworkImage(
                          data.urlFotoPasien ??
                              (data.jenKelamin == '2'
                                  ? Avatar.perempuan
                                  : Avatar.lakiLaki),
                        ),
                        backgroundColor: Colors.transparent,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Divider(
                    height: 3,
                    color: Colors.grey,
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("No MR",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 13)),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Umur",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 13)),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Golongan Darah",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 13)),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Jenis Kelamin",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 13)),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Alergi",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 13)),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text(":",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13)),
                                const SizedBox(
                                  width: 6,
                                ),
                                Text(data.noMr ?? '',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13)),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const Text(":",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13)),
                                const SizedBox(
                                  width: 6,
                                ),
                                Text("${data.umur ?? ''} tahun",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13)),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const Text(":",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13)),
                                const SizedBox(
                                  width: 6,
                                ),
                                Text(data.golDarah ?? '',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13)),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const Text(":",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13)),
                                const SizedBox(
                                  width: 6,
                                ),
                                FutureBuilder(
                                    future: API.cekJenisKelamin(
                                        jenis_kelamin: data.jenKelamin ?? ''),
                                    builder: (context, snapshot) {
                                      if (snapshot.data != null &&
                                          snapshot.connectionState !=
                                              ConnectionState.waiting &&
                                          snapshot.hasData) {
                                        return Text(snapshot.data!.msg ?? '',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13));
                                      } else {
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      }
                                    }),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const Text(":",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13)),
                                const SizedBox(
                                  width: 6,
                                ),
                                Text(data.alergi ?? '',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13)),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
