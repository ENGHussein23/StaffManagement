import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:test01/main_page/vacation_requests/vacation_requests.dart';
import 'VButton.dart';
import '../mainpage.dart';
import './requests_model/request.dart';

class Recuest_card extends StatefulWidget {
  late Requests R;

  Recuest_card(this.R);

  @override
  State<Recuest_card> createState() => _Recuest_cardState(R);
}

class _Recuest_cardState extends State<Recuest_card> {

  late Requests R;

  _Recuest_cardState(this.R);

  bool res = false;
  String resEmpty = '';

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Color.fromARGB(0, 0, 0, 0),
        ),
        borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
      ),
      elevation: 20,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            RichText(
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
              text: TextSpan(
                  text: 'تم إرسال طلب إجازة للموظف\\ة ',
                  style: TextStyle(
                    color: Colors.black54,
                   // fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  children: [
                    TextSpan(
                      text: widget.R.emp,
                      style: TextStyle(
                        color: Color.fromARGB(255, 23, 78, 98),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    TextSpan(
                      text: ' و ذلك بتاريخ ',
                      style: TextStyle(

                        color: Colors.black54,
                        fontSize: 16,
                      ),
                    ),
                    TextSpan(
                      text: widget.R.s_date,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: Colors.redAccent,
                        fontSize: 16,
                      ),
                    ),
                    TextSpan(
                      text: ' إلى ',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 16,
                      ),
                    ),
                    TextSpan(
                      text: widget.R.e_date,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: Colors.redAccent,
                        fontSize: 16,
                      ),
                    ),
                    TextSpan(

                      text: ' للإطلاع على الأسباب يرجى الضغط على ',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 16,
                      ),
                    ),
                    TextSpan(
                      recognizer: TapGestureRecognizer()..onTap = () {
                        setState(() {
                          if (res == false)
                            res = true;
                          else
                            res = false;
                        });
                      },
                      text: ' المزيد ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                        fontSize: 16,
                      ),
                    ),
                  ]),
            ),
            SizedBox(
              height: 8,
            ),

            res
                ? Card(

                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.black87,
                      ),
                      borderRadius: BorderRadius.circular(5.0), //<-- SEE HERE
                    ),
                    elevation: 0,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        R.reason == '' ? resEmpty : R.reason,
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  )
                : SizedBox(
                    height: 8,
                  ),
            Row(textDirection: TextDirection.rtl,
                // verticalDirection: VerticalDirection.down,
                children: [
                  Expanded(
                    child:
                    ElevatedButton(

                      style: ElevatedButton.styleFrom(
                        fixedSize: Size.fromHeight(40),
                        elevation: 15,
                        backgroundColor: Colors.indigoAccent,
                        onPrimary: Colors.white,
                        primary: Colors.grey[300],
                        minimumSize: Size(88, 36),
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      child: Row(

                          // textDirection: TextDirection.rtl,
                          children: [
                        Text('قبول'),
                        SizedBox(width: 4,),
                        Icon(Icons.credit_score_rounded)
                      ],
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center),
                      onPressed: ()  {
          setState(() {
            if(Vcounter<=0)
              {
                Vcounter=0;
                Vcounter++;

              }

            // VC;
          });
        },
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child:  ElevatedButton(

                      style: ElevatedButton.styleFrom(
                        fixedSize: Size.fromHeight(40),
                        elevation: 15,
                        // backgroundColor: Colors.redAccent,
                        onPrimary: Colors.indigoAccent,
                        primary: Colors.white,
                        minimumSize: Size(88, 36),
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                          side: const BorderSide(
                              width: 2, // the thickness
                              color: Colors.indigoAccent // the color of the border
                          )
                      ),
                      child: Row(
                          // textDirection: TextDirection.rtl,
                          children: [
                        Text('رفض'),
                        SizedBox(width: 4,),
                        Icon(Icons.cancel_outlined)
                      ],
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center),
    onPressed: () {
          setState(() {
            if(Vcounter>0)
            Vcounter--;
            // VC;
          });
        },
                    ),
                  ),
                ])
            //VButton(res),
          ],
        ),
      ),
    );
  }
}
