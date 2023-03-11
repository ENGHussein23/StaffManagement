import 'package:flutter/material.dart';

class MyCardTile extends StatelessWidget {
  var xctext;
  var yctext;

  MyCardTile({required this.xctext, required this.yctext});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 600,

      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          Expanded(
            flex: 1,
            child: Card(
              child: Container(
                child: Text(
                  xctext,
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
            flex: 2,
            child: Card(
              child: Container(
                child: Text(
                  yctext,
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
