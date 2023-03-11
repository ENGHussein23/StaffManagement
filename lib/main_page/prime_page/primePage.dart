import 'dart:convert';
import 'dart:async';
// import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:test01/login_screen/LoginPage.dart';
import 'package:test01/main_page/vacation_requests/vacation_requests.dart';
import 'my_card_tile.dart';
// import 'package:http/http.dart' as http;
import 'package:test01/models/user_model.dart';
import 'package:test01/services/user_service.dart';
// import 'package:test01/models/AllRequestVacationsTest002.dart';
import 'package:test01/services/StuffMangement_Service.dart';
import 'package:test01/services/AllRequestVacationsService.dart';
import 'package:http/http.dart' as http;
import 'package:workmanager/workmanager.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:test01/main_page/vacation_requests/vacation_requests.dart';
import 'package:shared_preferences/shared_preferences.dart';
class primePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return primePageState();
  }
}

String id = 'جار التحميل ...';
String name = 'جار التحميل ...';
String adress = 'جار التحميل ...';
String workname = 'جار التحميل ...';
String mobilenumber = 'جار التحميل ...';
String departmentHead = 'جار التحميل ...';
// bool changepass=false;
String mid = '.';
final passwordFocusNode = FocusNode();
// bool _isObscured = true;
late bool passch = true;
late bool passc = true;

late TextEditingController Passcon;
late TextEditingController Passconfcon;
late UserData user_test;
// var isLoaded = false;
// late Timer timer;
// late AllRequestVacationsTest002 RequestVacations;
// List<dynamic> RequestVacationsTest = RequestVacations.data!;
int Vcounter = 2;

class primePageState extends State<primePage> {
  Timer _timer=Timer(Duration(seconds: 1), () { });
  @override
  void initState() {
    super.initState();
    Passcon = new TextEditingController();
    Passconfcon = new TextEditingController();
    //fetch data from API
    getData();
    // getAVRData();

    // _timer = new Timer.periodic(Duration(seconds: 1),
    //         (_) => getAVRData());
    // updateseen();
  }

  // updateseen() {
  //   WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
  //         if (passch) {
  //           //if passenable == true, make it false
  //           passch = false;
  //         } else {
  //           passch = true; //if passenable == false, make it true
  //         }
  //       }));
  // }

