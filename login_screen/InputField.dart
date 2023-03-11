import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return InputFieldState();
  }
}

TextEditingController passController=TextEditingController();
TextEditingController empController=TextEditingController();
class InputFieldState extends State<InputField> {
  bool passenable = true;


  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
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
    ]);
  }
}
