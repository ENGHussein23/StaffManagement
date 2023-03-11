import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Image(
              image: AssetImage('assets/almatin_logo.png'),
              width: 120,
              height: 120,
            ),
          ),
          /*Center(
            child: Text("Al-Matin Group", style: TextStyle(color: Colors.white, fontSize: 40),),
          ),*/
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              "الرجاء القيام بتسجيل الدخول",
              style: TextStyle(color: Colors.black87, fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}
