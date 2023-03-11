import 'dart:core';
import 'package:flutter/material.dart';
import 'vacationpage.dart';
import 'dart:async';

String chosen_calender_text = '';

class calender_end_card_vacation extends StatefulWidget {
  late final String calender_text;

  calender_end_card_vacation();

  @override
  State<StatefulWidget> createState() {
    return calender_end_card_vacationState();
  }
}

class calender_end_card_vacationState
    extends State<calender_end_card_vacation> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        // firstDate: DateTime(2015, 8),
        firstDate: DateTime.now(),
        lastDate: DateTime(2101),
      helpText: 'نهاية الإجازة',
      textDirection: TextDirection.rtl,
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        startD = selectedDate;
        EndDate = "${selectedDate.toLocal()}".split(' ')[0];
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
                // constraints: BoxConstraints(
                //   minWidth: 110,
                //   maxWidth: 620,
                //   minHeight: 50,
                //   maxHeight: 70,
                // ),
                alignment: Alignment.center,
                //height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color.fromARGB(255, 255, 255, 255)),
                child: Row(
                  children: [
                    Expanded(
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
                              }),
                        ),
                      ),
                    ),
                    if (StartDate != null)
                      Expanded(
                          child: Card(
                        elevation: 0,
                        child: Text(
                          EndDate,
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
                          'EndDate',
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
                        'نهاية الاجازة:',
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
