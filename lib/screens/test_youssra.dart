// // hado l import
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:path/path.dart' as path;
// import 'package:path_provider/path_provider.dart' as syspaths;
//
//
// // hado radi declarerhom
//
// File _pickedImage=null;
// String pickpath='';
//
//
//
// // hadi lblasa mataln li atbalk fiha l'image m3a button bach i selection
//
// Center(
// child: CircleAvatar(
// radius: 80,
// // child: _pickedImage == null ? Image.asset('assets/profile.png') : null,
// backgroundImage:
// _pickedImage != null ? FileImage(_pickedImage) : pickpath=='assets/profile.png' ?AssetImage ('assets/profile.png'): FileImage( File(pickpath)),
// ),
// ),
// const SizedBox(height: 10.0),
// Center(
// child: RaisedButton(
// child: Text("Pick Image"),
// onPressed: () {
// _showPickOptionsDialog(context);
// },
// ),),
//
//
//
//
// // hadi mli kaywta 3la select kaybalo had dialog
//
//
// void _showPickOptionsDialog(BuildContext context) {
//   showDialog(
//     context: context,
//     builder: (context) => AlertDialog(
//       content: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           ListTile(
//             title: Text("Pick from Gallery"),
//             onTap: () {
//               _loadPicker(ImageSource.gallery);
//             },
//           ),
//           ListTile(
//             title: Text("Take a pictuer"),
//             onTap: () {
//               _loadPicker(ImageSource.camera);
//             },
//           )
//         ],
//       ),
//     ),
//   );
// }
//
//
//
// // o hadi fnc dyal load
//
//
// _loadPicker(ImageSource source) async {
//   // ignore: deprecated_member_use
//   //  _pickedImage = await ImagePicker.pickImage(source: source);
//   /*  if (picked != null) {
//       _cropImage(picked);
//     }*/
//   // ignore: deprecated_member_use
//   final imageFile = await ImagePicker.pickImage(source: source,
//     // maxWidth: 192, maxHeight: 192
//   );
//   if (imageFile == null) {
//     return;
//   }
//   setState(() {
//     _pickedImage = imageFile;
//   });
//   final appDir = await syspaths.getApplicationDocumentsDirectory();
//   final fileName = path.basename(imageFile.path);
//   final savedImage = await imageFile.copy('${appDir.path}/$fileName');
//   pickpath = savedImage.path;
//
//
//
//   //  Navigator.pop(context);
//
// }