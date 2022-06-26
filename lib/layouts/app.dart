// import 'package:flutter/material.dart';
// import 'package:flutter_app2/chat_place/chatpage.dart';
// import 'package:flutter_app2/models/user.dart';
// import 'package:flutter_app2/screens/add_user_screen.dart';
// import 'package:flutter_app2/screens/classes_screen.dart';
// import 'package:flutter_app2/screens/home_screen_student.dart';
//
// import 'package:flutter_app2/screens/login_screen.dart';
// import 'package:flutter_app2/screens/profile_test.dart';
// import 'file:///C:/Users/Hicham%20Maghraoui/AndroidStudioProjects/flutter_app2/lib/screens/add_course_screen.dart';
// import '../screens/forget_password_screen.dart';
// import 'tabItem.dart';
// import 'bottomNavigation.dart';
// import 'screens.dart';
//
// class App extends StatefulWidget {
// User y ;
// App(this.y);
//   @override
//   State<StatefulWidget> createState() => AppState();
// }
//
// class AppState extends State<App> {
//   // this is static property so other widget throughout the app
//   // can access it simply by AppState.currentTab
//   static int currentTab = 0;
//   User l=null ;
//   AppState()  {
//     // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
//     //     Userlogin()), (Route<dynamic> route) => false);
//   l=widget.y;
//     // indexing is necessary for proper funcationality
//     // of determining which tab is active
//     tabs.asMap().forEach((index, details) {
//       details.setIndex(index);
//     });
//   }
//   // list tabs here
//   final List<TabItem> tabs = [
//     TabItem(
//         tabName: "Classes",
//         icon: Icons.person,
//         page: classes() ),
//     TabItem(
//         tabName: "Messages",
//         icon: Icons.chat,
//         page: ChatPage() ),
//     TabItem(
//       tabName: "Home",
//       icon: Icons.home,
//       page: theHomeScreen(),
//     ),
//     TabItem(
//       tabName: "Notifications",
//       icon: Icons.notifications_active_rounded,
//       page: profile_screen(),
//     ),
//     TabItem(tabName: "Courses", icon: Icons.library_books, page: add_course())
//   ];
//
//
//
//   // sets current tab index
//   // and update state
//   void _selectTab(int index) {
//     if (index == currentTab) {
//       // pop to first route
//       // if the user taps on the active tab
//       tabs[index].key.currentState.popUntil((route) => route.isFirst);
//     } else {
//       // update the state
//       // in order to repaint
//       setState(() => currentTab = index);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // WillPopScope handle android back btn
//     return WillPopScope(
//       onWillPop: () async {
//         final isFirstRouteInCurrentTab =
//         !await tabs[currentTab].key.currentState.maybePop();
//         if (isFirstRouteInCurrentTab) {
//           // if not on the 'main' tab
//           if (currentTab != 0) {
//             // select 'main' tab
//             _selectTab(0);
//             // back button handled by app
//             return false;
//           }
//         }
//         // let system handle back button if we're on the first route
//         return isFirstRouteInCurrentTab;
//       },
//       // this is the base scaffold
//       // don't put appbar in here otherwise you might end up
//       // with multiple appbars on one screen
//       // eventually breaking the app
//       child: Scaffold(
//         // indexed stack shows only one child
//         resizeToAvoidBottomInset: false,
//        // resizeToAvoidBottomPadding: false,
//         extendBody: true,
//         body: IndexedStack(
//           index: currentTab,
//           children: tabs.map((e) => e.page).toList(),
//         ),
//         // Bottom navigation
//         bottomNavigationBar: BottomNavigation(
//           onSelectTab: _selectTab,
//           tabs: tabs,
//         ),
//       ),
//     );
//   }
// }