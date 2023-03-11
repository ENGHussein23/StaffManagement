import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:test01/main_page/Staff_management/change_followup.dart';
import 'package:test01/services/StuffMangement_Service.dart';
import './emp_profile.dart';
import './StuffMangement.dart';
class ChangeFollowup extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ChangeFollowupState();
  }
}
// bool light=true;
// bool fid=false;
// bool fjobId=false;
// bool fidPhoto=idPhoto==1?true:false;
// bool fresidenceDocument=residenceDocument==1?true:false;
// bool fnoConviction=noConviction==1?true:false;
// bool findividualCivilRecord=individualCivilRecord==1?true:false;
// bool fpersonalPhotos=personalPhotos==1?true:false;
// bool fcertificateCopy=certificateCopy==1?true:false;
// bool fmedicalReport=medicalReport==1?true:false;
// bool fmilitaryNotebook=militaryNotebook==1?true:false;

late var id;
late var tjobId;
var idPhoto=0;
var residenceDocument=0;
var noConviction=0;
var individualCivilRecord=0;
var personalPhotos=0;
var certificateCopy=0;
var medicalReport=0;
var militaryNotebook=0;
var createdAt ;
var updatedAt;
bool fidPhoto=false;
bool fresidenceDocument=false;
bool fnoConviction=false;
bool findividualCivilRecord=false;
bool fpersonalPhotos=false;
bool fcertificateCopy=false;
bool fmedicalReport=false;
bool fmilitaryNotebook=false;
//
// List FollowList = ['لم يتم التسليم', 'تم التسليم'];

