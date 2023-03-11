import 'package:flutter/material.dart';
class errorpage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(centerTitle: true,
      backgroundColor: Colors.indigoAccent,
      elevation: 10,
          title: Text('شركة المتين الصناعية')),
      body:Align(child: Card(
        child: Text('حدث خطأ ما, يرجى محاولة تسجيل الدخول مرة أخرى لاحقا'),
      ),
      alignment: Alignment.center,),
    );
  }

}