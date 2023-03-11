import 'package:flutter/material.dart';
import 'package:test01/main_page/Staff_management/StuffMangement.dart';
import 'package:test01/main_page/Staff_management/emp_profile.dart';
import 'emp_details_model/emp_details_model.dart';
import './EmpCardView.dart';

// import './search_emp.dart';
import './change_pass.dart';
import './change_followup.dart';
import './edits_taps_hrm.dart';
import 'dart:convert';

import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:test01/services/StuffMangement_Service.dart';
import 'package:test01/services/FollowupEdit_Service.dart';
// import './change_followup.dart';

class StuffMangement extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StuffMangementState();
  }
}

var resbodym, resbodyf;
var resbodym2, resbodyf2;
bool issearch = false;
bool editable = false;
var empsname = '';
var empsjobId = 00;
var empsaddress = '';
var empsplaceOfJob = '';
var empsphone = '';
var empsinternalPhone = '';
var empsvacationStatus = 0;
var empschangePassword = 0;
var empsmanagerId;

var nonsearch = Container(
  width: 700,
  height: 50,
  padding: EdgeInsets.all(10),
  decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(
          color: Color.fromARGB(0, 0, 0, 0),
          // Set border color
          width: 1.0),
      // Set border width
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      // Set rounded corner radius
      boxShadow: [
        BoxShadow(blurRadius: 10, color: Colors.black87, offset: Offset(1, 3)),
      ] // Make rounded corner of border
      ),
  child: FittedBox(
    child: Text(
      'الرجاء ادخال رقم الموظف مثل : 1234',
      textAlign: TextAlign.center,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 17,
          color: Colors.black54,
          wordSpacing: 5),
    ),
  ),
);

