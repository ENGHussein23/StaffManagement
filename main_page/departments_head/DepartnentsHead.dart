import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './dep_heads.dart';
import 'package:http/http.dart' as http;
import 'package:test01/login_screen/LoginPage.dart';
import 'package:test01/models/HeasdsDataModel.dart';
import 'package:test01/services/HeadsService.dart';
class DepartnentsHead extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DepartnentsHeadState();
  }
}

class DepartnentsHeadState extends State<DepartnentsHead> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHttpStatisticsHeadsData();
    // getHttpStatisticsHeads();
  }
  bool isloadingheads=true;
  late var lasttest;
  late List <dynamic> heads;
  // late List <Datum> headsTest;
  // late DepartmentHeadsData HeadDEapartment;
  // getHttpStatisticsHeads() async {
  //   HeadDEapartment = await HeadsService().getHeadsData();
  //     setState(() {
  //       isloadingheads=true;
  //       headsTest=HeadDEapartment.data;
  //     });
  // }
  getHttpStatisticsHeadsData()async{
    Uri myURL =Uri.https('emp.almatin.com','/api/statistics/head',{'q':'dart'});
    http.Response response= await http.get(myURL,
        headers: {
          'Accept':'application/json',
          'Authorization':'Bearer $token_test'
        });
    var jsonn=response.body;
    lasttest=json.decode(jsonn);
    if(lasttest['data'] !=null)
    {
      setState(() {
        // WaitingVacations004=lasttest['data'];
        isloadingheads=true;
        heads=lasttest['data'];
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(

        padding: EdgeInsets.all(10),
        child: Container(
          width: 800,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                  // color: Colors.indigoAccent, // Set border color
                  color: Color.fromARGB(0, 0, 0, 0),
                  width: 1.0), // Set border width
              borderRadius: BorderRadius.all(
                  Radius.circular(10.0)), // Set rounded corner radius
              boxShadow: [
                BoxShadow(
                    blurRadius: 10, color: Colors.black38, offset: Offset(1, 3))
              ] // Make rounded corner of border
              ),

          padding: const EdgeInsets.all(15.0),
          child: Column(
            textDirection: TextDirection.rtl,
            children: [
              // Dep_heads(),
              SizedBox(
                height: 20,
              ),
              Dep_heads(),
              const Divider(
                height: 10,
                thickness: 1,
                endIndent: 0,
                color: Colors.grey,
              ),

              isloadingheads?
              ListView.builder(
                scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: heads.length,
                  itemBuilder: (ctx, index) {
                    return Container(
                      child:
                      Column(
                        children: <Widget>[
                          Row(
                            textDirection: TextDirection.rtl,
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: Card(
                                    elevation: 0,
                                    child: Text(
                                        heads[index]['name'].toString(),
                                      // headsTest[index].name.toString(),
                                      textDirection: TextDirection.rtl,
                                    ),
                                  )),
                              Expanded(
                                  flex: 3,
                                  child: Card(
                                    elevation: 0,
                                    child: Text(
                                      heads[index]['place_of_job'].toString(),
                                      // headsTest[index].placeOfJob.toString(),
                                      textDirection: TextDirection.rtl,
                                    ),
                                  )),
                              Expanded(
                                flex: 3,
                                child: ElevatedButton(
                                  onLongPress: (){ Clipboard.setData(new ClipboardData(text:
                                  heads[index]['phone'].toString()
                                  // headsTest[index].phone.toString()
                                  )).then((_){
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(content: Text('تم نسخ هذا الرقم للحافظة')));
                                  });
                                  },
                                  child: FittedBox(child: Text(
                                    heads[index]['phone'].toString()
                                    // headsTest[index].phone.toString()
                                  ,style: TextStyle(color: Colors.white),),),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.indigoAccent,
                                  ),
                                  onPressed: () {},),
                              ),
                              Expanded(
                                  flex: 2,
                                  child: Card(

                                    elevation: 0,
                                    child: Text(
                                      heads[index]['internal_phone'].toString() == ''||
                                          heads[index]['internal_phone']== null
                                          ? 'لايوجد'
                                          : heads[index]['internal_phone'].toString(),
                                      textDirection: TextDirection.rtl,
                                      textAlign: TextAlign.center,
                                    ),
                                  )),
                              // Expanded(
                              //     flex: 2,
                              //     child: Card(
                              //
                              //       elevation: 0,
                              //       child: Text(
                              //         headsTest[index].internalPhone.toString() == ''||
                              //             headsTest[index].internalPhone.toString() == null
                              //             ? 'لايوجد'
                              //             : headsTest[index].internalPhone.toString(),
                              //         textDirection: TextDirection.rtl,
                              //         textAlign: TextAlign.center,
                              //       ),
                              //     )),
                            ],
                          ),
                          const Divider(
                            height: 10,
                            thickness: 1,
                            endIndent: 0,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    );



                  })
                  :
              Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Color.fromARGB(0, 0, 0, 0),
                  ),
                  borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
                ),
                elevation: 20,
                child: Text('يتم تحميل البيانات ...'),
              ),
            ],
          ),
        ));
  }
}
