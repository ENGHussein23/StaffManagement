import 'package:flutter/material.dart';
import './emp_profile.dart';
import './change_followup.dart';
import './change_pass.dart';

class EditsTapsHrm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EditsTapsHrmState();
  }
}

class EditsTapsHrmState extends State<EditsTapsHrm> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
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
                        EmpProfile(),
                        EmpProfile(),
                        EmpProfile(),
                        EmpProfile(),
                        EmpProfile(),
                        EmpProfile(),
                      ],
                    ))
              ],
            ),
          )),
    );
  }
}