  getData() async {
    user_test = await UserService().getUser();
    if (user_test != null) {
      setState(() {
        id = user_test.data.jobId.toString();
        name = user_test.data.name;
        adress = user_test.data.address;
        workname = user_test.data.placeOfJob;
        mobilenumber = user_test.data.phone;
        departmentHead = user_test.data.managerName;
        // isLoaded = true;
        mid = user_test.data.managerId.toString();
        print(user_test.data.name);
      });
      // return true;
    }

  }
// bool noti=false;
//   getAVRData() async {
//
//     // RequestVacationsTest=[];
//     RequestVacations =
//         await AllRequestVacationsServies().getAllRequestVacations();
//     if(RequestVacations!=null)
//       {
//         setState(() {
//           // noti=true;
//           RequestVacations = RequestVacations;
//           // depEMPtest=(depEMP!.data!) as Datum;
//         });
//       }
//     else
//       setState(() {
//         // noti=false;
//       });
//     getData();
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Align(
        // alignment: Alignment.center,
        child: LayoutBuilder(builder:
            (BuildContext context, BoxConstraints viewportConstraints) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            textDirection: TextDirection.rtl,
            children: <Widget>[
              // RequestVacationsTest.length > 0
          //     noti&& RequestVacationsTest.length>0?
          //     Container(
          // decoration: BoxDecoration(
          // color: Colors.white,
          //     border: Border.all(
          //       // color: Colors.indigoAccent, // Set border color
          //         color: Colors.amber,
          //         width: 2.0), // Set border width
          //     borderRadius: BorderRadius.all(
          //         Radius.circular(10.0)), // Set rounded corner radius
          //     boxShadow: [
          //       BoxShadow(
          //           blurRadius: 10,
          //           color: Colors.black38,
          //           offset: Offset(1, 3))
          //     ] // Make rounded corner of border
          // )
          //       ,padding: EdgeInsets.all(5),child: Card(
          //       // shape: RoundedRectangleBorder(
          //       //   side: BorderSide(
          //       //     color: Colors.amber,
          //       //   ),
          //       //   borderRadius:
          //       //   BorderRadius.circular(20.0), //<-- SEE HERE
          //       // ),
          //       elevation: 0,
          //       child: FittedBox(child: Text(
          //         'يوجد ${RequestVacationsTest.length} إجازة مرسلة  ',
          //         textDirection: TextDirection.rtl,
          //         style: TextStyle(
          //             fontSize: 17,
          //             fontWeight: FontWeight.bold),
          //       ),),
          //       margin: EdgeInsets.all(5),
          //     ),)
          //         : Container(),


              SizedBox(height: 5,),
              Container(
                padding: EdgeInsets.all(10),
                width: 700,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        // color: Colors.indigoAccent, // Set border color
                        color: Color.fromARGB(0, 0, 0, 0),
                        width: 2.0), // Set border width
                    borderRadius: BorderRadius.all(
                        Radius.circular(10.0)), // Set rounded corner radius
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          color: Colors.black38,
                          offset: Offset(1, 3))
                    ] // Make rounded corner of border
                    ),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topRight,
                      //constraints: const BoxConstraints(minWidth: 600, maxWidth: 600, maxHeight: 65, minHeight: 40),
                      // color: const Color.fromARGB(24, 25, 245, 245),
                      child: Text(
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                        'معلومات الموظف :',
                        style: TextStyle(
                          //fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    const Divider(
                      height: 10,
                      thickness: 1,
                      endIndent: 0,
                      color: Colors.black,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      // width:600,

                      child: Column(
                        children: <Widget>[
                          MyCardTile(xctext: "رقم الموظف:", yctext: id),
                          SizedBox(
                            height: 5,
                          ),
                          const Divider(
                            height: 10,
                            thickness: 1,
                            endIndent: 0,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          MyCardTile(xctext: "اسم الموظف:", yctext: name),
                          SizedBox(
                            height: 5,
                          ),
                          const Divider(
                            height: 10,
                            thickness: 1,
                            endIndent: 0,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          MyCardTile(xctext: "العنوان:", yctext: adress),
                          SizedBox(
                            height: 5,
                          ),
                          const Divider(
                            height: 10,
                            thickness: 1,
                            endIndent: 0,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          MyCardTile(xctext: "مكان العمل:", yctext: workname),
                          SizedBox(
                            height: 5,
                          ),
                          const Divider(
                            height: 10,
                            thickness: 1,
                            endIndent: 0,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          MyCardTile(
                              xctext: "رقم الموبايل:", yctext: mobilenumber),
                          SizedBox(
                            height: 5,
                          ),
                          const Divider(
                            height: 10,
                            thickness: 1,
                            endIndent: 0,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          MyCardTile(
                              xctext: "رئيس القسم:", yctext: departmentHead),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),

              // Container(
              //   width: 700,
              //   padding: EdgeInsets.all(5),
              //   child:ListView.builder(shrinkWrap: true,
              //     itemBuilder: (ctx, index) {
              //       bool res = false;
              //       return Card(
              //         shape: RoundedRectangleBorder(
              //           side: BorderSide(
              //             color: Color.fromARGB(0, 0, 0, 0),
              //           ),
              //           borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
              //         ),
              //         elevation: 20,
              //         child: Container(
              //           padding: EdgeInsets.all(10),
              //           child: Column(
              //             children: [
              //               RichText(
              //                 textAlign: TextAlign.right,
              //                 textDirection: TextDirection.rtl,
              //                 text: TextSpan(
              //                     text: 'تم إرسال طلب إجازة للموظف\\ة ',
              //                     style: TextStyle(
              //                       color: Colors.black54,
              //                       // fontWeight: FontWeight.bold,
              //                       fontSize: 16,
              //                     ),
              //                     children: [
              //
              //                       TextSpan(
              //                         text:
              //                         // RequestVacationsTest[index].jobId.toString(),
              //                         RequestVacationsTest[index].user!.name.toString(),
              //                         style: TextStyle(
              //                           color: Color.fromARGB(255, 23, 78, 98),
              //                           fontWeight: FontWeight.bold,
              //                           fontSize: 16,
              //                         ),
              //                       ),
              //                       TextSpan(
              //                         text: ' و ذلك بتاريخ ',
              //                         style: TextStyle(
              //
              //                           color: Colors.black54,
              //                           fontSize: 16,
              //                         ),
              //                       ),
              //                       TextSpan(
              //                         text: RequestVacationsTest[index].startDate.toString(),
              //                         style: TextStyle(
              //                           fontWeight: FontWeight.bold,
              //                           fontStyle: FontStyle.italic,
              //                           color: Colors.redAccent,
              //                           fontSize: 16,
              //                         ),
              //                       ),
              //                       TextSpan(
              //                         text: ' إلى ',
              //                         style: TextStyle(
              //                           color: Colors.black54,
              //                           fontSize: 16,
              //                         ),
              //                       ),
              //                       TextSpan(
              //                         text: RequestVacationsTest[index].endDate.toString(),
              //                         style: TextStyle(
              //                           fontWeight: FontWeight.bold,
              //                           fontStyle: FontStyle.italic,
              //                           color: Colors.redAccent,
              //                           fontSize: 16,
              //                         ),
              //                       ),
              //                       TextSpan(
              //
              //                         text: RequestVacationsTest[index].reasons==null||RequestVacationsTest[index].reasons=='\n'
              //                             ''?'':'\n'
              //                             '  السبب : ',
              //                         style: TextStyle(
              //                           color: Colors.black54,
              //                           fontSize: 16,
              //                         ),
              //                       ),
              //                       TextSpan(
              //                         text: RequestVacationsTest[index].reasons==null||RequestVacationsTest[index].reasons==''?'.':RequestVacationsTest[index].reasons,
              //                         style: TextStyle(
              //                           fontWeight: FontWeight.bold,
              //                           color: RequestVacationsTest[index].reasons==null||RequestVacationsTest[index].reasons==''?Colors.black54:Colors.indigo,
              //                           fontSize: 16,
              //                         ),
              //                       ),
              //                     ]),
              //               ),
              //               SizedBox(
              //                 height: 8,
              //               ),
              //
              //               res
              //                   ? Card(
              //
              //                 shape: RoundedRectangleBorder(
              //                   side: BorderSide(
              //                     color: Colors.black87,
              //                   ),
              //                   borderRadius: BorderRadius.circular(5.0), //<-- SEE HERE
              //                 ),
              //                 elevation: 0,
              //                 child: Container(
              //                   padding: EdgeInsets.all(10),
              //                   child: Text(
              //                     RequestVacationsTest[index].reasons.toString() == '' ? '' : RequestVacationsTest[index].reasons.toString(),
              //                     style: TextStyle(
              //                       color: Colors.black87,
              //                       fontWeight: FontWeight.normal,
              //                       fontSize: 14,
              //                     ),
              //                   ),
              //                 ),
              //               )
              //                   : SizedBox(
              //                 height: 8,
              //               ),
              //               Row(textDirection: TextDirection.rtl,
              //                   // verticalDirection: VerticalDirection.down,
              //                   children: [
              //                     Expanded(
              //                       child:
              //                       ElevatedButton(
              //
              //                         style: ElevatedButton.styleFrom(
              //                           fixedSize: Size.fromHeight(40),
              //                           elevation: 15,
              //                           backgroundColor: Colors.indigoAccent,
              //                           onPrimary: Colors.white,
              //                           primary: Colors.grey[300],
              //                           minimumSize: Size(88, 36),
              //                           padding: EdgeInsets.symmetric(horizontal: 16),
              //                           shape: const RoundedRectangleBorder(
              //                             borderRadius: BorderRadius.all(Radius.circular(10)),
              //                           ),
              //                         ),
              //                         child: Row(
              //
              //                           // textDirection: TextDirection.rtl,
              //                             children: [
              //                               Text('قبول'),
              //                               SizedBox(width: 4,),
              //                               Icon(Icons.credit_score_rounded)
              //                             ],
              //                             crossAxisAlignment: CrossAxisAlignment.center,
              //                             mainAxisAlignment: MainAxisAlignment.center),
              //                         onPressed: ()  async {
              //
              //                           var deletev = {
              //                             "vacation_id":RequestVacationsTest[index].id ,
              //                           };
              //                           var resdeletev = await StuffMangement_Service()
              //                               .postData(deletev, '/api/acceptVacation');
              //                           var resbodyresdeletev = json.decode(resdeletev.body);
              //                           if(resbodyresdeletev['success']==true)
              //                           {
              //                             setState(() {
              //                               RequestVacationsTest.removeAt(index);
              //                             });
              //                             ScaffoldMessenger.of(
              //                                 context)
              //                                 .showSnackBar(
              //                                 SnackBar(
              //                                   content: Text(
              //                                       textAlign:
              //                                       TextAlign
              //                                           .center,
              //                                       textDirection:
              //                                       TextDirection
              //                                           .rtl,
              //                                       'تم قبول طلب الاجازة'),
              //                                 ));
              //
              //
              //                           }
              //
              //                         },
              //                       ),
              //                     ),
              //                     SizedBox(
              //                       width: 10,
              //                     ),
              //                     Expanded(
              //                       child:  ElevatedButton(
              //
              //                         style: ElevatedButton.styleFrom(
              //                             fixedSize:Size.fromHeight(40),
              //                             elevation: 15,
              //                             // backgroundColor: Colors.redAccent,
              //                             onPrimary: Colors.indigoAccent,
              //                             primary: Colors.white,
              //                             minimumSize: Size(88, 36),
              //                             padding: EdgeInsets.symmetric(horizontal: 16),
              //                             shape: const RoundedRectangleBorder(
              //                               borderRadius: BorderRadius.all(Radius.circular(10)),
              //                             ),
              //                             side: const BorderSide(
              //                                 width: 2, // the thickness
              //                                 color: Colors.indigoAccent // the color of the border
              //                             )
              //                         ),
              //                         child: Row(
              //                           // textDirection: TextDirection.rtl,
              //                             children: [
              //                               Text('رفض'),
              //                               SizedBox(width: 4,),
              //                               Icon(Icons.cancel_outlined)
              //                             ],
              //                             crossAxisAlignment: CrossAxisAlignment.center,
              //                             mainAxisAlignment: MainAxisAlignment.center),
              //                         onPressed: () async {
              //                           // if(RequestVacationsTest[index].requestStatus==1)
              //                           //   {
              //                           var deletev = {
              //                             "vacation_id":RequestVacationsTest[index].id ,
              //                           };
              //                           var resdeletev = await StuffMangement_Service()
              //                               .postData(deletev, '/api/denyVacation');
              //                           var resbodyresdeletev = json.decode(resdeletev.body);
              //                           if(resbodyresdeletev['success']==true)
              //                           {
              //                             RequestVacationsTest[index].requestStatus!=4;
              //                             ScaffoldMessenger.of(
              //                                 context)
              //                                 .showSnackBar(
              //                                 SnackBar(
              //                                   content: Text(
              //                                       textAlign:
              //                                       TextAlign
              //                                           .center,
              //                                       textDirection:
              //                                       TextDirection
              //                                           .rtl,
              //                                       'تم رفض طلب الاجازة'),
              //                                 ));
              //                           }
              //                           setState(() {
              //                             RequestVacationsTest.removeAt(index);
              //                           });
              //                           // }
              //
              //
              //                         },
              //                       ),
              //                     ),
              //                   ])
              //               //VButton(res),
              //             ],
              //           ),
              //         ),
              //       );
              //     },
              //     itemCount: RequestVacationsTest.length>2?2:RequestVacationsTest.length, ),
              // ),
              Container(
                alignment: Alignment.topRight,
                padding: EdgeInsets.all(10),
                width: 700,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: Color.fromARGB(0, 0, 0, 0),
                        // Set border color
                        width: 1.0), // Set border width
                    borderRadius: BorderRadius.all(
                        Radius.circular(30.0)), // Set rounded corner radius
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          color: Colors.black38,
                          offset: Offset(1, 3))
                    ] // Make rounded corner of border
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  textDirection: TextDirection.rtl,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: FloatingActionButton.extended(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      alignment: Alignment.center,
                                      icon: Icon(Icons.change_circle_outlined),
                                      scrollable: true,
                                      title: Text('كلمة المرور الحديثة'),
                                      content: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Form(
                                          child: Column(
                                            children: <Widget>[
                                              Text(
                                                ' سيتم انهاء الجلسة الحالية في حال تغيير كلمة المرور ',
                                                style: TextStyle(
                                                    color: Colors.grey),
                                                textAlign: TextAlign.center,
                                              ),
                                              SizedBox(
                                                height: 4,
                                              ),
                                              TextField(
                                                obscureText: false,
                                                controller: Passcon,
                                                decoration: InputDecoration(
                                                  // icon:
                                                  // IconButton(onPressed: () {
                                                  //   updateseen();
                                                  //   // setState(() {
                                                  //   //   if (passch) {
                                                  //   //     //if passenable == true, make it false
                                                  //   //     passch = false;
                                                  //   //   } else {
                                                  //   //     passch = true; //if passenable == false, make it true
                                                  //   //   }
                                                  //   //
                                                  //   // });
                                                  // }, icon: Icon(passch
                                                  //     ? Icons.visibility_off
                                                  //     : Icons.visibility)),
                                                    border:
                                                    OutlineInputBorder(),
                                                    hintText:
                                                    ' كلمة المرور الجديدة',
                                                    hintTextDirection:
                                                    TextDirection.rtl,
                                                    hintMaxLines: 10
                                                  // icon: Icon(Icons.password_outlined),
                                                ),
                                              ),

                                              SizedBox(
                                                height: 4,
                                              ),

                                              TextField(
                                                obscureText: false,
                                                controller: Passconfcon,
                                                decoration: InputDecoration(
                                                    border:
                                                    OutlineInputBorder(),
                                                    // labelText: 'تأكيد كلمة المرور',
                                                    // labelStyle: TextStyle(),
                                                    hintText:
                                                    'تأكيد كلمة المرور الجديدة',
                                                    hintTextDirection:
                                                    TextDirection.rtl,
                                                    hintMaxLines: 10
                                                  // icon: Icon(Icons.password_outlined),
                                                ),
                                              ),
                                              // Expanded(
                                              //     flex:1,
                                              //     child:    IconButton(onPressed: (){
                                              //       setState(() {
                                              //         //refresh UI
                                              //         if (passc) {
                                              //           //if passenable == true, make it false
                                              //           passc = false;
                                              //         } else {
                                              //           passc =
                                              //           true; //if passenable == false, make it true
                                              //         }
                                              //       });
                                              //
                                              //
                                              //     }, icon: Icon(passc == true
                                              //         ? Icons.remove_red_eye
                                              //         : Icons.remove_red_eye_outlined)),),

                                              // TextFormField(
                                              //   obscureText: _isObscured,
                                              //   focusNode: passwordFocusNode,
                                              //   keyboardType: TextInputType.emailAddress,
                                              //   controller: Passcon,
                                              //   decoration: InputDecoration(
                                              //     suffixIcon: IconButton(
                                              //         padding: const EdgeInsetsDirectional.only(end: 12.0),
                                              //         icon: _isObscured ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
                                              //         onPressed: () {
                                              //           WidgetsBinding.instance.addPostFrameCallback((_) => this.setState(() {
                                              //             _isObscured =!_isObscured;
                                              //           }));
                                              //         }
                                              //     ),
                                              //     hintText: 'password',
                                              //     icon: const Icon(Icons.lock),
                                              //   ),
                                              //   validator: (value) {
                                              //     if (value == null || value.isEmpty) {
                                              //       passwordFocusNode.requestFocus();
                                              //       return 'Please enter some text';
                                              //     }
                                              //     if(value.length < 6) {
                                              //       passwordFocusNode.requestFocus();
                                              //       return 'Password must be at least 6 characters';
                                              //     }
                                              //   },
                                              // ),
                                              SizedBox(
                                                height: 4,
                                              ),
                                              Text(
                                                'الرجاء الإحتفاظ بها و تذكرها',
                                                style: TextStyle(
                                                    color: Colors.grey),
                                                textAlign: TextAlign.center,
                                              ),
                                              SizedBox(
                                                height: 4,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      actions: [
                                        Container(
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      flex: 4,
                                                      child: FloatingActionButton
                                                          .extended(
                                                        onPressed: () {
                                                          Passcon.text = '';
                                                          Passconfcon.text = '';
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        label: const FittedBox(
                                                          child:
                                                          Text('إلغاء الأمر'),
                                                        ),
                                                        // icon: const Icon(Icons.output_rounded),
                                                        backgroundColor:
                                                        Colors.indigoAccent,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 4,
                                                    ),
                                                    Expanded(
                                                      flex: 4,
                                                      child: FloatingActionButton
                                                          .extended(
                                                        onPressed: () async {
                                                          String? pp = Passcon.text;
                                                          String? ppc =
                                                              Passconfcon.text;
                                                          var changePass = {
                                                            'job_id': int.parse(id),
                                                            'password':
                                                            Passcon.text,
                                                            'password_confirmation':
                                                            Passconfcon.text,
                                                          };
                                                          var respass =
                                                          await StuffMangement_Service()
                                                              .postData(
                                                              changePass,
                                                              '/api/management/editEmployee/changePassword');
                                                          var respassupdate = json
                                                              .decode(respass.body);
                                                          if (Passcon.text !=
                                                              Passconfcon.text) {
                                                            ScaffoldMessenger.of(
                                                                context)
                                                                .showSnackBar(
                                                                SnackBar(
                                                                    content:
                                                                    Text(
                                                                      'الرجاء التأكد من تطابق كلمة المرور الجديدة مع تأكيدها',
                                                                      textAlign:
                                                                      TextAlign.center,
                                                                    )));
                                                          }
                                                          // else    if(Passcon.text.length<=5&&Passconfcon.text.length<=5){
                                                          //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                          //       content: Text('كلمة السر يجب ان تكون من 5 خانات او اكثر',textAlign: TextAlign.center,)));
                                                          //
                                                          // }
                                                          else if (respassupdate[
                                                          'success']) {
                                                            Navigator.pushAndRemoveUntil(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (BuildContext
                                                                    context) {
                                                                      return LoginPage();
                                                                    }), (r) {
                                                              return false;
                                                            });
                                                          } else {
                                                            ScaffoldMessenger.of(
                                                                context)
                                                                .showSnackBar(
                                                                SnackBar(
                                                                    content:
                                                                    Text(
                                                                      'يجب التأكد من صحة البيانات المدخلة '
                                                                          '\n كلمة السر يجب ان تكون من 5 خانات او اكثر'
                                                                          '\n يجب عليك التأكد في حال عدم مطابقة بيانات الكلمة الجديدة مع التأكيد',
                                                                      textAlign:
                                                                      TextAlign.center,
                                                                    )));
                                                          }
                                                        },
                                                        label: const FittedBox(
                                                          child:
                                                          Text('حفظ التغيرات'),
                                                        ),
                                                        // icon: const Icon(Icons.output_rounded),
                                                        backgroundColor:
                                                        Colors.indigoAccent,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                )
                                              ],
                                            ))
                                      ],
                                    );
                                  });
                            },
                            label: const FittedBox(
                              child: Text('تغيير كلمة المرور'),
                            ),
                            icon: const Icon(Icons.change_circle_outlined),
                            backgroundColor: Colors.indigoAccent,
                          ),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Expanded(
                          child: FloatingActionButton.extended(
                            onPressed: () async{
                              SharedPreferences prefs=await SharedPreferences.getInstance();
                              prefs.remove('token');
                              prefs.remove('Coki');
                              Navigator.pushAndRemoveUntil(context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) {
                                        return LoginPage();
                                      }), (r) {
                                    return false;
                                  });
                            },
                            label: const FittedBox(
                              child: Text('تسجيل الخروج'),
                            ),
                            icon: const Icon(Icons.output_rounded),
                            backgroundColor: Colors.redAccent,
                          ),
                        ),
                      ],
                    ),
                    // FloatingActionButton.extended(
                    //   onPressed: () async {
                    //     FlutterLocalNotificationsPlugin flp = FlutterLocalNotificationsPlugin();
                    //   SharedPreferences prefsnot = await SharedPreferences.getInstance();
                    //   String ttoken = prefsnot.getString('token')!;
                    //   _setHeaders() => {
                    //     'Content-type': 'application/json',
                    //     'Accept': 'application/json',
                    //     'Authorization': 'Bearer $ttoken',
                    //   };
                    //   var response = await http.get(
                    //     Uri.parse('https://emp.almatin.com/api/allRequestVacations'),
                    //     headers: _setHeaders(),
                    //   );
                    //   String testaeh='تم استقبال طلبات إجازة من : '+'\n';
                    //
                    //   var convert = json.decode(response.body);
                    //   for(int i=0;i<convert['data'].length;i++){
                    //     testaeh=testaeh+'${i+1}- '+convert['data'][i]['user']['name'].toString()+'\n';
                    //   }
                    //   var android = AndroidNotificationDetails(
                    //     largeIcon: ByteArrayAndroidBitmap(base64Decode('assets/mainmain.jpg')),
                    //     // fullScreenIntent: true,
                    //     // ledColor: Colors.blue,
                    //     playSound: true,
                    //     colorized: true,
                    //     enableLights: true,
                    //     // channelShowBadge: true,
                    //     'channel id',
                    //     'channel NAME',
                    //     icon: "@mipmap/ic_launcher",
                    //     channelDescription: 'CHANNEL DESCRIPTION',
                    //     subText: 'يوجد '+convert['data'].length.toString()+" إجازة قيد الإنتظار",
                    //     priority: Priority.high,
                    //     importance: Importance.max,
                    //     // color: Colors.indigoAccent,
                    //     styleInformation: BigTextStyleInformation(''),
                    //   );
                    //   var platform = NotificationDetails(android: android);
                    //   if(convert['data'].length>0)
                    //   {
                    //     await flp.show(0, 'برنامج موظفين شركة المتين', testaeh, platform, payload: 'vacation_requests_page');
                    //     Navigator.push(GlobalcontextServive.navigatorKey.currentContext!,
                    //         MaterialPageRoute(builder: (context)=>vacation_requests_page()));
                    //     // await flp.initialize(const InitializationSettings(),
                    //     //  onDidReceiveBackgroundNotificationResponse: (details)=> Navigator.push(
                    //     //        GlobalcontextServive.navigatorKey.currentContext!,
                    //     //        MaterialPageRoute(builder: (context)=>vacation_requests_page())),
                    //     // // );
                    //   }
                    //   else
                    //   {}
                    //   },
                    //   label: const FittedBox(
                    //     child: Text('اختبار الاشعار'),
                    //   ),
                    //   // icon: const Icon(Icons.output_rounded),
                    //   backgroundColor: Colors.blueGrey,
                    // ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),

            ],
          ),
        ),
      );
    }
    )
    )
    );
  }
}
class GlobalcontextServive{
  static GlobalKey <NavigatorState> navigatorKey =
  GlobalKey <NavigatorState> ();
}
