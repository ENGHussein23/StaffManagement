import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:test01/login_screen/CallApi.dart';
import 'package:test01/main_page/SplashScreen.dart';
import 'Header.dart';
import '../main_page/mainpage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:fluttertoast/fluttertoast.dart';
class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}
late int Coki;
late String token_test;
late int depmain;

class _LoginPageState extends State<LoginPage> {
  TextEditingController passController = TextEditingController();
  TextEditingController empController = TextEditingController();
  bool passenable = true;
  String tt='';
  int ccc=0;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   ifloged();
  // }
  void ifloged()async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    tt=prefs.getString('token')!;
    ccc=prefs.getInt('Coki')!;
    if(tt!='')
      {
        token_test=tt;
        Coki=ccc;
        prefs.setString('isshown','not');
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Splash()));
      }
    else
      {

      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            color: Color.fromARGB(100, 245, 245, 245)),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 80,
            ),
            Header(),
            Expanded(
                child: Container(
              width: 500,
              // child: InputWrapper(),
              child: LayoutBuilder(
                builder:
                    (BuildContext context, BoxConstraints viewportConstraints) {
                  return SingleChildScrollView(

                    padding: EdgeInsets.all(10),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: viewportConstraints.maxHeight,
                      ),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color.fromARGB(119, 15, 45, 56), // Set border color
                                    width: 1.0),
                                color: Color.fromARGB(100, 245, 245, 245),
                                borderRadius: BorderRadius.circular(10)),
                            // child: InputField(),
                            child: Column(children: <Widget>[
                              Container(
                                // padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom:
                                            BorderSide(color: Colors.grey))),
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
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                              Container(
                                // padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom:
                                            BorderSide(color: Colors.grey))),
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
                              SizedBox(height: 5,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                //Row contents horizontally,

                                children: <Widget>[
                                  Text(
                                    passenable
                                        ? "إظهار كلمة المرور"
                                        : "إخفاء كلمة المرور",
                                    style: TextStyle(
                                        color: Colors.black87, fontSize: 18),
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
                                            passenable =
                                                true; //if passenable == false, make it true
                                          }
                                        });
                                      },
                                      icon: Icon(passenable == true
                                          ? Icons.visibility_off
                                          : Icons.visibility)),
                                ],
                              ),
                              SizedBox(height: 5,),
                            ]
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Container(
                            child: Center(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.indigo,
                                  minimumSize: Size(200, 70),
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                  ),
                                ),
                                child: Text(
                                  'تسجيل الدخول',
                                  style: TextStyle(fontSize: 20),
                                ),
                                onPressed: () async {
                                  ifloged();
                                  // _login();
                                  var data = {
                                    'job_id': empController.text,
                                    'password': passController.text,
                                  };
                                  var res = await CallApi()
                                      .postData(data, '/api/login');
                                  var resbody = json.decode(res.body);
                                  token_test = '${resbody['data']['token']}';
                                  print(token_test);
                                  print("SSSSSSSSSUUUUUUUUUIIIIIIIIIIIIIIIIIIIII");
                                  if (resbody['success'] == true) {
                                    SharedPreferences prefs=await SharedPreferences.getInstance();
                                    prefs.setString('token',token_test );

                                    Coki=resbody['data']['role'];
                                    prefs.setInt('Coki', Coki);

                                    prefs.setString('isshown','not');
                                    prefs.setInt('notcounter', 0);
                                    print(Coki);
                                    // Navigator.pushAndRemoveUntil(context,
                                    //     MaterialPageRoute(
                                    //         builder: (BuildContext context) {
                                    //   return mainpage();
                                    // }), (r) {
                                    //   return false;
                                    // });
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Splash()));
                                  } else if(resbody['success'] == false)
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text(
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          'يرجى التأكد من البيانات المدخلة'),
                                    ));
                                  else
                                    // if(resbody==null && res==null )
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text(
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          'يوجد مشكلة في الإتصال - الرجاء المحاولة لاحقا'),
                                    ));

                                },
                                onLongPress: () {

                                  // Fluttertoast.showToast(
                                  //     msg: "Developed & Programmed by Eng. Hussein Al-Haj Ali تطوير و برمجة المهندس حسين الحاج علي",
                                  //     toastLength: Toast.LENGTH_SHORT,
                                  //     gravity: ToastGravity.CENTER,
                                  //     timeInSecForIosWeb: 1,
                                  //     backgroundColor: Colors.grey,
                                  //     textColor: Colors.black54,
                                  //     fontSize: 16.0
                                  // );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(
                                        textAlign: TextAlign.center,
                                        textDirection: TextDirection.rtl,
                                        "Developed & Programmed by Eng. Hussein Al-Haj Ali \n"
                                            "تطوير و برمجة المهندس حسين الحاج علي", ),
                                    duration: Duration(seconds: 4, milliseconds: 500),
                                  ));
                                },
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 30,
                          ),
                          Text("almatin.com 2023 ©"),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                              "تطوير و برمجة فريق قسم التقانة لمجموعة المتين "),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(

        onPressed: () {  showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              alignment: Alignment.center,
              icon: Align(
                alignment: Alignment.center,
                child: SpinKitChasingDots(

                  color: Colors.indigo,
                  // type: SpinKitChasingDots.end,
                  size: 30,
                ),),
              scrollable: true,
              title: Text('برنامج إدارة موظفين شركة المتين'),
              content: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  child: Column(
                    children: const <Widget>[

                      Divider(
                        height: 3,
                        thickness: 3,
                        endIndent: 50,
                        color: Colors.indigo,
                        // indent: 10,
                      ),    Divider(
                        height: 2,
                        thickness: 2,
                        endIndent: 80,
                        color: Colors.indigoAccent ,
                        // indent: 15,
                      ),
                      SizedBox(height: 3,),
                      ExpandableText(

                            'هل نسيت كلمة السر؟ \n'
                            'في حال نسيان كلمة المرور الرجاء مراجعة قسم الموارد البشرية أو قسم تقانة المعلومات لإستعادة الكلمة',
                        expandText: 'عرض المزيد',
                        // collapseText: '⏩',
                        textDirection: TextDirection.rtl,
                        // textAlign: TextAlign.right,
                        maxLines: 2,
                        linkColor: Color(0xFF4C94A2),
                        animation: true,
                        collapseOnTextTap: true,
                        // prefixText: username,
                        // onPrefixTap: () => showProfile(username),
                        prefixStyle: TextStyle(fontWeight: FontWeight.bold),
                        // onHashtagTap: (name) => showHashtag(name),
                        hashtagStyle: TextStyle(
                          color: Color(0xFF14546C),
                        ),
                        // onMentionTap: (username) => showProfile(username),
                        mentionStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                        // animationCurve: FlippedCurve(Curves.bounceInOut),
                        // onUrlTap: (url) => launchUrl(url),
                        // urlStyle: TextStyle(
                        //   decoration: TextDecoration.underline,
                        // ),
                      ),
                      // Text('برمجة و تصميم فريق مكتب البرمجة في شركة المتين \n '),
                      SizedBox(height: 2,),
                      Divider(
                        height: 2,
                        thickness: 2,
                        endIndent: 0,
                        color: Colors.indigoAccent,
                        indent: 80,
                      ),
                      Divider(
                        height: 3,
                        thickness: 3,
                        endIndent: 0,
                        color: Colors.indigo,
                        indent: 50,
                      ),
                      SizedBox(height: 2,),
                      Text('برمجة و تصميم م. حسين الحاج علي',textAlign: TextAlign.center,style: TextStyle(wordSpacing: 2,),),

                    ],
                  ),
                ),
              ),
              actions: [

              ],
            );
          }); },
        child: Icon(Icons.info,color: Color.fromARGB(100, 0, 0, 0)),
        backgroundColor: Color.fromARGB(0, 63, 51, 181),
        elevation: 0,
        splashColor: Color.fromARGB(50, 63, 51, 181),
        hoverColor: Colors.amberAccent,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}
