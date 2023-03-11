import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import './Statistics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SelectVacations extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      reverse: true,
      scrollDirection: Axis.horizontal,
      child: Container(
        width: 660,
        // height: 100,
        child: Column(
          children: <Widget>[
            Row(
              textDirection: TextDirection.rtl,
              children: [
                Expanded(
                  flex: 1,
                  child: Card(
                      elevation: 0,
                      child: Text(
                        'اسم الموظف',
                        textDirection: TextDirection.rtl,
                      )),
                ),
                Expanded(
                  flex: 1,
                  child: Card(
                      elevation: 0,
                      child: Text(
                        'مكان العمل',
                        textDirection: TextDirection.rtl,
                      )),
                ),
                Expanded(
                  flex: 1,
                  child: Card(
                      elevation: 0,
                      child: Text(
                        'بداية الإجازة',
                        textDirection: TextDirection.rtl,
                      )),
                ),
                Expanded(
                  flex: 1,
                  child: Card(
                      elevation: 0,
                      child: Text(
                        'نهاية الإجازة',
                        textDirection: TextDirection.rtl,
                      )),
                ),
                Expanded(
                  flex: 1,
                  child: Card(
                      elevation: 0,
                      child: Text(
                        'موبايل',
                        textDirection: TextDirection.rtl,
                      )),
                ),
                Expanded(
                  flex: 1,
                  child: Card(
                      elevation: 0,
                      child: Text(
                        'الأسباب',
                        textDirection: TextDirection.rtl,
                      )),
                ),
              ],
            ),
            SizedBox(
              height: 2,
            ),
            const Divider(
              height: 10,
              thickness: 1,
              endIndent: 0,
              color: Colors.black,
            ),
            SizedBox(
              height: 2,
            ),
            ListView.builder(
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Card(
                              elevation: 0,
                              child: Text(
                                slv[index]['user']['name'].toString(),
                                textDirection: TextDirection.rtl,
                              )),
                        ),
                        Expanded(
                          flex: 1,
                          child: Card(
                              elevation: 0,
                              child: Text(
                                slv[index]['user']['place_of_job'].toString(),
                                textDirection: TextDirection.rtl,
                              )),
                        ),
                        Expanded(
                          flex: 1,
                          child: Card(
                              elevation: 0,
                              child: Text(
                                slv[index]['start_date'].toString(),
                                textDirection: TextDirection.rtl,
                              )),
                        ),
                        Expanded(
                          flex: 1,
                          child: Card(
                              elevation: 0,
                              child: Text(
                                slv[index]['end_date'].toString(),
                                textDirection: TextDirection.rtl,
                              )),
                        ),
                        Expanded(
                          flex: 1,
                          child: Card(
                              elevation: 0,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.indigoAccent),
                                onLongPress: () {
                                  Clipboard.setData(new ClipboardData(
                                      text: slv[index]['user']['phone'].toString()))
                                      .then((_) {
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                        content: Text('تم نسخ هذا الرقم للحافظة')));
                                  });
                                },
                                onPressed: () {},
                                child: FittedBox(
                                  child: Text( slv[index]['user']['phone'].toString()),
                                ),
                              )),
                        ),
                        Expanded(
                          flex: 1,
                          child: Card(
                              elevation: 0,
                              child: Text(
                                slv[index]['reasons'].toString(),
                                textDirection: TextDirection.rtl,
                              )),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    const Divider(
                      height: 5,
                      thickness: 1,
                      endIndent: 0,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 1,
                    ),
                  ],
                );
              },
              shrinkWrap: true,
              itemCount: slv.length,),

          ],
        ),
      ),
    )
        ;
  }
}
class SelectVacationsCard extends StatelessWidget {
  late VacationViewModel VacationViewModelTest01;

  SelectVacationsCard(this.VacationViewModelTest01);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          textDirection: TextDirection.rtl,
          children: [
            Expanded(
              flex: 1,
              child: Card(
                  elevation: 0,
                  child: Text(
                    VacationViewModelTest01.NameV,
                    textDirection: TextDirection.rtl,
                  )),
            ),
            Expanded(
              flex: 1,
              child: Card(
                  elevation: 0,
                  child: Text(
                    VacationViewModelTest01.workLocationV,
                    textDirection: TextDirection.rtl,
                  )),
            ),
            Expanded(
              flex: 1,
              child: Card(
                  elevation: 0,
                  child: Text(
                    VacationViewModelTest01.VacationStartV,
                    textDirection: TextDirection.rtl,
                  )),
            ),
            Expanded(
              flex: 1,
              child: Card(
                  elevation: 0,
                  child: Text(
                    VacationViewModelTest01.VacationEndV,
                    textDirection: TextDirection.rtl,
                  )),
            ),
            Expanded(
              flex: 1,
              child: Card(
                  elevation: 0,
                  child: ElevatedButton(
                      onLongPress: (){ Clipboard.setData(new ClipboardData(text: VacationViewModelTest01.MobileNumberV)).then((_){
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text('تم نسخ هذا الرقم للحافظة')));
                      });
                      },
                      onPressed: () {},
                      child: FittedBox(
                        child: Text(VacationViewModelTest01.MobileNumberV),
                      ),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.indigoAccent),)),
            ),
            Expanded(
              flex: 1,
              child: Card(
                  elevation: 0,
                  child: Text(
                    VacationViewModelTest01.ResonV,
                    textDirection: TextDirection.rtl,
                  )),
            ),
          ],
        ),
        SizedBox(
          height: 1,
        ),
        const Divider(
          height: 5,
          thickness: 1,
          endIndent: 0,
          color: Colors.grey,
        ),
        SizedBox(
          height: 1,
        ),
      ],
    )
    ;
  }
}
