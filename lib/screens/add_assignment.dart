import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app2/models/user.dart';
import 'package:path/path.dart' as path;
import 'dart:async';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:permission_handler/permission_handler.dart';


class assign extends StatefulWidget {
  final User tst;
  assign(this.tst);


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _assign(tst);
  }
}

class _assign extends State<assign> {
  User usr;
  _assign(this.usr);
  String name1;
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }
  File _pickedImage=null;
  String pickpath='';
  void initState() {
    super.initState();

  }
  String name="";

  File _file;
  final GlobalKey<ScaffoldState> _scaffoldstate = new GlobalKey<ScaffoldState>();

  Future getFile()async{
    //File file = await FilePicker.getFile(type: FileType.any);

    setState(() {
      //_file = file;
    });
  }

  void _showPickOptionsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: Text("Pick from Gallery"),
              onTap: () {
                _loadPicker(ImageSource.gallery);
              },
            ),
            ListTile(
              title: Text("Take a pictuer"),
              onTap: () {
                _loadPicker(ImageSource.camera);
              },
            )
          ],
        ),
      ),
    );
  }
  _loadPicker(ImageSource source) async {
    // ignore: deprecated_member_use
    //  _pickedImage = await ImagePicker.pickImage(source: source);
    /*  if (picked != null) {
      _cropImage(picked);
    }*/
    // ignore: deprecated_member_use
    final imageFile = await ImagePicker.pickImage(source: source,
      // maxWidth: 192, maxHeight: 192
    );
    if (imageFile == null) {
      return;
    }
    setState(() {
      _pickedImage = imageFile;
    });
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFile.path);
    final savedImage = await imageFile.copy('${appDir.path}/$fileName');
    pickpath = savedImage.path;



    //  Navigator.pop(context);

  }
  Future<List<String>> pickFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: true);

    return result == null ? <String>[] : result.paths;
  }
  void _uploadFile(filePath) async {
    String fileName = basename(filePath.path);
    print("file base name:$fileName");
    name=fileName;
    try {
      FormData formData = new FormData.fromMap({
        "name": "rajika",
        "age": 22,
        "file": await MultipartFile.fromFile(filePath.path, filename: fileName),
      });

      Response response = await Dio().post("http://192.168.1.38/ci/uploads.php",data: formData);
      print("File upload response: $response");
      _showSnackBarMsg(response.data['message']);
    } catch (e) {
      print("expectation Caugch: $e");
    }



  }
  void _showSnackBarMsg(String msg){
    _scaffoldstate.currentState
        .showSnackBar( new SnackBar(content: new Text(msg),));
  }

  bool _status = true;
  final FocusNode myFocusNode = FocusNode();
  int _value1 = 1;
  int _value = 1 ;

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      key: _scaffoldstate,
      body: new Container(
        color: Colors.white,
        child: new ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                new Container(
                  height: 70.0,
                  color: Colors.white,
                  child: new Column(
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(left: 20.0, top: 20.0),
                          child: new Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new IconButton(
                                icon: Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.black,
                                  size: 22.0,
                                ),
                                onPressed: () {
                                  Navigator.pop(context, false);
                                },
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 25.0),
                                child: new Text('Add Assignment',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25.0,
                                        fontFamily: 'Ubuntu',
                                        color: Colors.black)),
                              )
                            ],
                          )),
                    ],
                  ),
                ),
                new Container(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 25.0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child: new Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                new Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    new Text(
                                      'Title ',
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontFamily: "Ubuntu",
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                        Container(
                          height: 7,
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 2.0),
                            child: new Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                new Flexible(
                                  child: new TextField(
                                    //enableInteractiveSelection: false, // will disable paste operation
                                    //focusNode: new AlwaysDisabledFocusNode(),
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide:
                                        BorderSide(color: Colors.blue),
                                      ),
                                      hintText: "Write details about this assignemets ",
                                      hintStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                      // hintStyle:font: FontWeight.bold,
                                    ),

                                    // autofocus: !_status,
                                    // controller: TextEditingController(text: usr.name),
                                  ),
                                ),
                              ],
                            )),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child: new Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                new Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    new Text(
                                      'Description',
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontFamily: "Ubuntu",
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                        // Padding(
                        //     padding: EdgeInsets.only(
                        //         left: 25.0, right: 25.0, top: 2.0),
                        //     child: new Row(
                        //       mainAxisSize: MainAxisSize.max,
                        //       children: <Widget>[
                        //         new Flexible(
                        //           child: new TextField(
                        //             enableInteractiveSelection:
                        //             false, // will disable paste operation
                        //             focusNode: new AlwaysDisabledFocusNode(),
                        //             decoration: const InputDecoration(
                        //
                        //
                        //               hintStyle: TextStyle(
                        //                 fontWeight: FontWeight.bold,
                        //               ),
                        //             ),
                        //
                        //             controller: TextEditingController(
                        //                 text:
                        //                 '$name'),
                        //           ),
                        //         ),
                        //       ],
                        //     )),
                        Container(
                          height: 7,
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 2.0),
                            child: new Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                new Flexible(
                                  child: TextField(
                                    maxLines: 10,
                                    //  enableInteractiveSelection: false, // will disable paste operation
                                    //   focusNode: new AlwaysDisabledFocusNode(),
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide:
                                        BorderSide(color: Colors.blue),
                                      ),
                                      hintText: "Write a discription for this Course ",
                                      hintStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        Container(height: 7,),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child: new Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    child: new Text(
                                      'Filiere : ',
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontFamily: "Ubuntu",
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  flex: 2,
                                ),
                                Expanded(
                                  child: Container(
                                    child: new Text(
                                      'Semester : ',
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontFamily: "Ubuntu",
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  flex: 2,
                                ),
                              ],
                            )),
                        Container(height: 7,),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 2.0),
                            child: new Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Flexible(
                                    child: Container(
                                      padding: const EdgeInsets.only(left: 10.0),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10.0),
                                          color: Colors.grey.shade100,
                                          border: Border.all()),
                                      child: DropdownButtonHideUnderline(

                                        child: DropdownButton(
                                            value: _value1,
                                            items: [
                                              DropdownMenuItem(
                                                child: Text("ASR",style: TextStyle(fontWeight: FontWeight.bold),),
                                                value: 1,
                                              ),
                                              DropdownMenuItem(
                                                child: Text("GE",style: TextStyle(fontWeight: FontWeight.bold),),
                                                value: 2,
                                              ),
                                              DropdownMenuItem(
                                                  child: Text("Social",style: TextStyle(fontWeight: FontWeight.bold),), value: 3),
                                              DropdownMenuItem(
                                                  child: Text("BA/BV",style: TextStyle(fontWeight: FontWeight.bold),), value: 4)
                                            ],
                                            onChanged: (value) {
                                              setState(() {
                                                _value1 = value;
                                              });
                                            }),
                                      ),
                                    )
                                ),

                                Spacer(),

                                Flexible(
                                    child: Container(
                                      padding: const EdgeInsets.only(left: 10.0),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10.0),
                                          color: Colors.grey.shade100,
                                          border: Border.all()),
                                      child: DropdownButtonHideUnderline(

                                        child: DropdownButton(
                                          // dropdownColor: Colors.grey,
                                            value: _value,
                                            items: [
                                              DropdownMenuItem(
                                                child: Text("S1",style: TextStyle(fontWeight: FontWeight.bold),),
                                                value: 1,
                                              ),
                                              DropdownMenuItem(
                                                child: Text("S2",style: TextStyle(fontWeight: FontWeight.bold),),
                                                value: 2,
                                              ),
                                              DropdownMenuItem(
                                                  child: Text("S3",style: TextStyle(fontWeight: FontWeight.bold),), value: 3),
                                              DropdownMenuItem(
                                                  child: Text("S4",style: TextStyle(fontWeight: FontWeight.bold),), value: 4)
                                            ],
                                            onChanged: (value) {
                                              setState(() {
                                                _value = value;
                                              });
                                            }),

                                      ),
                                    )
                                )
                              ],
                            )),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child: new Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                new Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    new Text(
                                      'Deadline Date',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 2.0),
                            child: new Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                new Flexible(
                                  child: new Text( "${selectedDate.toLocal()}".split(' ')[0],
                                    // enableInteractiveSelection:
                                    // false, // will disable paste operation
                                    // focusNode: new AlwaysDisabledFocusNode(),
                                    // decoration: const InputDecoration(


                                    style : TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    // ),


                                ),
                                ),
                              ],
                            )),
                        Row( mainAxisAlignment: MainAxisAlignment.center,

                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[

                              Container(
                                  margin: EdgeInsets.only(left: 10 , right:10 ,),

                                  child: new RaisedButton(
                                    child: new Text("Select deadline date"),
                                    textColor: Colors.white,
                                    color: Colors.pink,
                                    onPressed: ()  => _selectDate(context),

                                      // getFile();
                                      //_showPickOptionsDialog(context);
                                     // final filePaths = await pickFile();

                                      // FocusScope.of(context).requestFocus(new FocusNode());

                                    shape: new RoundedRectangleBorder(
                                        borderRadius: new BorderRadius.circular(20.0)),
                                  )),
                              // RaisedButton(
                              //     child: Text("select a file"),
                              //
                              //     onPressed:() {
                              //       getFile();
                              //
                              //     }
                              //
                              //     ),
                            ]
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child: new Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                new Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    new Text(
                                      'support documments',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 2.0),
                            child: new Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                new Flexible(
                                  child: new TextField(
                                    enableInteractiveSelection:
                                    false, // will disable paste operation
                                    focusNode: new AlwaysDisabledFocusNode(),
                                    decoration: const InputDecoration(


                                      hintStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    controller: TextEditingController(
                                        text:
                                        '$name'),
                                  ),
                                ),
                              ],
                            )),


                        // RaisedButton(
                        //     child: Text("upload"),
                        //     onPressed: (){
                        //
                        //
                        //     }),
                        Row( mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Container(
                                  child: new RaisedButton(
                                    child: new Text("Uploed"),
                                    textColor: Colors.white,
                                    color: Colors.orange,
                                    onPressed: () {
                                      setState(() {
                                        _uploadFile(_file);
                                        // FocusScope.of(context).requestFocus(new FocusNode());
                                      });
                                    },
                                    shape: new RoundedRectangleBorder(
                                        borderRadius: new BorderRadius.circular(20.0)),
                                  )),

                              Container(
                                  margin: EdgeInsets.only(left: 10 , right:10 ,),

                                  child: new RaisedButton(
                                    child: new Text("Select a File"),
                                    textColor: Colors.white,
                                    color: Colors.blue,
                                    onPressed: ()  async {

                                      // getFile();
                                      //_showPickOptionsDialog(context);
                                      final filePaths = await pickFile();

                                      // FocusScope.of(context).requestFocus(new FocusNode());

                                    },
                                    shape: new RoundedRectangleBorder(
                                        borderRadius: new BorderRadius.circular(20.0)),
                                  )),
                              // RaisedButton(
                              //     child: Text("select a file"),
                              //
                              //     onPressed:() {
                              //       getFile();
                              //
                              //     }
                              //
                              //     ),
                            ]
                        ),
                        _getActionButtons() ,

                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),

      ),
      //   floatingActionButton: FloatingActionButton(
      //   onPressed: getFile,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
  }

  Widget _getActionButtons() {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 45.0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Container(
                  child: new RaisedButton(
                    child: new Text("Save"),
                    textColor: Colors.white,
                    color: Colors.green,
                    onPressed: () {
                      setState(() {
                        _status = true;
                        // FocusScope.of(context).requestFocus(new FocusNode());
                      });
                    },
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0)),
                  )),
            ),
            flex: 2,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Container(
                  child: new RaisedButton(
                    child: new Text("Cancel"),
                    textColor: Colors.white,
                    color: Colors.red,
                    onPressed: () {
                      setState(() {
                        _status = true;
                        // FocusScope.of(context).requestFocus(new FocusNode());
                      });
                    },
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0)),
                  )),
            ),
            flex: 2,
          ),
        ],
      ),

    );
  }

  Widget _getEditIcon() {
    return new GestureDetector(
      child: new CircleAvatar(
        backgroundColor: Color(0xffF7941E),
        radius: 14.0,
        child: new Icon(
          Icons.edit,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
        setState(() {
          _status = false;
        });
      },
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