class ChangeFollowupState extends State<ChangeFollowup> {
  @override
  void initState() {
    super.initState();
    getfollowupedit();
    //fetch data from API
  }
  getfollowupedit() async{
    if(resbodyf['data']!=null){
      id=resbodyf['data']['id'];
      tjobId=resbodyf['data']['job_id'];
      idPhoto=resbodyf['data']['id_photo'];
      residenceDocument=resbodyf['data']['residence_document'];
      noConviction=resbodyf['data']['no_conviction'];
      individualCivilRecord=resbodyf['data']['individual_civil_record'];
      personalPhotos=resbodyf['data']['personal_photos'];
      certificateCopy=resbodyf['data']['certificate_copy'];
      medicalReport=resbodyf['data']['medical_report'];
      militaryNotebook=resbodyf['data']['military_notebook'];
      createdAt=resbodyf['data']['created_at'];
      updatedAt=resbodyf['data']['updated_at'];
      setState(() {
        fidPhoto=idPhoto==1?true:false;
        fresidenceDocument=residenceDocument==1?true:false;
        fnoConviction=noConviction==1?true:false;
        findividualCivilRecord=individualCivilRecord==1?true:false;
        fpersonalPhotos=personalPhotos==1?true:false;
        fcertificateCopy=certificateCopy==1?true:false;
        fmedicalReport=medicalReport==1?true:false;
        fmilitaryNotebook=militaryNotebook==1?true:false;
      });
    }

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
              color: Color.fromARGB(0, 0, 0, 0), // Set border color
              width: 1.0), // Set border width
          borderRadius: BorderRadius.all(
              Radius.circular(10.0)), // Set rounded corner radius
          boxShadow: [
            BoxShadow(
                blurRadius: 10, color: Colors.black, offset: Offset(1, 3)),
          ] // Make rounded corner of border
          ),
      alignment: Alignment.center,
      child: Column(
        children: [
          Text(
            'الأوراق الشخصية المتبقية :',
            textDirection: TextDirection.rtl,
          ),
          const Divider(
            height: 10,
            thickness: 2,
            //  indent: 20,
            endIndent: 0,
            color: Colors.black54,
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            readOnly: true,
            controller: idcontroller,
            textAlign: TextAlign.end,
            decoration: InputDecoration(
              // icon: Icon(Icons.perm_identity),
              border: OutlineInputBorder(),
              // border: InputBorder.none,
              labelText: 'الرقم الوظيفي',
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            verticalDirection: VerticalDirection.up,
            textDirection: TextDirection.rtl,
            children: [
              Expanded(
                child: Text(
                  'صورة عن الهوية',
                  textDirection: TextDirection.rtl,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child:  Switch(
                  // This bool value toggles the switch.
                  value: fidPhoto,
                  activeColor: Colors.indigo,
                  onChanged: (bool value) {
                    // This is called when the user toggles the switch.
                    setState(() {
                      fidPhoto = value;
                    });
                  },
                )
              )
            ],
          ),
          SizedBox(
            height: 2,
          ),
          const Divider(
            height: 10,
            thickness: 1,
            endIndent: 0,
            color: Colors.grey,
          ),
          SizedBox(
            height: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            verticalDirection: VerticalDirection.up,
            textDirection: TextDirection.rtl,
            children: [
              Expanded(
                child: Text(
                  'سند الإقامة',
                  textDirection: TextDirection.rtl,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child:
                Switch(
                  // This bool value toggles the switch.
                  value: fresidenceDocument,
                  activeColor: Colors.indigo,
                  onChanged: (bool value) {
                    // This is called when the user toggles the switch.
                    setState(() {
                      fresidenceDocument = value;
                    });
                  },
                )
              )
            ],
          ),
          SizedBox(
            height: 2,
          ),
          const Divider(
            height: 10,
            thickness: 1,
            endIndent: 0,
            color: Colors.grey,
          ),
          SizedBox(
            height: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            verticalDirection: VerticalDirection.up,
            textDirection: TextDirection.rtl,
            children: [
              Expanded(
                child: Text(
                  'لاحكم عليه',
                  textDirection: TextDirection.rtl,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child:Switch(
                  // This bool value toggles the switch.
                  value: fnoConviction,
                  activeColor: Colors.indigo,
                  onChanged: (bool value) {
                    // This is called when the user toggles the switch.
                    setState(() {
                      fnoConviction = value;
                    });
                  },
                )
              ),
            ],
          ),
          SizedBox(
            height: 2,
          ),
          const Divider(
            height: 10,
            thickness: 1,
            endIndent: 0,
            color: Colors.grey,
          ),
          SizedBox(
            height: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            verticalDirection: VerticalDirection.up,
            textDirection: TextDirection.rtl,
            children: [
              Expanded(
                child: Text(
                  'اخراج قيد فردي',
                  textDirection: TextDirection.rtl,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child:  Switch(
                  // This bool value toggles the switch.
                  value: findividualCivilRecord,
                  activeColor: Colors.indigo,
                  onChanged: (bool value) {
                    // This is called when the user toggles the switch.
                    setState(() {
                      findividualCivilRecord = value;
                    });
                  },
                )
              )
            ],
          ),
          SizedBox(
            height: 2,
          ),
          const Divider(
            height: 10,
            thickness: 1,
            endIndent: 0,
            color: Colors.grey,
          ),
          SizedBox(
            height: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            verticalDirection: VerticalDirection.up,
            textDirection: TextDirection.rtl,
            children: [
              Expanded(
                child: Text(
                  'صور شخصية',
                  textDirection: TextDirection.rtl,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child:  Switch(
                  // This bool value toggles the switch.
                  value: fpersonalPhotos,
                  activeColor: Colors.indigo,
                  onChanged: (bool value) {
                    // This is called when the user toggles the switch.
                    setState(() {
                      fpersonalPhotos = value;
                    });
                  },
                )
              )
            ],
          ),
          SizedBox(
            height: 2,
          ),
          const Divider(
            height: 10,
            thickness: 1,
            endIndent: 0,
            color: Colors.grey,
          ),
          SizedBox(
            height: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            verticalDirection: VerticalDirection.up,
            textDirection: TextDirection.rtl,
            children: [
              Expanded(
                child: Text(
                  'صورة عن الشهادة العلمية',
                  textDirection: TextDirection.rtl,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Switch(
                  // This bool value toggles the switch.
                  value: fcertificateCopy,
                  activeColor: Colors.indigo,
                  onChanged: (bool value) {
                    // This is called when the user toggles the switch.
                    setState(() {
                      fcertificateCopy = value;
                    });
                  },
                )
              )
            ],
          ),
          SizedBox(
            height: 2,
          ),
          const Divider(
            height: 10,
            thickness: 1,
            endIndent: 0,
            color: Colors.grey,
          ),
          SizedBox(
            height: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            verticalDirection: VerticalDirection.up,
            textDirection: TextDirection.rtl,
            children: [
              Expanded(
                child: Text(
                  'تقرير طبي',
                  textDirection: TextDirection.rtl,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Switch(
                  // This bool value toggles the switch.
                  value: fmedicalReport,
                  activeColor: Colors.indigo,
                  onChanged: (bool value) {
                    // This is called when the user toggles the switch.
                    setState(() {
                      fmedicalReport = value;
                    });
                  },
                )
              )
            ],
          ),
          SizedBox(
            height: 2,
          ),
          const Divider(
            height: 10,
            thickness: 1,
            endIndent: 0,
            color: Colors.grey,
          ),
          SizedBox(
            height: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            verticalDirection: VerticalDirection.up,
            textDirection: TextDirection.rtl,
            children: [
              Expanded(
                child: Text(
                  'صورة عن دفتر العلم',
                  textDirection: TextDirection.rtl,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Switch(
                  // This bool value toggles the switch.
                  value: fmilitaryNotebook,
                  activeColor: Colors.indigo,
                  onChanged: (bool value) {
                    // This is called when the user toggles the switch.
                    setState(() {
                      fmilitaryNotebook = value;
                    });
                  },
                )
              )
            ],
          ),
          SizedBox(
            height: 2,
          ),
          const Divider(
            height: 10,
            thickness: 1,
            endIndent: 0,
            color: Colors.grey,
          ),
          SizedBox(
            height: 2,
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Expanded(
                child: FloatingActionButton.extended(
                  onPressed: () async {

                    idPhoto=fidPhoto?1:0;
                     residenceDocument=fresidenceDocument?1:0;
                     noConviction=fnoConviction?1:0;
                     individualCivilRecord=findividualCivilRecord?1:0;
                     personalPhotos=fpersonalPhotos?1:0;
                     certificateCopy=fcertificateCopy?1:0;
                     medicalReport=fmedicalReport?1:0;
                     militaryNotebook=fmilitaryNotebook?1:0;
                    setState(() {});
                    print(
                        int.parse(idcontroller.text).toString()+"-------------------"+
                     idPhoto.toString()+"--------------------"+
                     residenceDocument.toString()+"--------------------"+
                     noConviction.toString()+"--------------------"+
                     individualCivilRecord.toString()+"--------------------"+
                     personalPhotos.toString()+"--------------------"+
                     certificateCopy.toString()+"--------------------"+
                     medicalReport.toString()+"--------------------"+
                     militaryNotebook.toString()+"--------------------"

                    );
                    var dataf={
                      'id': id ,
                      'job_id': int.parse(idcontroller.text)==null||int.parse(idcontroller.text)==0?empsjobId:int.parse(idcontroller.text),
                      'id_photo': idPhoto,
                      'residence_document': residenceDocument ,
                      'no_conviction':noConviction ,
                      'individual_civil_record': individualCivilRecord,
                      'personal_photos': personalPhotos,
                      'certificate_copy': certificateCopy,
                      'medical_report': medicalReport,
                      'military_notebook': militaryNotebook,
                      'created_at': createdAt,
                      'updated_at':updatedAt

                    };
                    var resupdate = await StuffMangement_Service()
                        .postData(dataf, '/api/followup/update');
                    var resbodyupdate = json.decode(resupdate.body);
                    print(resbodyupdate);
                    if(resbodyupdate['success'])
                      {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('تم تحديث بيانات الأوراق الشخصية بنجاح',textAlign: TextAlign.center,)));
                      }
                    // success: true
                    // print(emp_test.powers);
                  },
                  label: const Text('حفظ تعديلات الأوراق الشخصية'),
                  icon: const Icon(Icons.drive_folder_upload_rounded,),
                  backgroundColor: Colors.indigoAccent,
                ),
              ),
              // Expanded(child: Card(child: Text(emp_test.powers),))
            ],
          ),
        ],
      ),
    );
  }
}
