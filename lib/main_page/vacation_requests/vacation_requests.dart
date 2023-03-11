import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:test01/models/AllRequestVacationsTest002.dart';
import 'package:test01/services/StuffMangement_Service.dart';
import 'package:test01/services/AllRequestVacationsService.dart';
import 'package:test01/main_page/SplashScreen.dart';
class vacation_requests_page extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return vacation_requests_State();
  }
}
late AllRequestVacationsTest002 RequestVacations;
List<Data> RequestVacationsTest=RequestVacations!.data!;
int Vcounter=RequestVacationsTest.length;

class vacation_requests_State extends State<vacation_requests_page> {

  @override
  void initState(){

    // TODO: implement initState
    super.initState();
    getAVRData();

    // depEMPtest=depEMP!.data! as List<Datum>;
  }

  getAVRData() async {
    // RequestVacationsTest=[];
    RequestVacations=await AllRequestVacationsServies().getAllRequestVacations();
    setState((){
      RequestVacations=RequestVacations;
      // depEMPtest=(depEMP!.data!) as Datum;
    });
  }
refrech()async{
  AllRequestVacationsTest002 RequestVacationsRef;
  RequestVacationsRef=await AllRequestVacationsServies().getAllRequestVacations();
  setState((){
    RequestVacationsTest=RequestVacationsRef!.data!;
  });

}
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Align(
      child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
            padding: EdgeInsets.all(10),
            child: Container(
              padding: EdgeInsets.all(5),
              width: 700,
              child:  RequestVacationsTest.isEmpty?
          Container(
            height: 50,
            child: Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Color.fromARGB(0, 0, 0, 0),
                ),
                borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
              ),
              elevation: 20,
              child: FittedBox(child: Text(' لا توجد طلبات اجازة',textDirection: TextDirection.rtl,style: TextStyle(color: Colors.black54,letterSpacing: 0),),),
            ),
          ):
              // RefreshIndicator(
              // child:
              ListView.builder(shrinkWrap: true,
                itemBuilder: (ctx, index) {
                  bool res = false;
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
                                    text:
                                    // RequestVacationsTest[index].jobId.toString(),
                                    RequestVacationsTest[index].user!.name.toString(),
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
                                    text: RequestVacationsTest[index].startDate.toString(),
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
                                    text: RequestVacationsTest[index].endDate.toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.redAccent,
                                      fontSize: 16,
                                    ),
                                  ),
                                  TextSpan(

                                    text: RequestVacationsTest[index].reasons==null||RequestVacationsTest[index].reasons=='\n'
                                        ''?'':'\n'
                                        '  السبب : ',
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 16,
                                    ),
                                  ),
                                  TextSpan(
                                    text: RequestVacationsTest[index].reasons==null||RequestVacationsTest[index].reasons==''?'.':RequestVacationsTest[index].reasons,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: RequestVacationsTest[index].reasons==null||RequestVacationsTest[index].reasons==''?Colors.black54:Colors.indigo,
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
                                RequestVacationsTest[index].reasons.toString() == '' ? '' : RequestVacationsTest[index].reasons.toString(),
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
                                    onPressed: ()  async {

                                        var deletev = {
                                          "vacation_id":RequestVacationsTest[index].id ,
                                        };
                                        var resdeletev = await StuffMangement_Service()
                                            .postData(deletev, '/api/acceptVacation');
                                        var resbodyresdeletev = json.decode(resdeletev.body);
                                        if(resbodyresdeletev['success']==true)
                                        {
                                          setState(() {
                                            RequestVacationsTest.removeAt(index);
                                            // Vcountertest--;
                                          });
                                          ScaffoldMessenger.of(
                                              context)
                                              .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                    textAlign:
                                                    TextAlign
                                                        .center,
                                                    textDirection:
                                                    TextDirection
                                                        .rtl,
                                                    'تم قبول طلب الاجازة'),
                                              ));
                                      }
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
                                    onPressed: () async {
                                      // if(RequestVacationsTest[index].requestStatus==1)
                                      //   {
                                          var deletev = {
                                            "vacation_id":RequestVacationsTest[index].id ,
                                          };
                                          var resdeletev = await StuffMangement_Service()
                                              .postData(deletev, '/api/denyVacation');
                                          var resbodyresdeletev = json.decode(resdeletev.body);
                                          if(resbodyresdeletev['success']==true)
                                          {
                                            // RequestVacationsTest[index].requestStatus!=4;
                                            // Vcountertest--;
                                            ScaffoldMessenger.of(
                                                context)
                                                .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                      textAlign:
                                                      TextAlign
                                                          .center,
                                                      textDirection:
                                                      TextDirection
                                                          .rtl,
                                                      'تم رفض طلب الاجازة'),
                                                ));
                                          }
                                          setState(() {
                                            RequestVacationsTest.removeAt(index);
                                          });
                                        // }


                                    },
                                  ),
                                ),
                              ])
                          //VButton(res),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: RequestVacationsTest.length, )
                // ,
                //   onRefresh: refrech(),)

            ));
      }),
    ));
  }
}
