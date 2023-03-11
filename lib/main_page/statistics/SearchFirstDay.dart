import 'dart:core';
import 'package:flutter/material.dart';
import './Statistics.dart';

String chosen_calender_text = '';

class calender_card_first_day_vacation extends StatefulWidget {
  late final String calender_text;

  // calender_card_vacation();

  @override
  State<StatefulWidget> createState() {
    return calender_card_first_day_vacationState();
  }
}

class calender_card_first_day_vacationState extends State<calender_card_first_day_vacation> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      // firstDate: DateTime.now(),
      lastDate: DateTime(2101),
      // helpText: 'بداية الإجازة',
      textDirection: TextDirection.rtl,

    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        // endD = selectedDate;
        FirstDay = "${selectedDate.toLocal()}".split(' ')[0];
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
              // width: 600,
                // alignment: Alignment.center,
                //height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color.fromARGB(0, 0, 0, 0),
                  border: Border.all(
                    // color: Colors.indigoAccent, // Set border color
                      color: Color.fromARGB(100, 0, 0, 0),
                      width: 1.0),
                ),
                child: Row(
                  textDirection: TextDirection.rtl,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisSize: MainAxisSize.max,
                  // verticalDirection: VerticalDirection.up,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Card(
                        elevation: 0,
                        child: Container(
                          // constraints: BoxConstraints(
                          //     minWidth: 50,
                          //     maxWidth: 50,
                          //     maxHeight: 50,
                          //     minHeight: 50),
                          alignment: Alignment.center,
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
                    if (FirstDay != null)
                      Expanded(
                        flex: 5,
                          child: Container(alignment: Alignment.center,
                          child: Card(

                            elevation: 0,
                            child: Text(
                              FirstDay,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color.fromARGB(255, 6, 23, 24),
                              ),
                              textDirection: TextDirection.rtl,
                            ),
                          ),))
                    else
                      Expanded(
                          flex: 5,
                          child: Card(

                            elevation: 0,
                            child: Text(
                              'StartDay',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 16,
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
