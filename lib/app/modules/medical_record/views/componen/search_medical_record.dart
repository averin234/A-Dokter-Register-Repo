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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 40,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 233, 231, 253),
            borderRadius: BorderRadius.circular(22),
          ),
          child: TextField(
            readOnly: true,
            decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              contentPadding: const EdgeInsets.only(
                  left: 15, bottom: 11, top: 13, right: 15),
              suffixIcon: IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  print('sesarch');
                },
              ),
              filled: true,
              hintText: "Pencarian ",
              fillColor: Colors.transparent,
            ),
          ),
        ),
      ],
    );
  }
}