class StuffMangementState extends State<StuffMangement> {
  TextEditingController searchtextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    searchtextController.clear();
    // super.initState();
    // if(searchtextController.text==''||searchtextController.text.isEmpty) {
    issearch = false;
    editable = false;
    //   searchtextController = TextEditingController();
    // } else {
    //   getData();
    // }
    //fetch data from API
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////
  getData() async {
    if (resbodym['data'] != null) {
      setState(() {
        issearch = true;
        editable = false;
        empsname = resbodym['data']['name'];
        empsjobId = resbodym['data']['job_id'];
        empsmanagerId = resbodym['data']['manager_id'];
        empsaddress = resbodym['data']['address'];
        empsplaceOfJob = resbodym['data']['place_of_job'];
        empsphone = resbodym['data']['phone'];
        empsinternalPhone = resbodym['data']['internal_phone'];
        empsvacationStatus = resbodym['data']['vacation_status'];
        empsrole = resbodym['data']['role'];
        empschangePassword = resbodym['data']['change_password'];
      });
    }
    // else print('data null');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Align(
            alignment: Alignment.topCenter,
            child: LayoutBuilder(builder:
                (BuildContext context, BoxConstraints viewportConstraints) {
              return SingleChildScrollView(
                  child: Container(
                padding: EdgeInsets.all(10),
                width: 700,
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: Color.fromARGB(0, 0, 0, 0),
                              // Set border color
                              width: 1.0),
                          // Set border width
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          // Set rounded corner radius
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                color: Colors.black87,
                                offset: Offset(1, 3)),
                          ] // Make rounded corner of border
                          ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: searchtextController,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                // labelText: 'أدخل رقم الموظف هنا',
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          FloatingActionButton(
                            onPressed: () async {
                              var empdata = {
                                'job_id': searchtextController.text,
                              };
                              var res = await StuffMangement_Service()
                                  .postData(empdata, '/api/management');
                              resbodym = json.decode(res.body);
                              if (resbodym['data'] != null) {
                                setState(() {
                                  issearch = true;
                                  editable = false;
                                  empsname = resbodym['data']['name'];
                                  empsjobId = resbodym['data']['job_id'];
                                  empsmanagerId = resbodym['data']['manager_id'];
                                  empsaddress = resbodym['data']['address'];
                                  empsplaceOfJob = resbodym['data']['place_of_job'];
                                  empsphone = resbodym['data']['phone'];
                                  empsinternalPhone = resbodym['data']['internal_phone'];
                                  empsvacationStatus = resbodym['data']['vacation_status'];
                                  empsrole = resbodym['data']['role'];
                                  empschangePassword = resbodym['data']['change_password'];
                                });
                              }
                              else{
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text(textAlign: TextAlign.center, textDirection: TextDirection.rtl, 'لم يتم العثور على هذا الموظف \n الرجاء التأكد من البيانات المدخلة'),
                                ));
                              }
                              var resf = await StuffMangement_Service()
                                  .postData(empdata, '/api/followup/edit');
                              resbodyf = json.decode(resf.body);
                              // ChangeFollowupState().getfollowupedit();



                              // if(resbodyf['data']!= null){
                              //   setState(() {
                              //     id=resbodyf['data']['id'];
                              //     tjobId=resbodyf['data']['job_id'];
                              //     idPhoto=resbodyf['data']['id_photo'];
                              //     residenceDocument=resbodyf['data']['residence_document'];
                              //     noConviction=resbodyf['data']['no_conviction'];
                              //     individualCivilRecord=resbodyf['data']['individual_civil_record'];
                              //     personalPhotos=resbodyf['data']['personal_photos'];
                              //     certificateCopy=resbodyf['data']['certificate_copy'];
                              //     medicalReport=resbodyf['data']['medical_report'];
                              //     militaryNotebook=resbodyf['data']['military_notebook'];
                              //     createdAt=resbodyf['data']['created_at'];
                              //     updatedAt=resbodyf['data']['updated_at'];
                              //     fidPhoto=idPhoto==1?true:false;
                              //     fresidenceDocument=residenceDocument==1?true:false;
                              //     fnoConviction=noConviction==1?true:false;
                              //     findividualCivilRecord=individualCivilRecord==1?true:false;
                              //     fpersonalPhotos=personalPhotos==1?true:false;
                              //     fcertificateCopy=certificateCopy==1?true:false;
                              //     fmedicalReport=medicalReport==1?true:false;
                              //     fmilitaryNotebook=militaryNotebook==1?true:false;
                              //   });
                              // }
                              // getData();
                              // ChangeFollowupState().getfollowupedit();
                              // setState(() {
                              //   issearch=false;
                              // });
                            },
                            child: Icon(Icons.manage_search),
                            elevation: 20,
                            backgroundColor: Colors.indigoAccent,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    issearch
                        ? Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: Color.fromARGB(0, 0, 0, 0),
                                    // Set border color
                                    width: 1.0),
                                // Set border width
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                // Set rounded corner radius
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 10,
                                      color: Colors.black87,
                                      offset: Offset(1, 3)),
                                ] // Make rounded corner of border
                                ),
                            alignment: Alignment.center,
                            child: Column(
                              children: <Widget>[
                                Row(
                                  textDirection: TextDirection.rtl,
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: Text(
                                          'الرقم',
                                          textDirection: TextDirection.rtl,
                                        )),
                                    Expanded(
                                        flex: 3,
                                        child: Text(
                                          'اسم الموظف',
                                          textDirection: TextDirection.rtl,
                                        )),
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        'خيارات',
                                        textDirection: TextDirection.rtl,
                                      ),
                                    ),
                                  ],
                                ),
                                const Divider(
                                  height: 10,
                                  thickness: 1,
                                  endIndent: 0,
                                  color: Colors.grey,
                                ),
                                Row(
                                  textDirection: TextDirection.rtl,
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: Text(
                                          empsjobId.toString(),
                                          textDirection: TextDirection.rtl,
                                        )),
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        empsname,
                                        textDirection: TextDirection.rtl,
                                      ),
                                    ),
                                    Expanded(
                                        flex: 3,
                                        child: Container(
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    elevation: 5,
                                                    primary:
                                                        Colors.indigoAccent,
                                                  ),
                                                  onPressed: () {
                                                    ChangeFollowupState()
                                                        .getfollowupedit();
                                                    setState(() {
                                                      if (!editable)
                                                        editable = true;
                                                      else
                                                        editable = false;
                                                      // editable=edit;
                                                    });
                                                  },
                                                  child: FittedBox(
                                                    child: Text('تعديل'),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 4,
                                              ),
                                              Expanded(
                                                  child: ElevatedButton(
                                                      style: ElevatedButton.styleFrom(
                                                          elevation: 5,
                                                          primary: Colors.redAccent,
                                                          side: const BorderSide(
                                                              width: 2,
                                                              // the thickness
                                                              color: Colors.red // the color of the border
                                                              )),
                                                      onPressed: () {
                                                        showDialog(
                                                            context: context,
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                              // pi();
                                                              return AlertDialog(
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                ),
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                icon: Icon(Icons
                                                                    .delete_sweep),
                                                                scrollable:
                                                                    true,
                                                                title: Text(
                                                                    'هل أنت متأكد من أمر الحذف ؟'),
                                                                content:
                                                                    Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          8.0),
                                                                  child: Form(
                                                                    child:
                                                                        Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .end,
                                                                      children: <
                                                                          Widget>[
                                                                        Text(
                                                                          'الرقم الوظيفي : ${empsjobId.toString()}',
                                                                          style:
                                                                              TextStyle(color: Colors.black87),
                                                                          textAlign:
                                                                              TextAlign.end,
                                                                        ),
                                                                        Text(
                                                                          'الإسم : ${empsname}',
                                                                          style:
                                                                              TextStyle(color: Colors.black87),
                                                                          textAlign:
                                                                              TextAlign.end,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                actions: [
                                                                  Container(
                                                                      alignment:
                                                                          Alignment
                                                                              .center,
                                                                      child:
                                                                          Row(
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                ElevatedButton(
                                                                              style: ElevatedButton.styleFrom(
                                                                                  foregroundColor: Colors.black45,
                                                                                  fixedSize: Size.fromHeight(40),
                                                                                  elevation: 15,
                                                                                  primary: Colors.white,
                                                                                  minimumSize: Size(88, 36),
                                                                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                                                                  shape: const RoundedRectangleBorder(
                                                                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                                                                  ),
                                                                                  side: const BorderSide(
                                                                                      width: 2,
                                                                                      // the thickness
                                                                                      color: Colors.black45 // the color of the border
                                                                                      )),
                                                                              child: Text('إلغاء الأمر'),
                                                                              onPressed: () {
                                                                                Navigator.of(context).pop();
                                                                              },
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                4,
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                ElevatedButton(
                                                                              style: ElevatedButton.styleFrom(
                                                                                  foregroundColor: Colors.white,
                                                                                  fixedSize: Size.fromHeight(40),
                                                                                  backgroundColor: Colors.redAccent,
                                                                                  elevation: 15,
                                                                                  minimumSize: Size(88, 36),
                                                                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                                                                  shape: const RoundedRectangleBorder(
                                                                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                                                                  ),
                                                                                  side: const BorderSide(
                                                                                      width: 2,
                                                                                      // the thickness
                                                                                      color: Colors.redAccent // the color of the border
                                                                                      )),
                                                                              child: Text('نعم متأكد'),
                                                                              onPressed: () async {
                                                                                var empdatadel = {
                                                                                  'job_id': empsjobId.toString(),
                                                                                };
                                                                                var resdel = await StuffMangement_Service().postData(empdatadel, '/api/management/deleteEmployee');
                                                                                var resbodymd = json.decode(resdel.body);

                                                                                if (resbodymd['success'] == true) {
                                                                                  Navigator.of(context).pop();
                                                                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                                                    content: Text(textAlign: TextAlign.center, textDirection: TextDirection.rtl, 'تم حذف الموظف $empsname  نهائيا'),
                                                                                  ));
                                                                                  searchtextController.clear();
                                                                                  resbodym = resbodym2;
                                                                                  resbodyf = resbodyf2;
                                                                                  issearch = false;
                                                                                  editable = false;
                                                                                  empsname = '';
                                                                                  empsjobId = 00;
                                                                                  empsaddress = '';
                                                                                  empsplaceOfJob = '';
                                                                                  empsphone = '';
                                                                                  empsinternalPhone = '';
                                                                                  empsvacationStatus = 0;
                                                                                  empschangePassword = 0;
                                                                                  empsmanagerId;
                                                                                }
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ))
                                                                ],
                                                              );
                                                            });
                                                      },
                                                      child: FittedBox(
                                                        child: Text(
                                                          'حذف',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      )))
                                            ],
                                          ),
                                        ))
                                  ],
                                ),
                              ],
                            ),
                          )
                        : nonsearch,
                    //EmpCardView(emp_test),
                    SizedBox(
                      height: 10,
                    ),
                    editable
                        ?
                        // EditsTapsHrm()
                        Column(
                            children: [
                              EmpProfile(),
                              SizedBox(
                                height: 10,
                              ),
                              ChangePass(),
                              SizedBox(
                                height: 10,
                              ),
                              ChangeFollowup(),
                            ],
                          )
                        : Container(),
                  ],
                ),
              ));
            })));
  }
}
