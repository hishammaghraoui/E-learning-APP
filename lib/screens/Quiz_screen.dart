import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class quiz_page extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Quiz();
  }
}

class Quiz extends State<quiz_page> {
  @override
  int currentQuestion = 0;
  int Score = 0;
  final quiz = [
    {
      'title': 'Question 1',
      'answers': [
        {'answer': 'Answer 11', 'correct': false},
        {'answer': 'Answer 12', 'correct': false},
        {'answer': 'Answer 13', 'correct': true},
      ]
    },
    {
      'title': 'Question 2',
      'answers': [
        {'answer': 'Answer 21', 'correct': true},
        {'answer': 'Answer 22', 'correct': false},
        {'answer': 'Answer 23', 'correct': false},
      ]
    }
  ];
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Quiz',
        ),
      ),
      body:
      (this.currentQuestion>=quiz.length)?
      Center(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children : <Widget>[
            Text("SCORE : ${(100*Score/quiz.length).round()} %",style: TextStyle(fontSize: 20,color: Colors.blue ,fontWeight: FontWeight.w300),),
                RaisedButton(
                    onPressed: (){
                      setState(() {
                        this.currentQuestion=0;
                        this.Score=0;
                      });
                    },
                    color: Colors.red,
                    child : Text("Again ? ",style: TextStyle(fontSize: 20 , ),)
                )
        ]
          )
      )
    :  ListView(
        children: <Widget>[
          ListTile(
            title: Center(
              child: Text(
                "Question ${currentQuestion + 1}/${quiz.length}",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          ListTile(
            title: Text(
              quiz[currentQuestion]['title'],
              style: TextStyle(fontSize: 22),
            ),
          ),
          // ignore: missing_return
          ...(quiz[currentQuestion]['answers'] as List<Map<String, Object>>)
              .map((answer) {
            return ListTile(
              title: RaisedButton(
                onPressed: () {
                  setState(() {
                    if(answer['correct']==true){
                      ++Score;
                    }


                    ++currentQuestion;

                  });
                },
                child: Text(answer['answer'],style: TextStyle(fontSize: 18),),
              ),
            );
          })
        ],
      ),
    );
  }
}
