import 'package:a_dokter_register/app/data/model/get_pasien_by.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:search_page/search_page.dart';

import '../../../../data/componen/fetch_data.dart';
import '../../../../data/componen/publics.dart';
import '../../../../data/model/list_data.dart';
import '../../controllers/tindakan_controller.dart';
import 'listview_tindakan.dart';

class SearchTindakanDokter extends StatefulWidget {
  const SearchTindakanDokter({super.key});

  @override
  State<SearchTindakanDokter> createState() => _SearchTindakanDokterState();
}

class _SearchTindakanDokterState extends State<SearchTindakanDokter> {
  final TextEditingController _cityTextEditingController =
  TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          FutureBuilder(
              future: API.getPasienBy(kode_dokter:
              Publics.controller.getDataRegist.value.kode ?? ''),
              builder: (context, snapshot) {
                if (snapshot.hasData &&
                    snapshot.connectionState != ConnectionState.waiting &&
                    snapshot.data != null) {
                  final data = snapshot.data!;
                  return AppTextField(
                    textEditingController: _cityTextEditingController,
                    hint: "Dokter/Spesialisasi",
                    isCitySelected: true,
                    lists: data.list!,
                    title: '',
                  );
                } else {
                  return Container();
                }
              }),
        ],
      ),
    );
  }
}

/// This is Common App textfiled class.
class AppTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String title;
  final String hint;
  final bool isCitySelected;
  final List<Lists> lists;

  const AppTextField({
    required this.textEditingController,
    required this.title,
    required this.hint,
    required this.isCitySelected,
    required this.lists,
    Key? key,
  }) : super(key: key);

  /// This is on text changed method which will display on city text field on changed.
  void onTextFieldTap(context) {
    final controller = Get.put(TindakanController());
    FutureBuilder(
        future: API.getPasienBy(kode_dokter:
        Publics.controller.getDataRegist.value.kode ?? ''),
        builder: (context, snapshot) {
          if (snapshot.hasData &&
              snapshot.connectionState != ConnectionState.waiting &&
              snapshot.data != null) {
            final data = snapshot.data!.pasien!;
            return IconButton(
              onPressed: () => showSearch(
                context: context,
                delegate: SearchPage<Pasien>(
                  items: data,
                  searchLabel:
                  'Cari Nama Dokter/Spesialisasi/Hari Periksa',
                  searchStyle:
                  GoogleFonts.nunito(color: Colors.black),
                  showItemsOnEmpty: true,
                  failure: Center(
                    child: Text(
                      'Dokter Tidak Terdaftar :(',
                      style: GoogleFonts.nunito(),
                    ),
                  ),
                  filter: (pasien) => [
                    // dokter.jadwal![0].id,
                    pasien.namaPasien,
                    pasien.no.toString(),
                    // dokter.jadwal![0].rangeHari,
                  ],
                  builder: (pasien) => ListViewPasien(
                    pasien: pasien),
                ),
              ),
              icon: const Icon(
                Icons.person_search_rounded,
                size: 30,
              ),
              color: Colors.blue,
            );
          } else {
            return Container();
          }
        });
  }

  void showSnackBar(String message) {
    Get.snackbar(title, message);
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TindakanController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FutureBuilder(
            future: API.getPasienBy(kode_dokter:
            Publics.controller.getDataRegist.value.kode ?? ''),
            builder: (context, snapshot) {
              if (snapshot.hasData &&
                  snapshot.connectionState != ConnectionState.waiting &&
                  snapshot.data != null) {
                final data = snapshot.data!.pasien!;
                return TextFormField(
                  readOnly: true,
                  controller: textEditingController,
                  cursorColor: Colors.black,
                  onTap: () {
                    showSearch(
                      context: context,
                      delegate: SearchPage<Pasien>(
                        items: data,
                        searchLabel:
                        'Cari Nama Dokter/Spesialisasi/Hari Periksa',
                        searchStyle:
                        GoogleFonts.nunito(color: Colors.black),
                        showItemsOnEmpty: true,
                        failure: Center(
                          child: Text(
                            'Dokter Tidak Terdaftar :(',
                            style: GoogleFonts.nunito(),
                          ),
                        ),
                        filter: (pasien) => [
                          // dokter.jadwal![0].id,
                          pasien.namaPasien,
                          pasien.no.toString(),
                          // dokter.jadwal![0].rangeHari,
                        ],
                        builder: (pasien) => ListViewPasien(
                            pasien: pasien),
                      ),
                    );
                  },

                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    suffixIcon:
                    const Icon(Icons.search_rounded, color: Colors.blue),
                    contentPadding:
                    const EdgeInsets.only(left: 8, bottom: 0, top: 0, right: 15),
                    hintText: hint,
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                  ),
                );
              } else {
                return Container();
              }
            }),
        const SizedBox(
          height: 15.0,
        ),
      ],
    );
  }
}