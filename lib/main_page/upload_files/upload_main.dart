import 'package:flutter/material.dart';
import 'package:test01/main_page/upload_files/sanctions_file/sanctions_file.dart';
import './salary_file/salary_file.dart';
import './add_emp_file/add_file.dart';
import './follow_file/follow_file.dart';
import './rate_file/rate_file.dart';
import './insurances/insurances_file.dart';
class UploadMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return UploadMainState();
  }
}

class UploadMainState extends State<UploadMain> {
  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 6,
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
                      text: 'ملف الرواتب',
                    ),
                    Tab(
                      text: 'ملف التقييم',
                    ),
                    Tab(
                      text: 'ملف المتابعة',
                    ),
                    Tab(
                      text: 'إضافة موظفين',
                    ),
                    Tab(
                      text: 'ملف العقوبات',
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
                  Salary_file(),
                  Rate_file(),
                  Follow_file(),
                  Add_file(),
                  sanctions_file(),
                  Insurances_file(),
                ],
              ))
            ],
          ),
        )),
      );
}
