import 'package:flutter/material.dart';

class SearchPendapatan1 extends StatefulWidget {
  const SearchPendapatan1({super.key});

  @override
  State<SearchPendapatan1> createState() => _SearchPendapatan1State();
}

class _SearchPendapatan1State extends State<SearchPendapatan1> {
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
