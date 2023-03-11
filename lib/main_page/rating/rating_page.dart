import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'my_card_rating.dart';
import 'package:test01/models/EvaluationModel.dart';
import 'package:test01/services/Evaluation_Service.dart';
import 'package:test01/models/InsuranceModel.dart';
import 'package:test01/services/Insurance_Service.dart';
import 'package:test01/models/PenaltyModel.dart';
import 'package:test01/services/Penalty_Service.dart';
import 'package:test01/models/FollowupModel.dart';
import 'package:test01/services/Followup_Service.dart';

import 'package:http/http.dart' as http;

class ratingpage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ratingpageState();
  }
}

var Jid = 'جار التحميل ...';
// rate
// var ratenull='';
bool ratenull=false;
var latest_evaluation;
var manager_evaluation;
var hr_evaluation;
var cons;
var pros;
var manager_recommendations;
var hr_recommendations;
var created_at;
var updated_at;

//followup
bool followup=false;
var id_photo;
var residence_document;
var no_conviction;
var individual_civil_record;
var personal_photos;
var certificate_copy;
var medical_report;
var military_notebook;

//insuranc
bool insurancnull=false;
var social_insurance;
var insurance_salary;
var date_registration;
var social_insurance_number;

//penalty
bool penaltynull=false;
var penalties;
var final_ammount;
var penalties_date;

// late EvaluationData user_rate_json;
// late var user_rate_json22;
late EvaluationData user_rate;
late InsuranceData user_insurance;
late PenaltyData user_penalty;
late FollowupData user_followup;



class ratingpageState extends State<ratingpage> {
  @override
  void initState() {
    super.initState();

    //fetch data from API
    getData();
    getInsuranceData();
    getPenaltyData();
    getFollowupData();
  }

  getData() async {
    ////////////////////////////////////////////////////////////////////////////////////////////////
    user_rate = await EvaluationService().getEvaluationUser();

    if (user_rate.data != null) {
      setState(() {
        ratenull=true;
        Jid = user_rate.data.jobId.toString();
        latest_evaluation = user_rate.data.latestEvaluation;
        manager_evaluation = user_rate.data.managerEvaluation;
        hr_evaluation = user_rate.data.hrEvaluation;
        cons = user_rate.data.cons;
        pros = user_rate.data.pros;
        manager_recommendations = user_rate.data.managerRecommendations;
        hr_recommendations = user_rate.data.hrRecommendations;
        created_at = user_rate.data.createdAt;
        updated_at = user_rate.data.updatedAt;
      });
    } else print('data null');
  }
getInsuranceData() async {

  user_insurance = await InsuranceService().getInsuranceUser();
  if(user_insurance.data!=null)
  {
    setState(() {
      insurancnull=true;
      social_insurance=user_insurance.data.socialInsurance;
      insurance_salary=user_insurance.data.insuranceSalary;
      date_registration=user_insurance.data.dateRegistration;
      //StartDate = "${selectedDate.toLocal()}".split(' ')[0];
      social_insurance_number=user_insurance.data.socialInsuranceNumber;
    });
  }
  else print('user_insuranc null');
}
  getPenaltyData() async{
    user_penalty=await PenaltyService().getPenaltyUser();
    if(user_penalty.data!=null)
      {
        penaltynull=true;
        penalties=user_penalty.data.penalties;
        final_ammount=user_penalty.data.finalAmmount;
        penalties_date=user_penalty.data.penaltiesDate;
      }
    else print('user_penalty null');
  }
  getFollowupData() async {

    user_followup = await FollowupService().getFollowupUser();
    if(user_followup.data!=null)
    {
      setState(() {
        followup=true;
        id_photo=user_followup.data.idPhoto;
        residence_document=user_followup.data.residenceDocument;
        no_conviction=user_followup.data.noConviction;
        individual_civil_record=user_followup.data.individualCivilRecord;
        personal_photos=user_followup.data.personalPhotos;
        certificate_copy=user_followup.data.certificateCopy;
        medical_report=user_followup.data.medicalReport;
        military_notebook=user_followup.data.militaryNotebook;


      });
    }
    else print('user_followup null');
  }




