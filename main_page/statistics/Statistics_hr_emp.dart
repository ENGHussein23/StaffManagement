import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:test01/login_screen/LoginPage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class StatisticsHR extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StatisticsHRState();
  }
}

class StatisticsHRState extends State<StatisticsHR> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHttpStatisticsData();
  }

  String testtesttest = '';
  late var lasttest;
  late var resbodylast;
  String EmpCount = '0';
  String HeadCount = '0';
  String VacationCount = '0';
  String tttoday = "${DateTime.now().toLocal()}".split(' ')[0];
  String testtttoday = "${DateTime.now()}";
  getHttpStatisticsData() async {
    Uri myURL = Uri.https('emp.almatin.com', '/api/statistics', {'q': 'dart'});
    http.Response response = await http.get(myURL, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token_test'
    });
    var jsonn = response.body;
    lasttest = json.decode(jsonn);
    if (lasttest['data'] != null) {
      setState(() {
        EmpCount = lasttest['data']['employeeCount'].toString();
        HeadCount = lasttest['data']['headCount'].toString();
        VacationCount = lasttest['data']['vacationCount'].toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.all(10),
            child: Column(children: <Widget>[
              // تاريخ اليوم
              Container(
                width: 700,
                child: Row(
                  children: [
                    Expanded(
                        child: Card(
                          elevation: 15,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Color.fromARGB(0, 0, 0, 0),
                            ),
                            borderRadius: BorderRadius.circular(5.0), //<-- SEE HERE
                          ),
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 4,
                              ),
                              FittedBox(
                                child: Text('تاريخ اليوم'),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              const Divider(
                                height: 10,
                                thickness: 1,
                                endIndent: 0,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              FittedBox(
                                child: Text(tttoday),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
              //عدد رؤساء الأقسام
              Container(
                width: 700,
                child: Row(
                  children: [
                    Expanded(
                        child: Card(
                          elevation: 15,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Color.fromARGB(0, 0, 0, 0),
                            ),
                            borderRadius: BorderRadius.circular(5.0), //<-- SEE HERE
                          ),
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 4,
                              ),
                              FittedBox(
                                child: Text('عدد رؤساء الاقسام'),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              const Divider(
                                height: 10,
                                thickness: 1,
                                endIndent: 0,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              FittedBox(
                                child: Text(HeadCount),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
              //عدد الموظفين
              Container(
                width: 700,
                child: Row(
                  children: [
                    Expanded(
                        child: Card(
                      elevation: 15,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Color.fromARGB(0, 0, 0, 0),
                        ),
                        borderRadius: BorderRadius.circular(5.0), //<-- SEE HERE
                      ),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 4,
                          ),
                          FittedBox(
                            child: Text('عدد الموظفين'),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          const Divider(
                            height: 10,
                            thickness: 1,
                            endIndent: 0,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          FittedBox(
                            child: Text(EmpCount),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                        ],
                      ),
                    )),

                  ],
                ),
              ),
              // // عدد الإجازات اليوم
              // Container(
              //   width: 700,
              //   child: Row(
              //     children: [
              //       Expanded(
              //           child: Card(
              //             elevation: 15,
              //             shape: RoundedRectangleBorder(
              //               side: BorderSide(
              //                 color: Color.fromARGB(0, 0, 0, 0),
              //               ),
              //               borderRadius: BorderRadius.circular(5.0), //<-- SEE HERE
              //             ),
              //             child: Column(
              //               children: <Widget>[
              //                 SizedBox(
              //                   height: 4,
              //                 ),
              //                 FittedBox(
              //                   child: Text('عدد الاجازات اليوم'),
              //                 ),
              //                 SizedBox(
              //                   height: 2,
              //                 ),
              //                 const Divider(
              //                   height: 10,
              //                   thickness: 1,
              //                   endIndent: 0,
              //                   color: Colors.grey,
              //                 ),
              //                 SizedBox(
              //                   height: 2,
              //                 ),
              //                 FittedBox(
              //                   child: Text(VacationCount),
              //                 ),
              //                 SizedBox(
              //                   height: 4,
              //                 ),
              //               ],
              //             ),
              //           )),
              //     ],
              //   ),
              // ),


            ])));
  }
}
