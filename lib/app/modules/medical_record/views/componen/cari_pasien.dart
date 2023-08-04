import 'package:a_dokter_register/app/data/componen/publics.dart';
import 'package:a_dokter_register/app/data/model/get_pasien_by.dart';
import 'package:a_dokter_register/app/modules/medical_record/views/componen/listview_tindakan.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:search_page/search_page.dart';

import '../../../../data/componen/fetch_data.dart';

/// This is Common App textfiled class.
class CariPasien extends StatelessWidget {
  const CariPasien({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FutureBuilder(
            future: API.getPasienBy(
                kode_dokter: Publics.controller.getDataRegist.value.kode ?? ''),
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
                      searchLabel: 'Cari Nama Pasien',
                      searchStyle: GoogleFonts.nunito(color: Colors.black),
                      showItemsOnEmpty: true,
                      failure: Center(
                        child: Text(
                          'Pasien Tidak Terdaftar :(',
                          style: GoogleFonts.nunito(),
                        ),
                      ),
                      filter: (pasien) => [
                        pasien.namaPasien,
                        pasien.noHp,
                        pasien.noMr,
                      ],
                      builder: (pasien) => ListViewPasien(pasien: pasien),
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
            }),
      ],
    );
  }
}
