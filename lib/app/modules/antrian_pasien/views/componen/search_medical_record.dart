import 'package:flutter/material.dart';

class SearchTindakanDokter extends StatefulWidget {
  const SearchTindakanDokter({super.key});

  @override
  State<SearchTindakanDokter> createState() => _SearchTindakanDokterState();
}

class _SearchTindakanDokterState extends State<SearchTindakanDokter> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 40,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 254, 228, 203),
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
              hintText: "Cari Pasien ",
              fillColor: Colors.transparent,
            ),
          ),
        ),
      ],
    );
  }
}
