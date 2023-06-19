import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

class SearchICD10 extends StatefulWidget {
  const SearchICD10({super.key});

  @override
  State<SearchICD10> createState() => _SearchICD10State();
}

class _SearchICD10State extends State<SearchICD10> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 10, right: 10),
          height: 50,
          decoration: BoxDecoration(
            color: Color(0xfff3f3f3),
            border: Border.all(color: Color(0x6cc7d1db)),
            borderRadius: BorderRadius.circular(10),
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
              hintText: "Cari ICD-10",
              hintStyle: TextStyle(fontSize: 15),
              fillColor: Colors.transparent,
            ),
          ),
        ),
      ],
    );
  }
}
