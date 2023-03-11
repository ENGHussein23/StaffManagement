import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:test01/login_screen/LoginPage.dart';
import 'package:test01/services/StuffMangement_Service.dart';
import './emp_profile.dart';

class ChangePass extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ChangePassState();
  }
}

class ChangePassState extends State<ChangePass> {
  late TextEditingController Passcon;
  late TextEditingController Passconfcon;

  @override
  void initState() {
    super.initState();
    Passcon = new TextEditingController();
    Passconfcon = new TextEditingController();
  }

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
      alignment: Alignment.center,
      child: Column(
        children: [
          Text(
            'تغيير كلمة السر :',
            textDirection: TextDirection.rtl,
          ),
          const Divider(
            height: 10,
            thickness: 2,
            //  indent: 20,
            endIndent: 0,
            color: Colors.black54,
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            readOnly: true,
            controller: idcontroller,
            textAlign: TextAlign.end,
            decoration: InputDecoration(
              // icon: Icon(Icons.perm_identity),
              border: OutlineInputBorder(),
              // border: InputBorder.none,
              labelText: 'الرقم الوظيفي',
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: Passcon,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                // labelText: ' كلمة المرور الجديدة',
                hintText: ' كلمة المرور الجديدة',
                hintTextDirection: TextDirection.rtl,
                hintMaxLines: 10
                // icon: Icon(Icons.password_outlined),
                ),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: Passconfcon,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                // labelText: 'تأكيد كلمة المرور',
                // labelStyle: TextStyle(),
                hintText: 'تأكيد كلمة المرور الجديدة',
                hintTextDirection: TextDirection.rtl,
                hintMaxLines: 10
                // icon: Icon(Icons.password_outlined),
                ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Expanded(
                child: FloatingActionButton.extended(
                  onPressed: () async {
                    String? pp = Passcon.text;
                    String? ppc = Passconfcon.text;
                    var changePass = {
                      'job_id': int.parse(idcontroller.text),
                      'password': Passcon.text,
                      'password_confirmation': Passconfcon.text,
                    };
                    var respass = await StuffMangement_Service().postData(
                        changePass,
                        '/api/management/editEmployee/changePassword');
                    var respassupdate = json.decode(respass.body);
                    if (Passcon.text != Passconfcon.text) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                        'الرجاء التأكد من تطابق كلمة المرور الجديدة مع تأكيدها',
                        textAlign: TextAlign.center,
                      )));
                    }
                    // else if(Passcon.text.length<=5&&Passconfcon.text.length<=5){
                    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    //       content: Text('كلمة السر يجب ان تكون من 5 خانات او اكثر',textAlign: TextAlign.center,)));
                    //
                    // }
                    else if (respassupdate['success']) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                        'تم تحديث كلمة المرور',
                        textAlign: TextAlign.center,
                      )));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                        'يجب التأكد من صحة البيانات المدخلة '
                        '\n كلمة السر يجب ان تكون من 5 خانات او اكثر'
                        '\n يجب عليك التأكد في حال عدم مطابقة بيانات الكلمة الجديدة مع التأكيد',
                        textAlign: TextAlign.center,
                      )));
                    }
                  },
                  label: const FittedBox(
                    child: Text('تحديث كلمة المرور'),
                  ),
                  icon: const Icon(Icons.update_rounded),
                  backgroundColor: Colors.indigoAccent,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
