import 'package:flutter/material.dart';
import './rate_file/rate_file.dart';
import './insurances/insurances_file.dart';
class irUploadMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return irUploadMainState();
  }
}

class irUploadMainState extends State<irUploadMain> {
  @override
  Widget build(BuildContext context) => DefaultTabController(
    length: 2,
    child: Scaffold(
      // appBar: AppBar(
      //   title: Text("Flutter TabBar Example - Customized "),
      // ),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 45,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(25.0)),
                child: TabBar(
                  isScrollable: true,
                  indicator: BoxDecoration(
                      color: Colors.indigoAccent,
                      borderRadius: BorderRadius.circular(25.0)),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  tabs: const [

                    Tab(
                      text: 'ملف التقييم',
                    ),

                    Tab(
                      text: 'ملف التأمينات',
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: TabBarView(
                    children: [
                      Rate_file(),
                      Insurances_file(),
                    ],
                  ))
            ],
          ),
        )),
  );
}
