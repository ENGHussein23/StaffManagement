import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:test01/main_page/Staff_management/StuffMangement.dart';
import 'package:test01/services/StuffMangement_Service.dart';
import './emp_details_model/emp_details_model.dart';

class EmpProfile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EmpProfileState();
  }
}

late TextEditingController idcontroller;
late TextEditingController namecontroller;
late TextEditingController addcontroller;
late TextEditingController work_locationcontroller;
late TextEditingController change_passcontroller;
late TextEditingController mobilecontroller;
late TextEditingController head_idcontroller;
late TextEditingController internal_numbercontroller;
late TextEditingController powerscontroller;

var empsrole;
var hinttextt = '';

class EmpProfileState extends State {
  var indtest;

  List AouthList = [
    "موظف",
    "موظف موارد مسؤول توظيف",
    "موظف موارد مسؤول رواتب",
    "موظف موارد مسؤول تقييم و تأمينات",
    "موظف موارد مسؤول متابعة و عقوبات",
    "رئيس قسم",
    "رئيس قسم تقانة المعلومات",
    "رئيس قسم الموارد البشرية",
    "إدارة عامة",
    "مطور النظام"
  ];
  List AouthListNum = [0, 1, 2, 3, 4, 10, 11, 12, 20, 99];

  power_index(var ind) {
    for (int i = 0; i < 10; i++) {
      if (AouthListNum[i] == ind) {
        // indtest=i;
        return i;
      }
    }
  }

  power_index_re(var ind) {
    for (int i = 0; i < 10; i++) {
      if (AouthList[i] == ind) {
        indtest = i;
        return i;
      }
    }
  }

  @override
  void initState() {
    super.initState();
    // StuffMangementState().getData();
    // hinttextt=AouthList[power_index(empsrole)];
    var roletest = resbodym['data']['role'];
    powerscontroller = new TextEditingController(text: AouthList[power_index(roletest)]);
    idcontroller = new TextEditingController(text: empsjobId.toString());
    head_idcontroller = new TextEditingController(text: empsmanagerId.toString());
    namecontroller = new TextEditingController(text: empsname);
    addcontroller = new TextEditingController(text: empsaddress);
    work_locationcontroller = new TextEditingController(text: empsplaceOfJob);
    // change_passcontroller = new TextEditingController(text: empschangePassword.toString());
    mobilecontroller = new TextEditingController(text: empsphone);
    internal_numbercontroller = new TextEditingController(text: empsinternalPhone.toString());
  }

