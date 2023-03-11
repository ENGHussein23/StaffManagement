import 'package:flutter/material.dart';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';
import 'dart:io';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
class sanctions_file extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return sanctions_fileState();
  }
}

class sanctions_fileState extends State<sanctions_file> {
  late File file;
  String filename='';
  @override
  Widget build(BuildContext context) {
    return Padding(padding:const EdgeInsets.all(10),
        child:Container(
          child: Column(
            textDirection: TextDirection.rtl,
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                'ملف العقوبات :',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(
                          color: Colors.black38, // Set border color
                          width: 2.0), // Set border width
                      borderRadius: BorderRadius.all(
                          Radius.circular(5.0)), // Set rounded corner radius
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            color: Colors.black38,
                            offset: Offset(1, 3))
                      ] // Make rounded corner of border
                  ),
                  //color: Colors.grey[200],
                 // height: 40,
                  width: 700,
                  child: Row(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.center,child: Text(filename),),),
                      Container(
                        color:Colors.indigoAccent,
                        child:
                        IconButton(
                          onPressed: ()async {
                            FilePickerResult? result = await FilePicker.platform.pickFiles(
                              type: FileType.custom,
                              allowedExtensions: ['xlsx'],
                            );
                            if (result != null) {
                              // File file = File(result.files.single.path.toString());
                              file =File(result.files.single.path.toString());


                              print(file);
                              print(file.path);
                              setState(() {
                                filename=file.path;
                              });
                            } else {
                              // User canceled the picker
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(content: Text(textAlign: TextAlign.center,textDirection: TextDirection.rtl,'الرجاء اختيار ملفات اكسل ذات لاحقة (xlax)'),));

                            }

                          }, icon: Icon(Icons.file_upload_outlined, color: Colors.white,),

                        ),
                      ),
                    ],
                  )),
              SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.indigoAccent,
                    borderRadius: BorderRadius.circular(25.0),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          color: Colors.black38,
                          offset: Offset(1, 3))
                    ] ),
                height: 60,
                width: 200,
                // color: Colors.indigoAccent,
                child: TextButton(
                  onPressed: () async {
// Create a multipart request
                    var request = http.MultipartRequest(
                        'POST',
                        Uri.parse(
                            'https://emp.almatin.com/api/penalty/import'));

// Create multipart using filepath, string or bytes
                    var multipartFile =
                    await http.MultipartFile.fromPath('file', file.path);

// Add file to multipart
                    request.files.add(multipartFile);

// Send request
                    var response = await request.send();
                    print(
                        response.statusCode); // print the response status code
                    if (response.statusCode == 200) {
                      // check the status code

                      // Get response stream
                      var responseData = await response.stream.toBytes();

                      // Convert response stream to String
                      var responseString = String.fromCharCodes(responseData);

                      print(responseString);  // print the response data
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(
                        content: Text(
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.rtl,
                            'تم رفع الملف بنجاح'),
                      ));
                      print('true'); // return true if successfull else false

                    } else {
                      // ScaffoldMessenger.of(context)
                      //     .showSnackBar(SnackBar(
                      //   content: Text(
                      //       textAlign: TextAlign.center,
                      //       textDirection: TextDirection.rtl,
                      //       'حدث فشل في رفع الملف , الرجاء التأكد من الإتصال بالإنترنت ثم إعادة المحاولة'),
                      // ));
                      print('false'); // return false if not successfull

                    }
                  },
                  child: Text(
                    'رفع و تحديث الملفات',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              // SizedBox(height: 30,),
              // Container(
              //   child:  SpinKitFadingCircle(
              //     color: Colors.indigoAccent,
              //     size: 100,
              //   ),
              // ),
            ],
          ),
        )
    );
  }
}
