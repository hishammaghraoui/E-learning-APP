import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app2/chat_place/chatpage.dart';
import 'package:flutter_app2/models/user.dart';
import 'package:flutter_app2/screens/add_course_screen.dart';
import 'package:flutter_app2/screens/assignment.dart';
import 'package:flutter_app2/screens/classes_screen.dart';
import 'package:flutter_app2/screens/home_screen_student.dart';
import 'package:flutter_app2/screens/profile_test.dart';
import 'package:flutter_app2/screens/reade%20_course.dart';
import 'package:flutter_app2/screens/toolkitschool_test.dart';

import 'home_screen_teacher.dart';

class navbar2 extends StatefulWidget {
  int l;
  int who;
  navbar2(this.l, this.who);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _navbar();
  }

}
class _navbar extends State<navbar2>{
  int currentIndex=0;
  PageController _pageController;
User m;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => currentIndex = index);
          },
          children: <Widget>[
            theHomeScreen1(widget.l),
            ChatPage(m),
            classes(widget.l),
            // school(),
            add_course(widget.l),
            // read_course(widget.l),
            notifi(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
          animationDuration: Duration(milliseconds: 100),
          curve:  Curves.easeInOutCirc,
          selectedIndex: currentIndex,
          onItemSelected: (index) => setState(() {
            currentIndex = index;
            _pageController.animateToPage(index,
                duration: Duration(milliseconds: 200), curve: Curves.ease);
          }),
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
              icon : Icon(Icons.home),
              title: Text('Home'),
              activeColor: Colors.orange,
            ),
            BottomNavyBarItem(
              icon : Icon(Icons.chat),
              title: Text('Chat'),
              activeColor: Colors.red,
            ),
            BottomNavyBarItem(
                icon : Icon(Icons.person),
                title: Text('Classes'),
                activeColor: Colors.purpleAccent
            ),
            BottomNavyBarItem(
                icon : Icon(Icons.library_books),
                title: Text('Media Library'),
                activeColor: Colors.blue
            ),
            BottomNavyBarItem(
              icon : Icon(Icons.notifications_active_rounded),
              title: Text('Notifcations'),
              activeColor: Colors.green,
            ),
          ]
      ),
    );
  }

}