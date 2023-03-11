import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test01/login_screen/LoginPage.dart';
import 'package:test01/models/DEMtest01.dart';
import './dep_models/department_emp.dart';
import './dep_emp_card.dart';
import './dep_head.dart';
import 'package:test01/services/DepartmentEmployeesService.dart';
import 'package:test01/services/DESTest002.dart';
import 'package:test01/models/DepartmentEmployeesData.dart';

import 'package:http/http.dart' as http;
class Department_Employees extends StatefulWidget {  @override
  State<StatefulWidget> createState() {
    return Department_EmployeesState();
  }
}

Department emp1=Department(
    emp_name:'حسين الحاج علي',
    add:'الإدخار',
    mobile_num:'0945825568',
    internal_number:'192');
Department emp2=Department(
    emp_name:'محمد منير ربيع الصيادي',
    add:'كرم الشامي - شارع جامع الأخيار البناء المقابل لسكن الطالبات',
    mobile_num:'0987654321',
    internal_number:'');
Department emp3=Department(
    emp_name:'صالح الحايك',
    add:'النزهة',
    mobile_num:'0999999999',
    internal_number:'193');
late DeMtest01 DETEST02;
List<Data> DETest003=DETEST02!.data!;
 List <Datum> depEMPtest=[];
late DepartmentEmployeesData depEMP;
class Department_EmployeesState extends State<Department_Employees> {
  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    getDEData();

    // depEMPtest=depEMP!.data! as List<Datum>;
  }

  getDEData() async {

    DETEST02=await DepartmentEmployeesService002().getDepartmentApi();
    setState((){

      // depEMPtest=(depEMP!.data!) as Datum;
    });
    print(depEMP);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Align(
    alignment: Alignment.topCenter,
    child: LayoutBuilder(builder:
    (BuildContext context, BoxConstraints viewportConstraints) {
      return SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Container(
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
                        blurRadius: 10,
                        color: Colors.black38,
                        offset: Offset(1, 3))
                  ] // Make rounded corner of border
              ),
            width:800 ,
          padding: const EdgeInsets.all(15.0),
      child: Column(
        textDirection: TextDirection.rtl,
        children: [
          Dep_head(),
SizedBox(height: 20,),


          const Divider(
            height: 10,
            thickness: 1,
            endIndent: 0,
            color: Colors.grey,
          ),
          // Text(DETEST02!.data![0].name.toString()),
          // Text(DETEST02!.data!.length.toString()),

          // Text(DETest003.length.toString()),
          //   ListView.builder(
          //     shrinkWrap: true,
          //     itemBuilder: (ctx, index) {
          //       return Card(
          //         elevation: 5,
          //         margin: EdgeInsets.symmetric(
          //           vertical: 8,
          //           horizontal: 5,
          //         ),
          //         child: Text(DETest003[index].name.toString())
          //       );
          //     },
          //     itemCount: DETEST02!.data!.length,
          //   ),
          // ListView.builder(
          //   itemCount: DETEST02!.data!.length,
          //   itemBuilder: (context, index) {
          //     return  Text(DETEST02!.data![index].name.toString());
          //   },
          // )
          // Dep_emp_card(emp1),
          // ElevatedButton(onPressed:(){
          //   if(depEMP==null)
          //     {
          //       print('depEMP is null');
          //     }
          //   else if(depEMP!=null)
          //     {
          //       print('depEMP isnt null');
          //       // print(depEMP.data?[index]?.phone);
          //       // depEMP.data?[index]?.name
          //       print(depEMP.data?[0]?.name);
          //     }
          //
          //
          //   } , child: Text("h")),

              // Column(children: [
          DETest003.isEmpty? Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Color.fromARGB(0, 0, 0, 0),
              ),
              borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
            ),
            elevation: 20,
            child: Text('لا يوجد موظفين في القسم'),
          ):
          ListView.builder(
                    shrinkWrap: true,
                  itemCount: DETest003.length,
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
                                        DETest003[index].name.toString(),
                                        textDirection: TextDirection.rtl,
                                      ),
                                    )),
                                Expanded(
                                    flex: 3,
                                    child: Card(
                                      elevation: 0,
                                      child: Text(
                                        DETest003[index].address.toString(),
                                        textDirection: TextDirection.rtl,
                                      ),
                                    )),
                                Expanded(
                                  flex: 3,
                                  child: ElevatedButton(
                                    onLongPress: (){ Clipboard.setData(new ClipboardData(text: DETest003[index].phone.toString())).then((_){
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(content: Text('تم نسخ هذا الرقم للحافظة')));
                                    });
                                    },
                                    child: FittedBox(child: Text(DETest003[index].phone.toString(),style: TextStyle(color: Colors.white),),),
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
                                        DETest003[index].internalPhone.toString() == ''||
                                            DETest003[index].internalPhone==null
                                            ? 'لايوجد'
                                            : DETest003[index].internalPhone.toString(),
                                        textDirection: TextDirection.rtl,
                                        textAlign: TextAlign.center,
                                      ),
                                    )),
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



                    }),
              // ],)
                    ],
      )
          )
      );
    }
    )
    )
    );
  }
}
