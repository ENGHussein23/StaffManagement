import 'package:flutter/material.dart';
import 'package:test01/main_page/vacation_requests/vacation_requests.dart';
import './emp_details_model/emp_details_model.dart';
import '../Staff_management/StuffMangement.dart';

class EmpCardView extends StatefulWidget {
  late EmpDetailsModel test_mangement;
  EmpCardView(test_mangement) {
    this.test_mangement = test_mangement;
  }

  @override
  State<EmpCardView> createState() => _EmpCardViewState();
}

class _EmpCardViewState extends State<EmpCardView> {
  bool edit=false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
              color: Colors.indigoAccent, // Set border color
              width: 1.0), // Set border width
          borderRadius: BorderRadius.all(
              Radius.circular(10.0)), // Set rounded corner radius
          boxShadow: [
            BoxShadow(
                blurRadius: 10, color: Colors.black38, offset: Offset(1, 3)),
          ] // Make rounded corner of border
          ),
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          Row(
            textDirection: TextDirection.rtl,
            children: [
              Expanded(
                  flex: 1,
                  child: Text(
                    'الرقم',
                    textDirection: TextDirection.rtl,
                  )),
              Expanded(
                  flex: 3,
                  child: Text(
                    'اسم الموظف',
                    textDirection: TextDirection.rtl,
                  )),
              Expanded(
                flex: 3,
                child: Text(
                  'خيارات',
                  textDirection: TextDirection.rtl,
                ),
              ),
            ],
          ),
          const Divider(
            height: 10,
            thickness: 1,
            endIndent: 0,
            color: Colors.grey,
          ),
          Row(
            textDirection: TextDirection.rtl,
            children: [
              Expanded(
                  flex: 1,
                  child: Text(
                    widget.test_mangement.id,
                    textDirection: TextDirection.rtl,
                  )),
              Expanded(
                flex: 3,
                child: Text(
                  widget.test_mangement.name,
                  textDirection: TextDirection.rtl,
                ),
              ),
              Expanded(
                  flex: 3,
                  child: Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blueAccent,
                            ),
                            onPressed: () {
                              setState(() {
                                if(!editable) editable=true;
                                else editable=false;
                               // editable=edit;
                                print(edit);
                              });
                            },
                            child: FittedBox(
                              child: Text('تعديل'),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Expanded(
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.redAccent,
                                ),
                                onPressed: () {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(
                                        textAlign: TextAlign.center,
                                        textDirection: TextDirection.rtl,
                                        'تم حذف الموظف نهائيا'),
                                  ));
                                },
                                child: FittedBox(
                                  child: Text('حذف'),
                                )))
                      ],
                    ),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
