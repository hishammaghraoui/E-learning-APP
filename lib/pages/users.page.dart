import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// ignore: must_be_immutable
class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  String query;

  TextEditingController queryTextEditingController = new TextEditingController();
  void _search(String query) {
    String url="http://192.168.1.38:80/ci/index.php/api/fetch_user";
    print(url);
      http.get(url).then((response){
        print(response.body);
      })
    .catchError((err){
      print(err);
      }
      );
  }
  @override

  Widget build(BuildContext context) {
    // TODO: implement build
    print("Building page ..... ");
    return Scaffold(
      appBar: AppBar(title: Text('Users => ${query}'),),
      body: Center(
        child: Column(
            children : [
             Row(
               children: [
                 Expanded(child:
                 Container(
                   padding: EdgeInsets.all(10),
                   child :TextFormField(
                     onChanged: (value){
                       setState(() {
                         this.query = value;
                       });
                     },
                     controller: queryTextEditingController,
                     decoration: InputDecoration(
                         //suffixIcon: Icon(Icons.search_outlined),
                         contentPadding: EdgeInsets.only(left: 25),
                         border: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(30),
                             borderSide: BorderSide(
                                 width: 1,color: Colors.deepOrange

                             )
                         )
                     ),
                   ),
                 )
                 ),
                 IconButton(icon: Icon(Icons.search_outlined , color: Colors.deepOrange,),
                     onPressed: (){
                   setState(() {
                     this.query=queryTextEditingController.text ;
                     _search(query);
                   });


                     }
                 )
               ],
             )

        ]
        ),

      ),
    );
  }


}