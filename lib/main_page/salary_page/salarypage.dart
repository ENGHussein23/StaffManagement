import 'package:flutter/material.dart';
import 'dart:core';
// import 'package:test01/main_page/prime_page/primePage.dart';
// import 'package:test01/main_page/prime_page/my_card_tile.dart';
// import 'package:test01/main_page/salary_page/salarypage.dart';
// import '../prime_page/primePage.dart';
import 'my_card_salary.dart';
import 'package:test01/models/SalaryApi.dart';
import 'package:test01/services/Salary_Service.dart';
class salarypage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return salarypageState();
  }
}

late SalaryData user_salary;
String final_salary="جار التحميل ...";
String final_salary_update="00-00-0000";
// late var list_details_of_salary;
var list_details_of_salary = [
  '',
  '',
  '',
  '',
  '',
  '',
  '',
  '',
  '',
  '',
];
// late var list_details_of_Rebates;
var list_details_of_Rebates = [
  '',
  '',
  '',
  '',
  '',
  '',
  '',
  '',
  '',
  '',
  '',
  '',
];
var id='id';
var nosalary= Container(
  height: 40,
  child: Card(
    shape: RoundedRectangleBorder(
      side: BorderSide(
        color: Color.fromARGB(0, 0, 0, 0),
      ),
      borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
    ),
    elevation: 20,
    child: FittedBox(child: Text('لا يوجد سجل للراتب في الوقت الحالي',textDirection: TextDirection.rtl,style: TextStyle(color: Colors.black54,letterSpacing: 0),),),
  ),
);
bool nos=false;
class salarypageState extends State<salarypage> {

  @override
  void initState() {
    super.initState();

    //fetch data from API
    getData();
  }

