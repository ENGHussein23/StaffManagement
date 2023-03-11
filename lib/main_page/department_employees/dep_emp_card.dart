import 'package:flutter/material.dart';
import 'package:test01/main_page/vacation_requests/vacation_requests.dart';
import './dep_models/department_emp.dart';
import 'package:flutter/services.dart';
class Dep_emp_card extends StatelessWidget {
  late Department empdep;

  Dep_emp_card(this.empdep);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            textDirection: TextDirection.rtl,
            children: [
              Expanded(
                  flex: 2,
                  child: Card(
                elevation: 0,
                child: Text(
                  empdep.emp_name,
                  textDirection: TextDirection.rtl,
                ),
              )),
              Expanded(
                  flex: 3,
                  child: Card(
                elevation: 0,
                child: Text(
                  empdep.add,
                  textDirection: TextDirection.rtl,
                ),
              )),
              Expanded(
                flex: 3,
                  child: ElevatedButton(
                    onLongPress: (){ Clipboard.setData(new ClipboardData(text: empdep.mobile_num)).then((_){
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text('تم نسخ هذا الرقم للحافظة')));
                    });
                    },
                    child: FittedBox(child: Text(empdep.mobile_num,style: TextStyle(color: Colors.white),),),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.indigoAccent,
                    ),
                    onPressed: () {},),
                  ),
              Expanded(
                  flex: 2,
                  child: Card(

                elevation: 0,
                child: Text(
                  empdep.internal_number == ''
                      ? 'لايوجد'
                      : empdep.internal_number,
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                ),
              )),
            ],
          ),
          const Divider(
            height: 10,
            thickness: 1,
            endIndent: 0,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
