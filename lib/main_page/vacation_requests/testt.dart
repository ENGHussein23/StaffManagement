import 'package:flutter/material.dart';

class testt extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RichText Example',
      home: Scaffold(

        body: Center(
          child: RichText(
            text: TextSpan(
              text: ' Single ',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
              children: [
                TextSpan(
                  text: ' Line ',
                  style: TextStyle(
                    color: Colors.white,
                    backgroundColor: Colors.teal,
                    fontSize: 20,
                  ),
                ),
                TextSpan(
                  text: ' Multiple ',
                  style: TextStyle(
                    color: Colors.orange,
                    fontFamily: 'courier',
                    fontSize: 24,
                  ),
                ),
                TextSpan(
                  text: ' Styles ',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.pink,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  
}}