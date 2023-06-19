import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

class SearchHISS extends StatefulWidget {
  const SearchHISS({super.key});

  @override
  State<SearchHISS> createState() => _SearchHISSState();
}

class _SearchHISSState extends State<SearchHISS> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
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
          hintText: "Nama Penyakit ",
        ),
      ),
    );
  }
}