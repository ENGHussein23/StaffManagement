import 'package:flutter/services.dart';

import 'SelectedVscstions.dart';
import 'package:flutter/material.dart';
import 'Statistics.dart';
var nowaitingvacation=Container(alignment: Alignment.center, width:700,height:100,child: Card(margin: EdgeInsets.all(20),elevation: 20,color: Colors.indigoAccent, child: Text(style:TextStyle(color: Colors.white),textAlign: TextAlign.center,'لاتوجد طلبات اجازة معلقة'),),);
class PendingVacation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(

      reverse: false,
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
                // Expanded(
                //   flex: 1,
                //   child: Card(
                //       elevation: 0,
                //       child: Text(
                //         'الأسباب',
                //         textDirection: TextDirection.rtl,
                //       )),
                // ),
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
            // StatisticsState().waitis?
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
                                wlv[index]['user']['name'].toString(),
                                textDirection: TextDirection.rtl,
                              )),
                        ),
                        Expanded(
                          flex: 1,
                          child: Card(
                              elevation: 0,
                              child: Text(
                                wlv[index]['user']['place_of_job'].toString(),
                                textDirection: TextDirection.rtl,
                              )),
                        ),
                        Expanded(
                          flex: 1,
                          child: Card(
                              elevation: 0,
                              child: Text(
                                wlv[index]['start_date'].toString(),
                                textDirection: TextDirection.rtl,
                              )),
                        ),
                        Expanded(
                          flex: 1,
                          child: Card(
                              elevation: 0,
                              child: Text(
                                wlv[index]['end_date'].toString(),
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
                                      text: wlv[index]['user']['phone'].toString()))
                                      .then((_) {
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                        content: Text('تم نسخ هذا الرقم للحافظة')));
                                  });
                                },
                                onPressed: () {},
                                child: FittedBox(
                                  child: Text( wlv[index]['user']['phone'].toString()),
                                ),
                              )),
                        ),
                        // Expanded(
                        //   flex: 1,
                        //   child: Card(
                        //       elevation: 0,
                        //       child: Text(
                        //         wlv[index]['reasons'].toString(),
                        //         textDirection: TextDirection.rtl,
                        //       )),
                        // ),
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
              itemCount: wlv.length,)
                // : nowaitingvacation
          ],
        ),
      ),
    );
  }
}

// class PendingVacationCard extends StatelessWidget {
//   // late VacationViewModel VacationViewModelTest01;
//
//   PendingVacationCard();
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemBuilder: (context, index) {
//       return Column(
//         children: [
//           Row(
//             textDirection: TextDirection.rtl,
//             children: [
//               Expanded(
//                 flex: 1,
//                 child: Card(
//                     elevation: 0,
//                     child: Text(
//                       WaitingVacations002[index].user!.name!.toString(),
//                       textDirection: TextDirection.rtl,
//                     )),
//               ),
//               Expanded(
//                 flex: 1,
//                 child: Card(
//                     elevation: 0,
//                     child: Text(
//                       WaitingVacations002[index].user!.placeOfJob!.toString(),
//                       textDirection: TextDirection.rtl,
//                     )),
//               ),
//               Expanded(
//                 flex: 1,
//                 child: Card(
//                     elevation: 0,
//                     child: Text(
//                       WaitingVacations002[index].startDate.toString(),
//                       textDirection: TextDirection.rtl,
//                     )),
//               ),
//               Expanded(
//                 flex: 1,
//                 child: Card(
//                     elevation: 0,
//                     child: Text(
//                       "VacationViewModelTest01.VacationEndV",
//                       textDirection: TextDirection.rtl,
//                     )),
//               ),
//               Expanded(
//                 flex: 1,
//                 child: Card(
//                     elevation: 0,
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.indigoAccent),
//                       onLongPress: () {
//                         Clipboard.setData(new ClipboardData(
//                             text: WaitingVacations002[index].user!.phone!.toString()))
//                             .then((_) {
//                           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                               content: Text('تم نسخ هذا الرقم للحافظة')));
//                         });
//                       },
//                       onPressed: () {},
//                       child: FittedBox(
//                         child: Text( WaitingVacations002[index].user!.phone!.toString()),
//                       ),
//                     )),
//               ),
//               Expanded(
//                 flex: 1,
//                 child: Card(
//                     elevation: 0,
//                     child: Text(
//                       WaitingVacations002[index].reasons!.toString(),
//                       textDirection: TextDirection.rtl,
//                     )),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 1,
//           ),
//           const Divider(
//             height: 5,
//             thickness: 1,
//             endIndent: 0,
//             color: Colors.grey,
//           ),
//           SizedBox(
//             height: 1,
//           ),
//         ],
//       );
//     },
//       shrinkWrap: true,
//       itemCount: WaitingVacations002.length,);
//   }
// }
