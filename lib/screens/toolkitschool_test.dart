import 'package:flutter/material.dart';
import 'package:flutter_app2/screens/assignment.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:school_ui_toolkit/school_ui_toolkit.dart';


class school extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _school();
  }

}
class _school  extends State<school>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build



    return MaterialApp(



      builder: (context, child) {
        ScreenUtil.init(
          context,
          designSize: Size(
            ScreenSize.width,
            ScreenSize.height,
          ),
          allowFontScaling: true,
        );
        return child;
      },
      home: assignment(),
    );
  }


}
class ScreenSize {
  static const double width = 414.0;
  static const double height = 896.0;
}
