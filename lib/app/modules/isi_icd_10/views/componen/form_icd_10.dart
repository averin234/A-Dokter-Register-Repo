import 'package:a_dokter_register/app/modules/isi_icd_10/views/componen/search_icd_10.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

class FormICD10 extends StatefulWidget {
  const FormICD10({super.key});

  @override
  State<FormICD10> createState() => _FormICD10State();
}

class _FormICD10State extends State<FormICD10> {
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

  // Default Radio Button Selected Item When App Starts.
  String radioButtonItem = 'ONE';

  // Group Value for Radio Button.
  int id = 1;
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
            'Form isi ICD-10',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text("Nama Obat/Kode Obat",
                style: TextStyle(fontWeight: FontWeight.normal)),
          ),
          SizedBox(
            height: 10,
          ),
          SearchICD10(),
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
                            '--Pilih Kelompok--',
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
            child: Text("ICD - 10",
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
                            '--pilih ICD-10--',
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
            child: Text("Asterik",
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
                            '--Pilhih Asterik--',
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
          SizedBox(
            width: 400,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Radio(
                  value: 1,
                  groupValue: id,
                  onChanged: (val) {
                    setState(() {
                      radioButtonItem = 'ONE';
                      id = 1;
                    });
                  },
                ),
                Text(
                  'Sebelum Makan',
                  style: new TextStyle(),
                ),
                Radio(
                  value: 2,
                  groupValue: id,
                  onChanged: (val) {
                    setState(() {
                      radioButtonItem = 'TWO';
                      id = 2;
                    });
                  },
                ),
                Text(
                  'Sesudah Makan',
                  style: new TextStyle(),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
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
          ),
        ],
      ),
    );
  }
}
