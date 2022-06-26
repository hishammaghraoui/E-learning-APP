import 'package:flutter/material.dart';
import 'package:flutter_app2/models/user.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:school_ui_toolkit/school_ui_toolkit.dart';

class notifi extends StatefulWidget {
  // User u ;
  // profile_screen(this.u);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _notifi();
  }


}
class _notifi extends State<notifi> {


  @override
  Widget build(BuildContext context) {
    final _kTabPages = <Widget>[
      DeadlineCardExample(),
      EventCardExample(),
    RoutineCardExample(),

    ];
    final _kTabs = <Tab>[

      const Tab(icon: Icon(Icons.alarm), text: 'Deadline'),
      const Tab(icon: Icon(Icons.event_rounded), text: 'Event'),
      const Tab(icon: Icon(Icons.bookmark), text: 'classes'),
    ];
    return DefaultTabController(
      length: _kTabs.length,
      child: Scaffold(
        appBar: AppBar(
          // If `TabController controller` is not provided, then a
          // DefaultTabController ancestor must be provided instead.
          // Another way is to use a self-defined controller, c.f. "Bottom tab
          // bar" example.
          bottom: TabBar(
            tabs: _kTabs,
          ),
        ),
        body: TabBarView(
          children: _kTabPages,
        ),
      ),
    );
  }
}
class DeadlineCardExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(
      ScreenSize.width,
      ScreenSize.height,
    ),  allowFontScaling: true);
    return  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(height: 10,),
              Text('Today !!:',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
              DeadlineCard(
                deadline: DateTime.now(),
              ),

              Container(height: 10,),
              SizedBox(
                height: ScreenUtil().setHeight(5),
              ),
              Container(height: 10,),
              Text('Next Week :',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
              Container(height: 10,),
              DeadlineCard(
                deadline: DateTime.utc(0,0,4),
                secondaryColor: SchoolToolkitColors.darkYellow,
              ),
              SizedBox(
                height: ScreenUtil().setHeight(5),
              ),
              Container(height: 10,),
              Text('Next Mounth :',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
              Container(height: 10,),
              DeadlineCard(
                deadline: DateTime.utc(0,1,5),
                secondaryColor: SchoolToolkitColors.red,
              ),
            ],
          ),
        ),

    );
  }
}
class RoutineCardExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(
      ScreenSize.width,
      ScreenSize.height,
    ),  allowFontScaling: true);
    return SingleChildScrollView(
     child:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RoutineCard(
              classTopic: 'Fundamentals of Mathematics',
              classType: 'Theory Class',
              subject: 'Mathematics',
              professor: 'Mr. Ram Prasad Yadav',
              time: '8:00 - 9:00 AM',
            ),
            SizedBox(
              height: ScreenUtil().setHeight(10),
            ),
            RoutineCard(
              classTopic: 'Pully chain',
              classType: 'Practical Class',
              subject: 'Physics',
              professor: 'Mr. Ram Prasad Yadav',
              time: '10:00 - 11:00 AM',
            ),
            SizedBox(
              height: ScreenUtil().setHeight(10),
            ),
            RoutineCard(
              classTopic: 'Pully chain',
              classType: 'Practical Class',
              subject: 'Physics',
              professor: 'Mr. Ram Prasad Yadav',
              time: '10:00 - 11:00 AM',
            ),
            SizedBox(
              height: ScreenUtil().setHeight(10),
            ),
            RoutineCard(
              classTopic: 'Pully chain',
              classType: 'Practical Class',
              subject: 'Physics',
              professor: 'Mr. Ram Prasad Yadav',
              time: '10:00 - 11:00 AM',
            ),
            SizedBox(
              height: ScreenUtil().setHeight(10),
            ),
            RoutineCard(
              classTopic: 'Pully chain',
              classType: 'Practical Class',
              subject: 'Physics',
              professor: 'Mr. Ram Prasad Yadav',
              time: '10:00 - 11:00 AM',
            ),
          ],
        ),

    )
    );
  }
}
class EventCardExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(
      ScreenSize.width,
      ScreenSize.height,
    ),  allowFontScaling: true);
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            EventCard(
              event: 'Sports week Class 3 - Class 10',
              time: '1:00 - 3:00 PM',
            ),
            SizedBox(
              height: ScreenUtil().setHeight(10),
            ),
            EventCard(
              event: 'Sports week Class 3 - Class 10',
              time: '1:00 - 3:00 PM',
              primaryColor: SchoolToolkitColors.green,
              secondaryColor: SchoolToolkitColors.lightGreen,
            ),
            SizedBox(
              height: ScreenUtil().setHeight(10),
            ),
            EventCard(
              event: 'Sports week Class 3 - Class 10',
              time: '1:00 - 3:00 PM',
              secondaryColor: SchoolToolkitColors.lighterGrey,
              primaryColor: SchoolToolkitColors.grey,
            ),
          ],
        ),

    );
  }
}
class ScreenSize {
  static const double width = 414.0;
  static const double height = 896.0;
}
