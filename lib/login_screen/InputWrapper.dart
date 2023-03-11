import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:test01/login_screen/CallApi.dart';
import 'package:test01/main_page/SplashScreen.dart';
import 'package:test01/main_page/mainpage.dart';
import 'Button.dart';
import 'InputField.dart';

class InputWrapper extends StatefulWidget {
  @override
  State<InputWrapper> createState() => _InputWrapperState();
}

class _InputWrapperState extends State<InputWrapper> {

  TextEditingController passController=TextEditingController();
  TextEditingController empController=TextEditingController();
  bool passenable = true;
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.bodyText2!,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(100, 245, 245, 245),
                        borderRadius: BorderRadius.circular(10)),
                    // child: InputField(),
                    child: Column(children: <Widget>[
                      Container(
                        // padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(color: Colors.grey))),
                        child: TextField(
                          controller: empController,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              hintText: "الرقم الوظيفي",
                              hintTextDirection: TextDirection.rtl,
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              border: InputBorder.none),
                        ),
                      ),
                      Container(
                        // padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(color: Colors.grey))),
                        child: TextField(
                          controller: passController,
                          textAlign: TextAlign.center,
                          obscureText: passenable,
                          //if passenable == true, show **, else show password character
                          decoration: InputDecoration(
                            hintText: "أدخل كلمة المرور",
                            hintTextDirection: TextDirection.rtl,
                            // labelText: "كلمة السر",
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        //Row contents horizontally,

                        children: <Widget>[
                          Text(
                            passenable ? "إظهار كلمة المرور" : "إخفاء كلمة المرور",
                            style: TextStyle(color: Colors.black87, fontSize: 18),
                          ),
                          IconButton(
                              onPressed: () {
                                //add Icon button at end of TextField
                                setState(() {
                                  //refresh UI
                                  if (passenable) {
                                    //if passenable == true, make it false
                                    passenable = false;
                                  } else {
                                    passenable = true; //if passenable == false, make it true
                                  }
                                });
                              },
                              icon: Icon(passenable == true
                                  ? Icons.remove_red_eye
                                  : Icons.remove_red_eye_outlined)),
                        ],
                      )
                    ]),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    child: Center(
                      child: ElevatedButton(

                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigo,
                          onPrimary: Colors.white,
                          minimumSize: Size(200, 70),
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(2)),
                          ),
                        ),
                        child: Text('تسجيل الدخول',style: TextStyle(fontSize: 20),),
                        onPressed: () async {
                          // // _login();
                          // var data={
                          //   'job_id':empController,
                          //   'password':passController,
                          // };
                          // var res=CallApi().postData(data,'login');
                          // var resbody= json.decode(res.body);
                          // if(resbody['success']){
                          //   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context){
                          //     return mainpage();
                          //   }), (r){
                          //     return false;
                          //   });
                          //   Navigator.push(
                          //       context, MaterialPageRoute(builder: (context) => Splash()));
                          // }
                          // else
                          //   ScaffoldMessenger.of(context)
                          //       .showSnackBar(SnackBar(
                          //     content: Text(
                          //         textAlign: TextAlign.center,
                          //         textDirection: TextDirection.rtl,
                          //         'بيانات الإعتماد هذه غير متطابقة مع البيانات المسجلة لدينا'),
                          //   ));
                          //

                        },
                        onLongPress: (){
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(
                            content: Text(
                                textAlign: TextAlign.center,
                                textDirection: TextDirection.rtl,
                                'ادخل بانات تسجيل الدخول'),
                          ));

                        },
                      ),
                    ),

                  ),
                  // Button(),
                  SizedBox(
                    height: 70,
                  ),
                  Text("almatin.com 2023 ©"),
                  SizedBox(
                    height: 5,
                  ),
                  Text("تطوير و برمجة فريق قسم التقانة لمجموعة المتين "),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
