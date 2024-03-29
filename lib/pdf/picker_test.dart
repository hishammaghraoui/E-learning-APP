import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';



class picker extends StatefulWidget {
  @override
  _picker createState() => new _picker();
}

class _picker extends State<picker> {
  String _fileName = '...';
  String _path = '...';
  String _extension;
  bool _hasValidMime = false;
  FileType _pickingType;
  TextEditingController _controller = new TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => _extension = _controller.text);
  }

  void _openFileExplorer() async {
    if (_pickingType != FileType.custom || _hasValidMime) {
      try {
          _path =  (await FilePicker.platform.pickFiles(allowMultiple: true)).paths as String;
      } on PlatformException catch (e) {
        print("Unsupported operation" + e.toString());
      }

      if (!mounted) return;

      setState(() {
        _fileName = _path != null ? _path.split('/').last : '...';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('Plugin example app'),
        ),
        body: SingleChildScrollView(
          child: new Center(
              child: new Padding(
                padding: const EdgeInsets.only(top: 50.0, left: 10.0, right: 10.0),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: new DropdownButton(
                          hint: new Text('LOAD PATH FROM'),
                          value: _pickingType,
                          items: <DropdownMenuItem>[
                            new DropdownMenuItem(
                              child: new Text('FROM AUDIO'),
                              value: FileType.audio,
                            ),
                            new DropdownMenuItem(
                              child: new Text('FROM GALLERY'),
                              value: FileType.image,
                            ),
                            new DropdownMenuItem(
                              child: new Text('FROM VIDEO'),
                              value: FileType.video,
                            ),
                            new DropdownMenuItem(
                              child: new Text('FROM ANY'),
                              value: FileType.any,
                            ),
                            new DropdownMenuItem(
                              child: new Text('CUSTOM FORMAT'),
                              value: FileType.custom,
                            ),
                          ],
                          onChanged: (value) => setState(() => _pickingType = value)),
                    ),
                    new ConstrainedBox(
                      constraints: new BoxConstraints(maxWidth: 150.0),
                      child: _pickingType == FileType.custom
                          ? new TextFormField(
                        maxLength: 20,
                        autovalidate: true,
                        controller: _controller,
                        decoration: InputDecoration(labelText: 'File type'),
                        keyboardType: TextInputType.text,
                        textCapitalization: TextCapitalization.none,
                        validator: (value) {
                          RegExp reg = new RegExp(r'[^a-zA-Z0-9]');
                          if (reg.hasMatch(value)) {
                            _hasValidMime = false;
                            return 'Invalid format';
                          }
                          _hasValidMime = true;
                        },
                      )
                          : new Container(),
                    ),
                    new Padding(
                      padding: const EdgeInsets.only(top: 50.0, bottom: 20.0),
                      child: new RaisedButton(
                        onPressed: () => _openFileExplorer(),
                        child: new Text("Open file picker"),
                      ),
                    ),
                    new Text(
                      'URI PATH ',
                      textAlign: TextAlign.center,
                      style: new TextStyle(fontWeight: FontWeight.bold),
                    ),
                    new Text(
                      _path ?? '...',
                      textAlign: TextAlign.center,
                      softWrap: true,
                      textScaleFactor: 0.85,
                    ),
                    new Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: new Text(
                        'FILE NAME ',
                        textAlign: TextAlign.center,
                        style: new TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    new Text(
                      _fileName,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}