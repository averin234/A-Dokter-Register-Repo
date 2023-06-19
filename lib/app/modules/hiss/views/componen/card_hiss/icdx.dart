import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class icdx extends StatefulWidget {
  const icdx({super.key});

  @override
  State<icdx> createState() => _icdxState();
}

class _icdxState extends State<icdx> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10, left: 10),
      padding: EdgeInsets.only(right: 10, left: 10, bottom: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0x6cc7d1db)),
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
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
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 210,
                child : Text("ICD-X",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,)),),
              SizedBox(
                height: 10,
              ),
            ],),
        ],
      ),
    );
  }
}