import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

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
        SizedBox(
          height: 10,
        ),
        Padding(padding: EdgeInsets.only(left: 10),
        child : Text('Medical Record Pasien'),
        ),
        SizedBox(
          height: 5,
        ),
      Container(
      height: 50,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 254, 228, 203),
        borderRadius:  BorderRadius.circular(22),
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          contentPadding:
          EdgeInsets.only(left: 15, bottom: 11, top: 13, right: 15),
          suffixIcon: IconButton(
            icon: Icon(Icons.search),
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
    ],);
  }
}