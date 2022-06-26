import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app2/layouts/screens.dart';
import 'package:flutter_app2/layouts/settings_page.dart';
import 'package:flutter_app2/models/user.dart';
import 'package:flutter_app2/notes_page/notes.dart';
import 'package:flutter_app2/pages/calander.dart';
import 'package:flutter_app2/screens/proflie.dart';

import 'login_screen.dart';
class AppDrawer extends StatefulWidget{
  int y;
  AppDrawer(this.y);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AppDrawer(y);
  }

}
class _AppDrawer extends State<AppDrawer> {
  int y;
  _AppDrawer(this.y);
  User m;


  @override

  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          _createDrawerItem(icon: Icons.person, text: 'Profile',
              onTap: (){
                if (m!=null){
                  print(m.name);
                }
    Navigator.push(context, MaterialPageRoute(builder: (context) {
    return ProfilePage(y);
    }));
          }
    ),

          _createDrawerItem(icon: Icons.event, text: 'Callender',
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return  CalendarApp();
                }));
              }
          ),
          _createDrawerItem(icon: Icons.note, text: 'Notes',
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Notes();
                }));
              }
          ),
          Divider(),
          _createDrawerItem(icon: Icons.settings, text: 'Settings',
            onTap: (){
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) {
                return settings();
              }
              )
              );
              },
          ),
          _createDrawerItem(icon: Icons.logout, text: 'Log-out',onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context) { return Userlogin(); })); },),
          Divider(),
          _createDrawerItem(icon: Icons.bug_report, text: 'Report an issue'),
         Expanded(
             child: Align(
               alignment: FractionalOffset.bottomCenter,
              child : ListTile(
                 title: Text('by Hicham Maghraoui & Ayoub khedrani',style: TextStyle(color: Colors.blue),),


                 onTap: () {},
               ),
         )
         ),

        ],
      ),
    );
  }

  Widget _createHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('images/back.jpeg'))),
        child: Stack(children: <Widget>[
          Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Text("E-learning EST khenifra",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500))),
        ]));
  }
}
Widget _createDrawerItem(
    {IconData icon, String text, GestureTapCallback onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon),
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(text),
        )
      ],
    ),
    onTap: onTap,
  );
}