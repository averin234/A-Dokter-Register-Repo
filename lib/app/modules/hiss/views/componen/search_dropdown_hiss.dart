import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

class SearchHISSdropdowmn extends StatefulWidget {
  const SearchHISSdropdowmn({super.key});

  @override
  State<SearchHISSdropdowmn> createState() => _SearchHISSdropdowmntate();
}

class _SearchHISSdropdowmntate extends State<SearchHISSdropdowmn> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 40,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 254, 228, 203),
            borderRadius: BorderRadius.circular(22),
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
                icon: Icon(Icons.arrow_drop_down_circle),
                onPressed: () {
                  print('sesarch');
                },
              ),
              filled: true,
              hintText: "",
              fillColor: Colors.transparent,
            ),
          ),
        ),
      ],
    );
  }
}