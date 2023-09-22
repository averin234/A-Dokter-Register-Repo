import 'package:a_dokter_register/app/modules/antrian_pasien/controllers/antrian_pasien_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horizontal_calendar/horizontal_calendar.dart';

class HorizontalCalender extends StatelessWidget {
  HorizontalCalender({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AntrianPasienController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Container(
            padding: EdgeInsets.all(0),
            child: HorizontalCalendar(
              date: DateTime.now(),
              initialDate: DateTime.now(),
              textColor: Colors.black,
              backgroundColor: Colors.white,
              selectedColor: Color.fromARGB(255, 35, 163, 223),
              showMonth: true,
              locale: Localizations.localeOf(context),
              onDateSelected: (date) {
                date = date.toString().substring(0, 10);
                print(date);
                controller.date.value = date;
              },
            ),
          ),
        ),
      ],
    );
  }
}
