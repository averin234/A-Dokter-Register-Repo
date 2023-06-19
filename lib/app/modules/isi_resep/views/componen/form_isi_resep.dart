import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

class FormIsiResep extends StatefulWidget {
  const FormIsiResep({super.key});

  @override
  State<FormIsiResep> createState() => _FormIsiResepState();
}

class _FormIsiResepState extends State<FormIsiResep> {
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
            'Form isi Resep',
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
                            '--pilih Nama Obat--',
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
                            '--Cari Obat--',
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
            child: Text("Jenis Kesediaan",
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
            child: Text("Aturan Pemakaian",
                style: TextStyle(fontWeight: FontWeight.normal)),
          ),
          Container(
              padding: EdgeInsets.only(right: 10),
              margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
              decoration: BoxDecoration(
                color: Color(0xfff3f3f3),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Color(0x6cc7d1db)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 10),
                    margin: EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
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
                                    '3x1',
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
                  Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text('/'),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Color(0x6cc7d1db)),
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                  left: 15, bottom: 11, top: 13, right: 15),
                              filled: true,
                              fillColor: Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text('X'),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Color(0x6cc7d1db)),
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                  left: 15, bottom: 11, top: 13, right: 15),
                              filled: true,
                              fillColor: Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text("ggt",
                        style: TextStyle(fontWeight: FontWeight.normal)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 10),
                    margin: EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
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
                                    'ODS',
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
                  SizedBox(
                    width: 400,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Radio(
                          value: 3,
                          groupValue: id,
                          onChanged: (val) {
                            setState(() {
                              radioButtonItem = 'ONE';
                              id = 3;
                            });
                          },
                        ),
                        Text(
                          'Saat Makan',
                          style: new TextStyle(),
                        ),
                        Radio(
                          value: 4,
                          groupValue: id,
                          onChanged: (val) {
                            setState(() {
                              radioButtonItem = 'TWO';
                              id = 4;
                            });
                          },
                        ),
                        Text(
                          'Tetes',
                          style: new TextStyle(),
                        ),
                        Radio(
                          value: 5,
                          groupValue: id,
                          onChanged: (val) {
                            setState(() {
                              radioButtonItem = 'TWO';
                              id = 5;
                            });
                          },
                        ),
                        Text(
                          'Oles',
                          style: new TextStyle(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 400,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Radio(
                          value: 6,
                          groupValue: id,
                          onChanged: (val) {
                            setState(() {
                              radioButtonItem = 'ONE';
                              id = 6;
                            });
                          },
                        ),
                        Text(
                          'Sprey',
                          style: new TextStyle(),
                        ),
                        Radio(
                          value: 7,
                          groupValue: id,
                          onChanged: (val) {
                            setState(() {
                              radioButtonItem = 'TWO';
                              id = 7;
                            });
                          },
                        ),
                        Text(
                          'UC',
                          style: new TextStyle(),
                        ),
                        Radio(
                          value: 8,
                          groupValue: id,
                          onChanged: (val) {
                            setState(() {
                              radioButtonItem = 'TWO';
                              id = 8;
                            });
                          },
                        ),
                        Text(
                          'Anus',
                          style: new TextStyle(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 400,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Radio(
                          value: 9,
                          groupValue: id,
                          onChanged: (val) {
                            setState(() {
                              radioButtonItem = 'TWO';
                              id = 9;
                            });
                          },
                        ),
                        Text(
                          'Vagina',
                          style: new TextStyle(),
                        ),
                        Radio(
                          value: 10,
                          groupValue: id,
                          onChanged: (val) {
                            setState(() {
                              radioButtonItem = 'ONE';
                              id = 10;
                            });
                          },
                        ),
                        Text(
                          'Lainnya',
                          style: new TextStyle(),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
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
