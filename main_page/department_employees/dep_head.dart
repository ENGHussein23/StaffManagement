import 'package:flutter/material.dart';
import './dep_models/department_emp.dart';

class Dep_head extends StatelessWidget {
  late Department empdep;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        textDirection: TextDirection.rtl,
        children: const [
          Expanded(
              flex: 2,
              child: Card(

            elevation: 0,
            child: Text(
              'اسم الموظف',
              textDirection: TextDirection.rtl,
              style: TextStyle(fontWeight: FontWeight.bold,
                  color: Colors.black54,
                  fontSize: 16),
            ),
          )),
          Expanded(
              flex: 3,
              child: Card(

            elevation: 0,
            child: Text(
              'العنوان',
              textDirection: TextDirection.rtl,
              style: TextStyle(fontWeight: FontWeight.bold,
                  color: Colors.black54,
                  fontSize: 16),
            ),
          )),
          Expanded(
              flex: 3,
              child: Card(

            elevation: 0,
            child: Text(
              'تلفون',
              textDirection: TextDirection.rtl,
              style: TextStyle(fontWeight: FontWeight.bold,
                color: Colors.black54,
                  fontSize: 16),
            ),
          ),
          ),
          Expanded(
              flex: 2,
              child: Card(

            elevation: 0,
            child: Text(
              'التلفون الداخلي',
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold,
              color: Colors.black54,
              fontSize: 16),
            ),
          )),
        ],
      ),
    );
  }
}