  var ratenon=Container(
    padding: EdgeInsets.all(10),
    width: 700,
    decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          // color: Colors.indigoAccent,
            color: Color.fromARGB(0, 0, 0, 0),
            // Set border color
            width: 1.0),
        // Set border width
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        // Set rounded corner radius
        boxShadow: [
          BoxShadow(
              blurRadius: 10,
              color: Colors.black,
              offset: Offset(1, 3))
        ] // Make rounded corner of border
    ),
    child: Text(' لا يوجد لديك تقييم الرجاء مراجعة رئيس قسمك و الموارد البشرية ',textDirection: TextDirection.rtl,),
  );

  var penaltynon=Container(
  padding: EdgeInsets.all(10),
  width: 700,
  decoration: BoxDecoration(
  color: Colors.white,
  border: Border.all(
  // color: Colors.indigoAccent,
  color: Color.fromARGB(0, 0, 0, 0),
  // Set border color
  width: 1.0),
  // Set border width
  borderRadius: BorderRadius.all(Radius.circular(10.0)),
  // Set rounded corner radius
  boxShadow: [
  BoxShadow(
  blurRadius: 10,
  color: Colors.black,
  offset: Offset(1, 3))
  ] // Make rounded corner of border
  ),
  child: Text(' لا يوجد عليك عقوبات ',textDirection: TextDirection.rtl,),
  );
  ////////////
  var insurancenon=Container(
    padding: EdgeInsets.all(10),
    width: 700,
    decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          // color: Colors.indigoAccent,
            color: Color.fromARGB(0, 0, 0, 0),
            // Set border color
            width: 1.0),
        // Set border width
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        // Set rounded corner radius
        boxShadow: [
          BoxShadow(
              blurRadius: 10,
              color: Colors.black,
              offset: Offset(1, 3))
        ] // Make rounded corner of border
    ),
    child: Text(' لا يوجد لديك معلومات تأمين ',textDirection: TextDirection.rtl,),
  );
  ////////////

  var follownon=Container(
  padding: EdgeInsets.all(10),
  width: 700,
  decoration: BoxDecoration(
  color: Colors.white,
  border: Border.all(
  // color: Colors.indigoAccent,
  color: Color.fromARGB(0, 0, 0, 0),
  // Set border color
  width: 1.0),
  // Set border width
  borderRadius: BorderRadius.all(Radius.circular(10.0)),
  // Set rounded corner radius
  boxShadow: [
  BoxShadow(
  blurRadius: 10,
  color: Colors.black,
  offset: Offset(1, 3))
  ] // Make rounded corner of border
  ),
  child: Text('لا يوجد لديك سجل في ملف متابعة الأوراق الشخصية \n'
      ' الرجاء مراجعة قسم الموارد البشرية',textDirection: TextDirection.rtl,),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Align(child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
      return SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(children: <Widget>[

                SizedBox(height: 15,),
                //////////////////
                ratenull?
                Container(
                  padding: EdgeInsets.all(10),
                  width: 700,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          // color: Colors.indigoAccent,
                          color: Color.fromARGB(0, 0, 0, 0),
                          // Set border color
                          width: 1.0),
                      // Set border width
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      // Set rounded corner radius
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            color: Colors.black,
                            offset: Offset(1, 3))
                      ] // Make rounded corner of border
                      ),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'معلومات التقييم',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Divider(
                        height: 10,
                        thickness: 3,
                        //  indent: 20,
                        endIndent: 0,
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      MyCardRating(
                          xcrtext: 'الرقم الوظيفي:',
                          ycrtext:
                              Jid == null ? 'جار التحميل ...' : Jid.toString()),
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
                      MyCardRating(
                          xcrtext: 'محصلة آخر تقييم:',
                          ycrtext: latest_evaluation == null
                              ? 'لايوجد'
                              : latest_evaluation.toString()+' %'),
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
                      MyCardRating(
                          xcrtext: 'تقييم المدير المباشر:',
                          ycrtext: manager_evaluation == null
                              ? 'لايوجد'
                              : manager_evaluation.toString()+' %'),
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
                      MyCardRating(
                          xcrtext: 'تقييم الموارد البشرية:',
                          ycrtext: hr_evaluation == null
                              ? 'لايوجد'
                              : hr_evaluation.toString()+' %'),

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
                      MyCardRating(
                          xcrtext: 'نقاط القوة:',
                          ycrtext: pros == null ? 'لايوجد' : pros.toString()),
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
                      MyCardRating(
                          xcrtext: 'نقاط الضعف:',
                          ycrtext: cons == null ? 'لايوجد' : cons.toString()),
                      // SizedBox(
                      //   height: 2,
                      // ),
                      // const Divider(
                      //   height: 10,
                      //   thickness: 1,
                      //   endIndent: 0,
                      //   color: Colors.grey,
                      // ),
                      // SizedBox(
                      //   height: 2,
                      // ),
                      // MyCardRating(
                      //     xcrtext: 'توصيات المدير المباشر:',
                      //     ycrtext: manager_recommendations == null
                      //         ? 'لايوجد'
                      //         : manager_recommendations.toString()),
                      // SizedBox(
                      //   height: 2,
                      // ),
                      // const Divider(
                      //   height: 10,
                      //   thickness: 1,
                      //   endIndent: 0,
                      //   color: Colors.grey,
                      // ),
                      // SizedBox(
                      //   height: 2,
                      // ),
                      // MyCardRating(
                      //     xcrtext: 'توصيات الموارد البشرية:',
                      //     ycrtext: hr_recommendations == null
                      //         ? 'لايوجد'
                      //         : hr_recommendations.toString()),
                      //
                      /////////////
                      SizedBox(
                        height: 2,
                      ),
                    ],
                  ),
                )
                :ratenon,
                SizedBox(
                  height: 20,
                ),
               insurancnull?
               Container(
                  padding: EdgeInsets.all(10),
                  width: 700,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          // color: Colors.redAccent, // Set border color
                          color: Color.fromARGB(0, 0, 0, 0),
                          width: 1.0),
                      // Set border width
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      // Set rounded corner radius
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            color: Colors.black,
                            offset: Offset(1, 3))
                      ] // Make rounded corner of border
                      ),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'التسجيل بالتأمينات الإجتماعية',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Divider(
                        height: 10,
                        thickness: 3,
                        //  indent: 20,
                        endIndent: 0,
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      MyCardRating(
                          xcrtext: 'مسجل بالتأمينات:',
                          ycrtext: social_insurance == 1 ? '✓' : '✘'),
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
                      MyCardRating(
                          xcrtext: 'رقم التأمينات:',
                          ycrtext:
                          // social_insurance_number == 0||social_insurance_number==null
                          //     ? 'لا يوجد'
                          //     :
                          social_insurance_number.toString()),
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
                      MyCardRating(
                          xcrtext: 'الراتب التأميني:',
                          ycrtext: insurance_salary == 0||insurance_salary==null
                              ? 'لا يوجد'
                              : insurance_salary.toString()),
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
                      MyCardRating(
                          // final_salary_update="${user_salary.data.the1.updatedAt.toLocal()}".split(' ')[0]
                          xcrtext: 'تاريخ التسجيل بالتأمينات الاجتماعية:',
                          ycrtext: date_registration == null
                              ? 'لا يوجد'
                              : "${date_registration.toLocal()}".split(' ')[0]),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ):
                insurancenon,
                SizedBox(
                  height: 20,
                ),
                penaltynull?Container(
                  padding: EdgeInsets.all(10),
                  width: 700,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          // color: Colors.redAccent, // Set border color
                          color: Color.fromARGB(0, 0, 0, 0),
                          width: 1.0),
                      // Set border width
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      // Set rounded corner radius
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            color: Colors.black,
                            offset: Offset(1, 3))
                      ] // Make rounded corner of border
                      ),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'معلومات العقوبات',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Divider(
                        height: 10,
                        thickness: 3,
                        //  indent: 20,
                        endIndent: 0,
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      MyCardRating(
                          xcrtext: 'سبب العقوبة:',
                          ycrtext: penalties == null
                              ? 'لا يوجد'
                              : penalties.toString()),
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
                      MyCardRating(
                          xcrtext: 'المبلغ النهائي:',
                          ycrtext: final_ammount.toString()),
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
                      MyCardRating(
                          xcrtext: 'تاريخ العقوبة:',
                          ycrtext: penalties_date == null
                              ? 'لا يوجد'
                              : "${penalties_date.toLocal()}".split(' ')[0]),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ):penaltynon,
                SizedBox(
                  height: 20,
                ),
                followup?Container(
                  padding: EdgeInsets.all(10),
                  width: 700,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          // color: Colors.teal, // Set border color
                          color: Color.fromARGB(0, 0, 0, 0),
                          width: 1.0),
                      // Set border width
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      // Set rounded corner radius
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            color: Colors.black,
                            offset: Offset(1, 3))
                      ] // Make rounded corner of border
                      ),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'الأوراق الشخصية المتبقية',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Divider(
                        height: 10,
                        thickness: 3,
                        //  indent: 20,
                        endIndent: 0,
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      MyCardRating(
                          xcrtext: 'صورة عن الهوية:',
                          ycrtext: id_photo == 1 ? '✓' : '✘'),
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
                      MyCardRating(
                          xcrtext: 'سند الاقامة:',
                          ycrtext: residence_document == 1 ? '✓' : '✘'),
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
                      MyCardRating(
                          xcrtext: 'لا حكم عليه:',
                          ycrtext: no_conviction == 1 ? '✓' : '✘'),
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
                      MyCardRating(
                          xcrtext: 'اخراج قيد فردي:',
                          ycrtext: individual_civil_record == 1 ? '✓' : '✘'),
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
                      MyCardRating(
                          xcrtext: 'صور شخصية:',
                          ycrtext: personal_photos == 1 ? '✓' : '✘'),
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
                      MyCardRating(
                          xcrtext: 'صورة عن الشهادة العلمية:',
                          ycrtext: certificate_copy == 1 ? '✓' : '✘'),
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
                      MyCardRating(
                          xcrtext: 'تقرير طبي:',
                          ycrtext: medical_report == 1 ? '✓' : '✘'),
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
                      MyCardRating(
                          xcrtext: 'صورة عن دفتر العلم:',
                          ycrtext: military_notebook == 1 ? '✓' : '✘'),
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
                      Text(' يجب عليك استكمال الاوراق التي بجانبها ✘ لدى الموارد البشرية ',textDirection: TextDirection.rtl,style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ):follownon,
              ]
              )
          )
      );
    })));
  }
}
