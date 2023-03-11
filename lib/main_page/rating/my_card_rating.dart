import 'package:flutter/material.dart';

class MyCardRating extends StatelessWidget {
  var xcrtext;
  var ycrtext;

  MyCardRating({required this.xcrtext, required this.ycrtext});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 600,

      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          Expanded(
            flex: 2,
            child: Card(
              child: Container(
                child: Text(
                  xcrtext,
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
            flex: 3,
            child: Card(
              child: Container(
                child: Text(
                  ycrtext,
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