  var AouthChoose;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
              color: Color.fromARGB(0, 0, 0, 0), // Set border color
              width: 1.0), // Set border width
          borderRadius: BorderRadius.all(
              Radius.circular(10.0)), // Set rounded corner radius
          boxShadow: [
            BoxShadow(
                blurRadius: 10, color: Colors.black, offset: Offset(1, 3)),
          ] // Make rounded corner of border
          ),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 6,
          ),

          TextField(
            readOnly: true,
            controller: idcontroller,
            textAlign: TextAlign.end,
            decoration: InputDecoration(
              icon: Icon(Icons.perm_identity),
              border: OutlineInputBorder(),
              // border: InputBorder.none,
              labelText: 'الرقم الوظيفي',
            ),
          ),
          SizedBox(
            height: 6,
          ),

          TextField(
            // onChanged: (namecontroller) =>test=namecontroller.toString(),
            controller: namecontroller,
            //textDirection: TextDirection.rtl,
            textAlign: TextAlign.end,
            decoration: InputDecoration(
              icon: Icon(Icons.perm_contact_calendar_sharp),
              border: OutlineInputBorder(),
              // border: InputBorder.none,
              labelText: 'الاسم',
            ),
          ),
          SizedBox(
            height: 6,
          ),
          TextField(
            controller: addcontroller,
            textAlign: TextAlign.end,
            decoration: InputDecoration(
              icon: Icon(Icons.location_city_rounded),
              border: OutlineInputBorder(),
              labelText: 'العنوان',
            ),
          ),
          SizedBox(
            height: 6,
          ),
          TextField(
            controller: work_locationcontroller,
            textAlign: TextAlign.end,
            decoration: InputDecoration(
              icon: Icon(Icons.factory_outlined),
              border: OutlineInputBorder(),
              labelText: 'مكان العمل',
            ),
          ),
          SizedBox(
            height: 6,
          ),
          TextField(
            controller: mobilecontroller,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.end,
            decoration: InputDecoration(
              icon: Icon(Icons.phone_android),
              border: OutlineInputBorder(),
              labelText: 'رقم الموبايل',
            ),
          ),
          SizedBox(
            height: 6,
          ),
          TextField(

            controller: head_idcontroller,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.end,
            decoration: InputDecoration(
              icon: Icon(Icons.person_pin),
              border: OutlineInputBorder(),
              labelText: 'رقم رئيس القسم',
              hintTextDirection: TextDirection.rtl
            ),
          ),
          SizedBox(
            height: 6,
          ),
          TextField(
            controller: internal_numbercontroller,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.end,
            decoration: InputDecoration(
              icon: Icon(Icons.phone_callback_sharp,color: Colors.black54),
              border: OutlineInputBorder(),
              labelText: 'رقم التيلفون الداخلي',
            ),
          ),
          SizedBox(
            height: 6,
          ),
          // Row(
          //   children: [
          //     Expanded(
          //       flex: 5,
          //       child:  TextField(
          //         controller: change_passcontroller,
          //         textAlign: TextAlign.end,
          //         decoration: InputDecoration(
          //           icon: Icon(Icons.password),
          //           border: OutlineInputBorder(),
          //           labelText: 'تغيير كلمة المرور',
          //         ),
          //       ),),
          //     // Expanded(child:  FloatingActionButton(
          //     //   onPressed: () {
          //     //     setState(() {
          //     //
          //     //     });
          //     //     print(emp_test.powers);
          //     //   },
          //     //   child: Icon(Icons.save,),
          //     //   // label: const Text('حفظ كلمة المرور الجديدة'),
          //     //
          //     //   backgroundColor: Colors.indigoAccent,
          //     //   // child: Text('حفظ كلمة المرور الجديدة')
          //     //
          //     // ), ),
          //     // Expanded(child: Card(child: Text(emp_test.powers),))
          //   ],
          // ),
          // SizedBox(
          //   height: 6,
          // ),
          Container(
            height: 100,
            alignment: Alignment.topRight,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                  color: Colors.grey, // Set border color
                  width: 1.0), // Set border width
              borderRadius: BorderRadius.all(
                  Radius.circular(2.0)), // Set rounded corner radius
            ),
            child:
                // Column(
                //   children: <Widget>[
                // TextField(
                //   readOnly: true,
                //   controller: powerscontroller,
                //   textAlign: TextAlign.end,
                //   decoration: InputDecoration(
                //     border: OutlineInputBorder(),
                //     labelText: 'الصلاحية الحالية',
                //   ),
                // ),

                Column(
              mainAxisAlignment: MainAxisAlignment.center,
              verticalDirection: VerticalDirection.down,
              textDirection: TextDirection.rtl,
              children: [
                Row(verticalDirection: VerticalDirection.up,textDirection: TextDirection.rtl,children: [
                  Icon(Icons.app_registration_outlined),
                  SizedBox(width: 4,),
                  FittedBox(
                    child: Text('الصلاحيات:'),
                  ),
                ],),
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
                  height: 1,
                ),
                // SizedBox(
                //   width: 10,
                // ),

                  Expanded(child: DropdownButton(
                    icon: null,
                    underline: const Divider(
                      height: 0,
                      thickness: 0,
                      endIndent: 0,
                      color: Color.fromARGB(0, 0, 0, 0),
                    ),
                    elevation: 15,
                    hint: FittedBox(child: Text(powerscontroller.text,
                        textAlign: TextAlign.center
                    ),
                    ),
                    value: AouthChoose,
                    alignment: Alignment.center,
                    isExpanded: false,
                    onChanged: (value) {
                      setState(() {
                        AouthChoose = value;
                        power_index_re(value);
                        empsrole = AouthListNum[indtest];
                        powerscontroller =
                        new TextEditingController(text: AouthList[indtest]);
                      });
                    },
                    items: AouthList.map((valueItem) {
                      print(empsrole);

                      return DropdownMenuItem(
                          value: valueItem, child: Align(alignment: Alignment.topRight, child: FittedBox(child: Card(color: Color.fromARGB(0, 0, 0, 0),child: Text(valueItem,textAlign: TextAlign.center),elevation: 0,),),));
                    }).toList(),
                    borderRadius: BorderRadius.all(Radius.circular(2.0)),
                  ),)

              ],
            ),
            //   ],
            // ),
          ),
          SizedBox(
            height: 7,
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              // FloatingActionButton(onPressed: (){
              //   print(empsrole);
              // }),
              Expanded(
                child: FloatingActionButton.extended(
                  onPressed: () async {
                    var dataup = {
                      "name": namecontroller.text,
                      "job_id": int.parse(idcontroller.text),
                      "address": addcontroller.text,
                      "place_of_job": work_locationcontroller.text,
                      "phone": mobilecontroller.text,
                      "internal_phone": internal_numbercontroller.text,
                      "role": empsrole,
                      "change_password": empschangePassword,
                      "manager_id": int.parse(head_idcontroller.text),
                    };
                    var resdata = await StuffMangement_Service()
                        .postData(dataup, '/api/management/editEmployee');
                    var resdataupdate = json.decode(resdata.body);
                    if (resdataupdate['success']==true) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                        'تم تحديث المعلومات بنجاح',
                        textAlign: TextAlign.center,
                      )));
                    }
                    setState(() {});
                  },
                  label: const Text(' حفظ التعديلات '),
                  icon: const Icon(Icons.save),
                  backgroundColor: Colors.indigoAccent,
                ),
              ),
              // Expanded(child: Card(child: Text(emp_test.powers),))
            ],
          ),
        ],
      ),
    );
  }
}
