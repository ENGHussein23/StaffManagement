import 'package:flutter/material.dart';
import 'package:test01/main_page/upload_files/follow_file/follow_file.dart';
import 'package:test01/main_page/upload_files/sanctions_file/sanctions_file.dart';
import './rate_file/rate_file.dart';
import './insurances/insurances_file.dart';
class sfUploadMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return sfUploadMainState();
  }
}

class sfUploadMainState extends State<sfUploadMain> {
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
                      text: 'ملف المتابعة',
                    ),

                    Tab(
                      text: 'ملف العقوبات',
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: TabBarView(
                    children: [
                      Follow_file(),
                      sanctions_file(),
                    ],
                  ))
            ],
          ),
        )),
  );
}
