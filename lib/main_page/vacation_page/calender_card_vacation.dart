import 'dart:core';
import 'package:flutter/material.dart';
import 'vacationpage.dart';

String chosen_calender_text = '';

class calender_card_vacation extends StatefulWidget {
  late final String calender_text;

  calender_card_vacation();

  @override
  State<StatefulWidget> createState() {
    return calender_card_vacationState();
  }
}

class calender_card_vacationState extends State<calender_card_vacation> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        //firstDate: DateTime(2015, 8),
      firstDate: DateTime.now(),
        lastDate: DateTime(2101),
    helpText: 'بداية الإجازة',
    textDirection: TextDirection.rtl,

    //    builder: (context, child) =>    Theme(
    //     data: ThemeData.light().copyWith(
    //     // primarySwatch: buttonTextColor,//OK/Cancel button text color
    //     primaryColor: Colors.indigoAccent,//Head background
    //     accentColor: Colors.indigoAccent,//selection color
    //   //dialogBackgroundColor: Colors.white,//Background color
    // ), child: SizedBox(child: child),
    //     // child: child,
    // ),

    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        endD = selectedDate;
        StartDate = "${selectedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                alignment: Alignment.center,
                //height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color.fromARGB(255, 255, 255, 255)),
                child: Row(
                  children: [
                    Expanded(
                      //flex: 0.5,
                      child: Card(
                        elevation: 0,
                        child: Container(
                          constraints: BoxConstraints(
                              minWidth: 50,
                              maxWidth: 50,
                              maxHeight: 50,
                              minHeight: 50),
                          alignment: Alignment.topLeft,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color.fromARGB(0, 220, 220, 220)),
                          child: IconButton(
                            icon: const Icon(Icons.calendar_month),
                            color: Colors.black,
                            onPressed: () {
                              _selectDate(context);
                            },
                          ),
                        ),
                      ),
                    ),
                    if (StartDate != null)
                      Expanded(
                          child: Card(
                        elevation: 0,
                        child: Text(
                          StartDate,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 6, 23, 24),
                          ),
                          textDirection: TextDirection.rtl,
                        ),
                      ))
                    else
                      Expanded(
                          child: Card(
                        elevation: 0,
                        child: Text(
                          'StartDate',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 6, 23, 24),
                          ),
                          textDirection: TextDirection.rtl,
                        ),
                      )),
                    Expanded(
                        child: Card(
                      elevation: 0,
                      child: Text(
                        'بداية الاجازة:',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 6, 23, 24),
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                    )),
                  ],
                ))));
  }
}
