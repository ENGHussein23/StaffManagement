import 'dart:convert';

import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:test01/services/StuffMangement_Service.dart';
class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}
var resbodym;
class _SearchState extends State<Search> {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
              color: Colors.grey, // Set border color
              width: 1.0), // Set border width
          borderRadius: BorderRadius.all(
              Radius.circular(10.0)), // Set rounded corner radius
          boxShadow: [
            BoxShadow(
                blurRadius: 10, color: Colors.black38, offset: Offset(1, 3)),
          ] // Make rounded corner of border
      ),
     // color: Colors.indigoAccent,
      // alignment: Alignment.topCenter,
      padding: const EdgeInsets.all(5),

      /// In AnimSearchBar widget, the width, textController, onSuffixTap are required properties.
      /// You have also control over the suffixIcon, prefixIcon, helpText and animationDurationInMilli
      // child:
      // AnimSearchBar(
      //
      //   rtl: true,
      //   helpText: 'ادخل رقم الموظف',
      //   closeSearchOnSuffixTap: true,
      //   prefixIcon: Icon(Icons.content_paste_search_sharp, color: Colors.black54,),
      //   suffixIcon: Icon(Icons.close, color: Colors.black54,),
      //   autoFocus: true,
      //   color: Color.fromARGB(255, 255, 255, 255),
      //   // inputFormatters: ,
      //   width: 700,
      //   textController: textController,
      //   style: TextStyle(color: Colors.black54),
      //   onSuffixTap: () {
      //     setState(() async {
      //       // textController.clear();
      //     var empdata={
      //       'job_id': textController.text,
      //     };
      //     var res = await StuffMangement_Service()
      //         .postData(empdata, '/api/management');
      //     resbodym = json.decode(res.body);
      //
      //     });
      //   },
      // ),
    );
  }
}