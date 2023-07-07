import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class shimmerSetting extends StatelessWidget {
  const shimmerSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 355),
      child: Column(children: [
        SizedBox(
          height: 10,
        ),
        Container(
          margin: EdgeInsets.only(left: 10, right: 10 ),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Color(0x6cc7d1db)),
          ),
          child: Row(
            children: [
          Shimmer(
          child: Container(
            height: 90,
            decoration: BoxDecoration(
              color: Color(0xFFBACDDB),
              borderRadius: BorderRadius.circular(100),
            ),
            padding: EdgeInsets.all(10),
            constraints: BoxConstraints(minWidth: 50, maxWidth: 90),
          ),
        ),
            SizedBox(width: 10,),
            Column(children: [
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFBACDDB),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(10),
                constraints: BoxConstraints(minWidth: 120, maxWidth: 195),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFBACDDB),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(10),
                constraints: BoxConstraints(minWidth: 120, maxWidth: 195),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFBACDDB),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(10),
                constraints: BoxConstraints(minWidth: 120, maxWidth: 195),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFBACDDB),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(10),
                constraints: BoxConstraints(minWidth: 120, maxWidth: 195),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFBACDDB),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(10),
                constraints: BoxConstraints(minWidth: 120, maxWidth: 195),
              ),
              SizedBox(
                height: 10,
              ),
            ],)
            ],)),
        SizedBox(
          height: 10,
        ),
      ]),
    );
  }
}
