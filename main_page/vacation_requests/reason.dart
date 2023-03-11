import 'package:flutter/material.dart';
class  Reason_Card extends StatelessWidget{
  String RR='';

  Reason_Card(String RR){
    RR=this.RR;
  }
  @override
  Widget build(BuildContext context) {
    return Card(

      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.black87,
        ),
        borderRadius: BorderRadius.circular(5.0), //<-- SEE HERE
      ),
      elevation: 0,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Text(RR,
          style: TextStyle(
            color: Colors.black38,
            fontWeight: FontWeight.normal,
            fontSize: 14,
          ),

        ),
      ),
    );
  }

  }


