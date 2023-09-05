import 'package:a_dokter_register/app/data/model/get_list_kasir.dart';
import 'package:a_dokter_register/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../bottomsheet/bottomsheet_bayar_kasir.dart';

class Pendapatan extends StatelessWidget {
  final Kasir kasir;
  Pendapatan({super.key, required this.kasir,});
  TextEditingController Pembulatan = TextEditingController(text: '0,00');

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () => Get.toNamed(Routes.DETAIL_TINDAKAN),
      child: Container(
        margin: const EdgeInsets.only(right: 10, left: 10, bottom: 5),
        padding: const EdgeInsets.only(right: 0, left: 10, bottom: 10, top: 10),
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
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: InkWell(
                  onTap: () async{
                    showModalBottomSheet(
                      showDragHandle: true,
                      context: context,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      builder: (context) => Pilihpembayaran(kasir.noRegistrasi ?? ''),
                    );
                    // final tunai = await API.getTunai(no_registrasi: kasir.noRegistrasi ?? '');
                    // Get.defaultDialog(title: tunai.code.toString(), content: Text(tunai.msg ?? ''));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Selesai Periksa',
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold)),
                      Container(
                        padding: const EdgeInsets.only(
                            right: 5, left: 5, top: 10, bottom: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.blue,
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.monetization_on_rounded,
                                color: Colors.white),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Cek Pembayaran Pasien',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Text('No Registrasi ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const Text(': ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(kasir.noRegistrasi ?? '',
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  const Text('Tanggal Masuk ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const Text(': '),
                  Text(kasir.jamMasuk ?? '',
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  const Text('Nama Pasien '),
                  const Text(': '),
                  Text(kasir.namaPasien ?? '',
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Text('Nasabah '),
                  const Text(': '),
                  Text(kasir.namaKelompok ?? ''),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Text('Nama Bagian '),
                  const Text(': '),
                  Text(kasir.namaBagian ?? ''),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(color: Colors.black),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              "Billing",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              // Get.toNamed(Routes.ANTRIAN_PASIEN);
                            },
                            child: Text(
                              "Rp ${kasir.billing}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ]),
              ),
            ],
          ),
        ]),
      ),
    );
  }
  Widget Pilihpembayaran(String nr) {
    return Container(
              height: 280,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.transparent,
              ),
              child: Column(
                  children: [
                    Text('Pilih metode pembayaran', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                    SizedBox(
                      height: 20,
                    ),
                InkWell(
                  onTap: () {
                    Get.back();
                    Get.toNamed(Routes.PEMBAYARAN_TUNAI, parameters: {"nr":nr});
                  },
                child : Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(right: 10, left: 10),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/rp.png',
                          height: 40,
                        ),
                    SizedBox(
                      width: 20,
                    ),
                    Text('Tunai', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white)),
                  ]),
                ),),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                    child : Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(right: 10, left: 10),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/atm.png',
                              height: 40,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text('Kartu Debet', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white)),
                          ]),
                    ),),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                    child : Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(right: 10, left: 10),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/credit.png',
                              height: 40,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text('Kartu Kredit', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white)),
                          ]),
                    ),),
              ]),); //whatever you're returning, does not have to be a Container
             }
  Widget bottomSheetBayar() {
    return  DraggableScrollableSheet(
        initialChildSize: 0.95, //set this as you want
        maxChildSize: 0.95, //set this as you want
        minChildSize: 0.95, //set this as you want
        expand: true,
        builder: (context, scrollController) {
          return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.transparent,
              ),
              child: Column(children: [
                const Text('Geser Kebawah',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey)),
                const SizedBox(
                  height: 25,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 0),
                  child: Text("Pilih Metode Pembayaran",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.blue)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: AnimationConfiguration.toStaggeredList(
                        duration: const Duration(milliseconds: 275),
                        childAnimationBuilder: (widget) => SlideAnimation(
                          child: FadeInAnimation(
                            child: widget,
                          ),
                        ),
                        children: [
                          Container(
                            child: Column(
                              children: [
                                ConstrainedBox(
                                  constraints: const BoxConstraints(
                                      minWidth: double.infinity),
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: const BoxDecoration(
                                      color: Colors.blueAccent,
                                    ),
                                    child: const Text(
                                        'Data  Billing Pasien',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Padding(
                                  padding:
                                  EdgeInsets.only(left: 10, right: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Bagian',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      Text('Biaya (Rp)',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          left: 10, right: 5),
                                      child: SizedBox(
                                        width: 160,
                                        child: Text(
                                          'Total',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                          padding: EdgeInsets.only(right: 10, left: 10, top: 15, bottom: 15),
                                          margin: const EdgeInsets.only(
                                              left: 10, right: 10),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                            BorderRadius.circular(10),
                                            border: Border.all(
                                                color:
                                                const Color(0x6cc7d1db)),
                                          ),
                                          child: Text(kasir.billing ??'')
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                ConstrainedBox(
                                  constraints: const BoxConstraints(
                                      minWidth: double.infinity),
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: const BoxDecoration(
                                      color: Colors.yellowAccent,
                                    ),
                                    child: const Text('Data Pembayaran',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          left: 10, right: 5),
                                      child: SizedBox(
                                        width: 160,
                                        child: Text(
                                          'Pembayar',
                                          style: TextStyle(
                                              fontWeight:
                                              FontWeight.normal),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            left: 10, right: 10),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          border: Border.all(
                                              color:
                                              const Color(0x6cc7d1db)),
                                        ),
                                        child: TextFormField(
                                          keyboardType: TextInputType.text,
                                          textInputAction:
                                          TextInputAction.done,
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            disabledBorder:
                                            InputBorder.none,
                                            contentPadding: EdgeInsets.only(
                                                left: 15,
                                                bottom: 11,
                                                top: 13,
                                                right: 15),
                                            filled: true,
                                            fillColor: Colors.transparent,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding:
                                  EdgeInsets.only(left: 10, right: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Pasien',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      Text(kasir.namaPasien ?? '',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          left: 10, right: 5),
                                      child: SizedBox(
                                        width: 160,
                                        child: Text(
                                          'Jumlah Billing',
                                          style: TextStyle(
                                              fontWeight:
                                              FontWeight.normal),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                          padding: EdgeInsets.only(right: 10, left: 10, top: 15, bottom: 15),
                                          margin: const EdgeInsets.only(
                                              left: 10, right: 10),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                            BorderRadius.circular(10),
                                            border: Border.all(
                                                color:
                                                const Color(0x6cc7d1db)),
                                          ),
                                          child: Text(kasir.billing ??'')
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          left: 10, right: 5),
                                      child: SizedBox(
                                        width: 160,
                                        child: Text(
                                          'Pembulatan',
                                          style: TextStyle(
                                              fontWeight:
                                              FontWeight.normal),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            left: 10, right: 10),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          border: Border.all(
                                              color:
                                              const Color(0x6cc7d1db)),
                                        ),
                                        child: TextFormField(
                                          controller: Pembulatan,
                                          keyboardType: TextInputType.text,
                                          textInputAction:
                                          TextInputAction.done,
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            disabledBorder:
                                            InputBorder.none,
                                            contentPadding: EdgeInsets.only(
                                                left: 15,
                                                bottom: 11,
                                                top: 13,
                                                right: 15),
                                            filled: true,
                                            fillColor: Colors.transparent,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          left: 10, right: 5),
                                      child: SizedBox(
                                        width: 160,
                                        child: Text(
                                          'Total',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            left: 10, right: 10),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          border: Border.all(
                                              color:
                                              const Color(0x6cc7d1db)),
                                        ),
                                        child: TextFormField(
                                          keyboardType: TextInputType.text,
                                          textInputAction:
                                          TextInputAction.done,
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            disabledBorder:
                                            InputBorder.none,
                                            contentPadding: EdgeInsets.only(
                                                left: 15,
                                                bottom: 11,
                                                top: 13,
                                                right: 15),
                                            filled: true,
                                            fillColor: Colors.transparent,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                ConstrainedBox(
                                  constraints: const BoxConstraints(
                                      minWidth: double.infinity),
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: const BoxDecoration(
                                      color: Colors.green,
                                    ),
                                    child: const Text('Tunai',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          left: 10, right: 5),
                                      child: SizedBox(
                                        width: 160,
                                        child: Text(
                                          'Jumlah Pembayaran Tunai',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.redAccent),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            left: 10, right: 10),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          border: Border.all(
                                              color:
                                              const Color(0x6cc7d1db)),
                                        ),
                                        child: TextFormField(
                                          keyboardType: TextInputType.text,
                                          textInputAction:
                                          TextInputAction.done,
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            disabledBorder:
                                            InputBorder.none,
                                            contentPadding: EdgeInsets.only(
                                                left: 15,
                                                bottom: 11,
                                                top: 13,
                                                right: 15),
                                            filled: true,
                                            fillColor: Colors.transparent,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          left: 10, right: 5),
                                      child: SizedBox(
                                        width: 160,
                                        child: Text(
                                          'Uang Yang Dibayarkan',
                                          style: TextStyle(
                                              fontWeight:
                                              FontWeight.normal),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            left: 10, right: 10),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          border: Border.all(
                                              color:
                                              const Color(0x6cc7d1db)),
                                        ),
                                        child: TextFormField(
                                          keyboardType: TextInputType.text,
                                          textInputAction:
                                          TextInputAction.done,
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            disabledBorder:
                                            InputBorder.none,
                                            contentPadding: EdgeInsets.only(
                                                left: 15,
                                                bottom: 11,
                                                top: 13,
                                                right: 15),
                                            filled: true,
                                            fillColor: Colors.transparent,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          left: 10, right: 5),
                                      child: SizedBox(
                                        width: 160,
                                        child: Text(
                                          'Pengambilan Uang',
                                          style: TextStyle(
                                              fontWeight:
                                              FontWeight.normal),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            left: 10, right: 10),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          border: Border.all(
                                              color:
                                              const Color(0x6cc7d1db)),
                                        ),
                                        child: TextFormField(
                                          keyboardType: TextInputType.text,
                                          textInputAction:
                                          TextInputAction.done,
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            disabledBorder:
                                            InputBorder.none,
                                            contentPadding: EdgeInsets.only(
                                                left: 15,
                                                bottom: 11,
                                                top: 13,
                                                right: 15),
                                            filled: true,
                                            fillColor: Colors.transparent,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 1000,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        bottomSheetBayarKasir();
                      },
                      child: Container(
                        height: 45,
                        width: 145,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.green.withOpacity(0.5),
                          //     spreadRadius: 0,
                          //     blurRadius: 10,
                          //     offset: const Offset(2, 1),
                          //   ),
                          // ],
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Bayar",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      child: Container(
                        height: 45,
                        width: 145,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Lihat Billing",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
              ])); //whatever you're returning, does not have to be a Container
        });
  }
}