import 'package:flutter/material.dart';
class Homepage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Home'),),
      body: Center(
        child: Text('Home', style: Theme.of(context).textTheme.headline3,),
      ),
    );
  }

}