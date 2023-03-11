import 'package:flutter/material.dart';

class MyCardSalary extends StatelessWidget {
  var xcstext;
  var ycstext;
  var zcstext;

  MyCardSalary(
      {required this.xcstext, required this.ycstext, required this.zcstext});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 600,

      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          Expanded(
            child: Card(
              child: Container(
                child: Text(
                  xcstext,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 6, 23, 24),
                  ),
                  textDirection: TextDirection.rtl,
                ),
              ),
              elevation: 0,
            ),
          ),
          Expanded(
            child: Card(
              child: Container(
                alignment: Alignment.topLeft,
                child: Text(
                  ycstext,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 6, 23, 24),
                  ),
                  textDirection: TextDirection.rtl,
                ),
              ),
              elevation: 0,
            ),
          ),
          Expanded(
            child: Card(
              child: Container(
                alignment: Alignment.topRight,
                child: Text(
                  zcstext,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 6, 23, 24),
                  ),
                  textDirection: TextDirection.rtl,
                ),
              ),
              elevation: 0,
            ),
          ),
        ],
      ),
    );
  }
}
