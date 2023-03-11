import 'package:flutter/material.dart';
import './requests_model/request.dart';

class VButton extends StatefulWidget {
  bool res=false;

  VButton(this.res);

  @override
  State<VButton> createState() => _VButtonState(res);
}

class _VButtonState extends State<VButton> {
  bool res=false;

  _VButtonState(this.res);

  @override
  Widget build(BuildContext context) {
    return Row(textDirection: TextDirection.rtl,
        // verticalDirection: VerticalDirection.down,
        children: [
          Expanded(
            child: ElevatedButton(

              style: ElevatedButton.styleFrom(
                onPrimary: Colors.lightBlue,
                primary: Colors.grey[300],
                minimumSize: Size(88, 36),
                padding: EdgeInsets.symmetric(horizontal: 16),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                ),
              ),
              child: Text('المزيد'),
              onPressed: () {
                  setState(() {
                      if(widget.res==false) res=true;
                else res=false;
                  }
                  );
                  },
            ),
    //         FlatButton(
    //             height: 50,
    //             onPressed: () {
    //               setState(() {
    //                   if(widget.res==false) res=true;
    //             else res=false;
    //               });
    // },
    //             child: Text(
    //               'المزيد',
    //               style: TextStyle(color: Colors.white),
    //             ),
    //             color: Colors.lightBlue),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: ElevatedButton(

              style: ElevatedButton.styleFrom(
                onPrimary: Colors.teal,
                primary: Colors.grey[300],
                minimumSize: Size(88, 36),
                padding: EdgeInsets.symmetric(horizontal: 16),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                ),
              ),
              child: Text('قبول'),
              onPressed: () {},
            ),

            // FlatButton(
            //   height: 50,
            //     onPressed: () {},
            //     child: Text(
            //       'قبول',
            //       style: TextStyle(color: Colors.white),
            //     ),
            //     color: Colors.teal),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child:
            ElevatedButton(

              style: ElevatedButton.styleFrom(
                onPrimary: Colors.redAccent,
                primary: Colors.grey[300],
                minimumSize: Size(88, 36),
                padding: EdgeInsets.symmetric(horizontal: 16),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                ),
              ),
              child: Text('رفض'),
              onPressed: () {},
            ),
            // FlatButton(
            //     height: 50,
            //     onPressed: () {},
            //     child: Text(
            //       'رفض',
            //       style: TextStyle(color: Colors.white),
            //     ),
            //     color: Colors.redAccent),
          ),
        ]);
  }
}
