
import 'package:flutter/material.dart';
import 'package:flutter_app2/pdf/mobile.dart';
import 'package:open_file/open_file.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:video_player/video_player.dart';

import 'chewie_item.dart';



class test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _test();
  }
}

class _test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Video Player'),
      // ),
      body: ListView(
        children: <Widget>[
          Row(
            children: <Widget>[
              IconButton(icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 22.0,
              ),
                  onPressed:(){

                  }),
              Spacer(),
              Text('C++',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0
                ),

              ),
              Spacer(),
              IconButton(
                  icon: Icon(
                    Icons.filter_list,
                    color: Colors.black,
                    size: 22.0,
                  ),
                  onPressed: (){

                  })

            ],
          ),
          Container(height : 10,),
          Container( width: 200,
          height: 200,
          child :ChewieListItem(
            videoPlayerController: VideoPlayerController.asset(
              'images/test.mp4',
            ),
            //looping: true,
          ),
    ),
Spacer(),
    Expanded(
      child: Column(
        children: [
             Container(
    padding: EdgeInsets.all(10),
    child: Text('Description : ',
                 style : TextStyle(
                  fontWeight: FontWeight.bold,
                 fontFamily:  "Ubuntu",
                   fontSize: 30
               ),
                   )
    ),
          Container(
            margin: EdgeInsets.all(5.0),
            padding: EdgeInsets.all(5.0),
            alignment: Alignment.topCenter,
            width:  MediaQuery.of(context).size.width-20,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(12) ,
            ),
       child:  Text(
            "C++ is a powerful general-purpose programming language. It can be used to develop operating systems, browsers, games, and so on. C++ supports different ways of programming like procedural, object-oriented, functional, and so on. This makes C++ powerful as well as flexible."
            ,style: TextStyle(

          ),

          ),
    )

        ]
                   )
    ),

           Container(height: 10,),
          Spacer(),
          Expanded(
              child: Column(
                  children: [
                    Container(
                        padding: EdgeInsets.all(10),
                        child: Text('Documentation  : ',
                          style : TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily:  "Ubuntu",
                              fontSize: 30
                          ),
                        )
                    ),
                    Container(
                      margin: EdgeInsets.all(5.0),
                      padding: EdgeInsets.all(5.0),
                      alignment: Alignment.topCenter,
                      width:  MediaQuery.of(context).size.width-20,
                      height: 75,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(12) ,
                      ),
                      child:  Center(
                        child: ElevatedButton(
                          child: Text('Open PDF'),
                          onPressed: (){
                            _createPDF("Its just a test to see its  work ");
                          },
                        ),
                      ),
                      // Text("test"
                      //  // "C++ is a powerful general-purpose programming language. It can be used to develop operating systems, browsers, games, and so on. C++ supports different ways of programming like procedural, object-oriented, functional, and so on. This makes C++ powerful as well as flexible."
                      //   ,style: TextStyle(
                      //
                      // ),
                      //
                      // ),
                    )

                  ]
              )
          ),
        ],
      ),
    );

  }
  Future<void> _createPDF(String text) async
  {
    PdfDocument document = PdfDocument();
    final page = document.pages.add();

    page.graphics.drawString(text,
        PdfStandardFont(PdfFontFamily.helvetica, 30));


    PdfGrid grid = PdfGrid();

    List<int> bytes = document.save();
    document.dispose();

    saveAndLaunchFile(bytes, 'Output.pdf');
  }
  // Future<void> _createPDF() async {
  //   PdfDocument document = PdfDocument();
  //   final page = document.pages.add();
  //
  //   page.graphics.drawString('Welcome to PDF Succinctly!',
  //       PdfStandardFont(PdfFontFamily.helvetica, 30));
  //
  //
  //
  //   PdfGrid grid = PdfGrid();
  //   grid.style = PdfGridStyle(
  //       font: PdfStandardFont(PdfFontFamily.helvetica, 30),
  //       cellPadding: PdfPaddings(left: 5, right: 2, top: 2, bottom: 2));
  //   page.graphics.drawString('List of Student !',
  //       PdfStandardFont(PdfFontFamily.helvetica,60));
  //   grid.columns.add(count: 3);
  //   grid.headers.add(1);
  //
  //   PdfGridRow header = grid.headers[0];
  //   header.cells[0].value = 'Roll No';
  //   header.cells[1].value = 'Name';
  //   header.cells[2].value = 'Class';
  //
  //   PdfGridRow row = grid.rows.add();
  //   row.cells[0].value = '1';
  //   row.cells[1].value = 'Ayoub khedrani';
  //   row.cells[2].value = '6';
  //
  //   row = grid.rows.add();
  //   row.cells[0].value = '2';
  //   row.cells[1].value = 'Hicham maghraoui';
  //   row.cells[2].value = '9';
  //
  //   row = grid.rows.add();
  //   row.cells[0].value = '3';
  //   row.cells[1].value = 'Youssra zarouit';
  //   row.cells[2].value = '8';
  //
  //   grid.draw(
  //       page: document.pages.add(), bounds: const Rect.fromLTWH(0, 0, 0, 0));
  //
  //   List<int> bytes = document.save();
  //   document.dispose();
  //
  //   saveAndLaunchFile1(bytes, 'Output.pdf');
  // }
}