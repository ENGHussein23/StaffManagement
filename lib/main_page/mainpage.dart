import 'package:flutter/material.dart';
import 'prime_page/primePage.dart';
import 'vacation_page/vacationpage.dart';
import 'salary_page/salarypage.dart';
import 'rating/rating_page.dart';
import './vacation_requests/vacation_requests.dart';
import '../main_page/upload_files/upload_main.dart';
import './vacation_requests/testt.dart';
import 'package:badges/badges.dart';
import '../main_page/vacation_requests/request_card.dart';
import '../main_page/department_employees/department_employees.dart';
import './Staff_management/StuffMangement.dart';
import './statistics/Statistics.dart';
class mainpage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return mainpageState();
  }
}
// int VC=Vcounter;


class mainpageState extends State<mainpage> {

  int counterBar=9;
  @override
  Widget build(BuildContext context) => DefaultTabController(

        length: counterBar,
        child: Scaffold(
          appBar: AppBar(
            title: Text("شركة المتين الصناعية",style: TextStyle(color: Colors.white)),
            // فينا نحط صورة بدل النص في التايتل داخل الاب بار
          //   Container(
          //   width: 70,
          //   height: 70,
          //   child: Image.network('https://almatin.com/wp-content/uploads/2022/05/new_logo.png'),
          // ),
            centerTitle: true,
            leading: IconButton(
              color: Color.fromARGB(0, 0, 0, 0),
              icon: Icon(Icons.refresh),
              onPressed: (){
                setState(() {
                  // VC=Vcounter;
                });
              },
              iconSize: 44,
              alignment: Alignment.bottomRight,
            ),
            // leading:   ElevatedButton(
            //   onPressed: (){
            //   setState(() {
            //     if(Vcounter>=0)
            //     VC=Vcounter;
            //     else if(Vcounter<=0)
            //       {VC=0;
            //       Vcounter=0;}
            //     else if(Vcounter>0)
            //       VC=Vcounter;
            //   });
            // },
            //   onLongPress: (){
            //
            //     ScaffoldMessenger.of(context)
            //         .showSnackBar(SnackBar(content: Text(textAlign: TextAlign.center,textDirection: TextDirection.rtl,'حساب عدد طلبات الاجازة المعلقة'),));
            //   },
            //     style: ElevatedButton.styleFrom(
            //       backgroundColor: Colors.indigo,
            //       onPrimary: Colors.white,
            //       primary: Colors.grey[300],
            //       //minimumSize: Size(88, 36),
            //       padding: EdgeInsets.symmetric(horizontal: 16),
            //       shape: const RoundedRectangleBorder(
            //         borderRadius: BorderRadius.all(Radius.circular(2)),
            //       ),
            //     )
            //   ,
            //   child: Tab(
            //   icon:
            //   Badge(
            //     position: BadgePosition.topStart(),
            //     badgeContent: Text(VC.toString(),
            //       style: TextStyle(color: Colors.white),),
            //     child: Icon(Icons.refresh),
            //   ),
            //
            //   // Icon(Icons.add_comment_outlined),
            //   // text: 'عدد طلبات الإجازة',
            //
            // ),
            // ),



            // actions: [
            //
            //
            //   IconButton(
            //     icon:Icon(Icons.notifications_none),
            //     onPressed: (){},
            //   ),
            // ],
            backgroundColor: Colors.indigo,
            elevation: 20,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                  Colors.indigo,
                ]),
              ),
            ),
            bottom: TabBar(
              labelColor: Colors.amber,
              indicatorWeight: 5,
                indicatorColor: Colors.amber,
                unselectedLabelColor: Colors.white,
                overlayColor: MaterialStateColor.resolveWith((states) => Color.fromARGB(100,255,193,7)),


                isScrollable: true,
              tabs: [
                Tab(
                  icon: Icon(Icons.home),
                  text: 'الصفحة الرئيسية',
                ),
                Tab(
                  icon: Icon(Icons.add_card),
                  text: 'طلب إجازة',
                ),
                Tab(
                  icon: Icon(Icons.account_balance_wallet_rounded),
                  text: 'الاستعلام عن الراتب',
                ),
                Tab(
                  icon: Icon(Icons.rate_review_rounded),
                  text: 'التقييم و المتابعة',
                ),
                Tab(
                  icon: Icon(Icons.account_tree),
                  text: 'موظفين القسم',
                ),
                Tab(
                  icon: Icon(Icons.add_chart_outlined),
                  text: 'رفع الملفات',
                ),
                Tab(
                  icon: Icon(Icons.person_search),
                  text: 'ادارة الموظفين',
                ),
                Tab(
                  icon: Icon(Icons.stacked_bar_chart),
                  text: 'احصائيات',
                ),
                Tab(

                  icon:
                  // Badge(
                  //   position: BadgePosition.topStart(),
                  //   badgeContent: Text(VC.toString(),
                  //   style: TextStyle(color: Colors.white),),
                  //   child: Icon(Icons.add_comment_outlined),
                  // ),

                Icon(Icons.add_comment),
                  text: 'طلبات الإجازة',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              primePage(),
              vacationpage(),
              salarypage(),
              ratingpage(),
              Department_Employees(),
              UploadMain(),
              StuffMangement(),
              Statistics(),
              vacation_requests_page(),
              //Text("9"),
            ],
          ),
        ),
      );
}