  getData() async {
    user_salary = await SalaryDataService().getSalaryUser();
    if (user_salary != null) {
      setState(() {
        nos=true;
        id=user_salary.data.jobId.toString();
        final_salary =user_salary.data.netSalary;
        final_salary_update="${user_salary.data.updatedAt.toLocal()}".split(' ')[0];
        list_details_of_salary = [
        user_salary.data.baseSalary,
        user_salary.data.motivations,
        user_salary.data.additional,
        user_salary.data.foodAllowance,
        user_salary.data.productivityMotivations,
        user_salary.data.natureWork,
        user_salary.data.variableCompensation,
        user_salary.data.fixedCompensation,
        user_salary.data.totalBenefit,
        user_salary.data.absence,
        ];
        list_details_of_Rebates = [
        user_salary.data.absenceCut,
        user_salary.data.withoutSalary,
        user_salary.data.withoutSalaryCut,
        user_salary.data.lateCut,
        user_salary.data.mobileBill,
        user_salary.data.punishments,
        user_salary.data.ordinaryAdvance,
        user_salary.data.jop,
        user_salary.data.socialInsurance,
        user_salary.data.incomeTax,
        user_salary.data.cooperatBox,
        user_salary.data.severancePay,
        ];
      });
    }
    else
      print('data null');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Align(child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
      return SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: nos?Column(children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  width: 700,
                  //height: 110,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          // color: Colors.amber, // Set border color
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
                        'الصافي للدفع',
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
                      Text(
                        final_salary + " ل.س ",
                        style: TextStyle(
                          fontSize: 23,
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      const Divider(
                        height: 10,
                        thickness: 1,
                        endIndent: 0,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      FittedBox(child: Text('  تاريخ التحديث  '+final_salary_update,),),
                      // SizedBox(
                      //   height: 20,
                      // ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
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
                        'تفاصيل الراتب',
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
                      MyCardSalary(
                          xcstext: 'رقم الموظف:',
                          ycstext: id ,
                          zcstext: ''),
                      // MyCardTile(
                      //   xctext: "رقم الموظف:",
                      //   yctext: id,
                      // ),
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
                      MyCardSalary(
                          xcstext: 'الراتب المقطوع:',
                          ycstext: list_details_of_salary[0] + ' ',
                          zcstext: 'ل.س'),
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
                      MyCardSalary(
                          xcstext: 'الحوافز:',
                          ycstext: list_details_of_salary[1] + ' ',
                          zcstext: 'ل.س'),
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
                      MyCardSalary(
                          xcstext: 'مبلغ اضافي:',
                          ycstext: list_details_of_salary[2] + ' ',
                          zcstext: 'ل.س'),
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
                      MyCardSalary(
                          xcstext: 'بدل الطعام:',
                          ycstext: list_details_of_salary[3] + ' ',
                          zcstext: 'ل.س'),
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
                      MyCardSalary(
                          xcstext: 'حوافز انتاجية:',
                          ycstext: list_details_of_salary[4] + ' ',
                          zcstext: 'ل.س'),
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
                      MyCardSalary(
                          xcstext: 'طبيعة عمل:',
                          ycstext: list_details_of_salary[5] + ' ',
                          zcstext: 'ل.س'),
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
                      MyCardSalary(
                          xcstext: 'تعويضات متغيرة:',
                          ycstext: list_details_of_salary[6] + ' ',
                          zcstext: 'ل.س'),
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
                      MyCardSalary(
                          xcstext: 'تعويضات ثابتة:',
                          ycstext: list_details_of_salary[7] + ' ',
                          zcstext: 'ل.س'),
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
                      MyCardSalary(
                          xcstext: 'مجموع الاستحقاقات:',
                          ycstext: list_details_of_salary[8] + ' ',
                          zcstext: 'ل.س'),
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
                      MyCardSalary(
                          xcstext: 'الغياب:',
                          ycstext: list_details_of_salary[9] + ' ',
                          zcstext: ' يوم'),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
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
                        'الحسومات',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w600,
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
                      MyCardSalary(
                          xcstext: 'حسم الغياب:',
                          ycstext: list_details_of_Rebates[0],
                          zcstext: ' ل.س'),
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
                      MyCardSalary(
                          xcstext: 'بلا راتب:',
                          ycstext: list_details_of_Rebates[1],
                          zcstext: ' يوم'),
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
                      MyCardSalary(
                          xcstext: 'حسم بلا راتب:',
                          ycstext: list_details_of_Rebates[2],
                          zcstext: ' ل.س'),
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
                      MyCardSalary(
                          xcstext: 'حسم التأخر:',
                          ycstext: list_details_of_Rebates[3],
                          zcstext: ' ل.س'),
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
                      MyCardSalary(
                          xcstext: 'فاتورة جوال:',
                          ycstext: list_details_of_Rebates[4],
                          zcstext: ' ل.س'),
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
                      MyCardSalary(
                          xcstext: 'عقوبات:',
                          ycstext: list_details_of_Rebates[5],
                          zcstext: ' ل.س'),
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
                      MyCardSalary(
                          xcstext: 'سلفة عادية:',
                          ycstext: list_details_of_Rebates[6],
                          zcstext: ' ل.س'),
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
                      MyCardSalary(
                          xcstext: 'جوب:',
                          ycstext: list_details_of_Rebates[7],
                          zcstext: ' ل.س'),
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
                      MyCardSalary(
                          xcstext: 'تأمينات اجتماعية:',
                          ycstext: list_details_of_Rebates[8],
                          zcstext: ' ل.س'),
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
                      MyCardSalary(
                          xcstext: 'ضريبة الدخل:',
                          ycstext: list_details_of_Rebates[9],
                          zcstext: ' ل.س'),
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
                      MyCardSalary(
                          xcstext: 'صندوق تعاون:',
                          ycstext: list_details_of_Rebates[10],
                          zcstext: ' ل.س'),
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
                      MyCardSalary(
                          xcstext: 'راتب الإنقطاع عن العمل:',
                          ycstext: list_details_of_Rebates[11],
                          zcstext: ' ل.س'),
                      SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )
              ]):nosalary));
    })));
  }
}
