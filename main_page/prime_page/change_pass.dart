import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ChangePass extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ChangePassState();
  }

}

class ChangePassState extends State<ChangePass> {  @override
  Widget build(BuildContext context) {
    return Card(child: Container(

      alignment: Alignment.topRight,
      padding: EdgeInsets.all(10),
      width: 700,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
              color: Colors.indigoAccent, // Set border color
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
        crossAxisAlignment: CrossAxisAlignment.start,
        textDirection: TextDirection.rtl,
        children: [
          Text('تغيير كلمة المرور :',textAlign: TextAlign.end,textDirection: TextDirection.rtl,style: TextStyle(
            //fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: Colors.black,
          ),),
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
          Row(children: [
            Expanded(child:     ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.indigoAccent,
                ),
                onPressed: () {},
                child: FittedBox(
                  child: Text('تغيير كلمة المرور'),
                )),),

            SizedBox(width: 4,),
            Expanded(child:  ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.redAccent,
                ),
                onPressed: () {
                },
                child: FittedBox(
                  child: Text('تسجيل الخروج'),
                ))),
          ],)
        ],),
    ),)

    ;
  }
}
