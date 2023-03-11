import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:test01/main_page/department_employees/dep_head.dart';
import 'package:test01/models/DEMtest01.dart';
import 'package:http/http.dart' as http;
import 'package:test01/login_screen/LoginPage.dart';

class DepartmentTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DepartmentTestState();
  }

}

class DepartmentTestState extends State<DepartmentTest> {
  // @override
  // void initState(){
  //   // TODO: implement initState
  //   super.initState();
  //   getDepartmentApi();
  //   // depEMPtest=depEMP!.data! as List<Datum>;
  // }



  Future<DeMtest01> getDepartmentApi() async {
    Uri myURL = Uri.http(
        'https://emp.almatin.com', '/api/departmentEmployees', {'q': 'dart'});
    http.Response response = await http.get(myURL,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token_test'
        });
    var jsonData = jsonDecode(response.body.toString());

    return DeMtest01.fromJson(jsonData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
        body: Column(children: [
          Dep_head(),
Text(getDepartmentApi().toString()),
       // Expanded(child:  FutureBuilder<DeMtest01>(
       //     future: getDepartmentApi(),
       //     builder: (context, snapshot) {
       //       if(snapshot.hasData){
       //         return ListView.builder(
       //           itemCount: snapshot.data!.data!.length,
       //           itemBuilder: (context, index) {
       //             return Column(children: [
       //               Text(index.toString()),
       //             ],);
       //           },);
       //       }
       //       else{
       //         return Text ('Loading');
       //       }
       //
       //     })),


    ],
    ),
    );
    }


}