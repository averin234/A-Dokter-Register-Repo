import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

class FormIsiTindakan extends StatefulWidget {
  const FormIsiTindakan({super.key});

  @override
  State<FormIsiTindakan> createState() => _FormIsiTindakanState();
}

class _FormIsiTindakanState extends State<FormIsiTindakan> {
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
    'Item6',
    'Item7',
    'Item8',
  ];
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color(0x6cc7d1db)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFe0e0e0).withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(2, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Form isi Tindakan',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text("Nama Tindakan",
                style: TextStyle(fontWeight: FontWeight.normal)),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.only(right: 10),
            margin: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              color: Color(0xfff3f3f3),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Color(0x6cc7d1db)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    isExpanded: true,
                    hint: Row(
                      children: const [
                        SizedBox(
                          width: 4,
                        ),
                        Expanded(
                          child: Text(
                            '--pilih nama tindakan--',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    items: items
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ))
                        .toList(),
                    value: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value as String;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child:
                Text("Jumlah", style: TextStyle(fontWeight: FontWeight.normal)),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.only(right: 10),
            margin: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              color: Color(0xfff3f3f3),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Color(0x6cc7d1db)),
            ),
            child: TextField(
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                enabled: true,
                disabledBorder: InputBorder.none,
                contentPadding:
                    EdgeInsets.only(left: 15, bottom: 11, top: 13, right: 15),
                filled: true,
                fillColor: Colors.transparent,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            color: Colors.grey,
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text("Nama Obat/Alkes",
                style: TextStyle(fontWeight: FontWeight.normal)),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.only(right: 10),
            margin: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              color: Color(0xfff3f3f3),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Color(0x6cc7d1db)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    isExpanded: true,
                    hint: Row(
                      children: const [
                        SizedBox(
                          width: 4,
                        ),
                        Expanded(
                          child: Text(
                            '--pilih nama obat--',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    items: items
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ))
                        .toList(),
                    value: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value as String;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child:
                Text("Jumlah", style: TextStyle(fontWeight: FontWeight.normal)),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.only(right: 10),
            margin: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              color: Color(0xfff3f3f3),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Color(0x6cc7d1db)),
            ),
            child: TextField(
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                enabled: true,
                disabledBorder: InputBorder.none,
                contentPadding:
                    EdgeInsets.only(left: 15, bottom: 11, top: 13, right: 15),
                filled: true,
                fillColor: Colors.transparent,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 45,
                width: 345,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Submit",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
