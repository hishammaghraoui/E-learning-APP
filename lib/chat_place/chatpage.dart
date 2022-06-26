import 'package:flutter/material.dart';
import 'package:flutter_app2/models/user.dart';
// import 'chatusers.dart';
import 'chatusers.dart';
import 'conversationList.dart';

class ChatPage extends StatefulWidget {
  User u;
  ChatPage(this.u);
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatUsers> chatUsers = [
    ChatUsers( "MR.Ouhda mohammed ",  "Salam Hicham, hamdoulah",  "images/default.jpg",  "Now"),
    ChatUsers("Zarouit Yousra","That's Great", "images/default.jpg",  "Yesterday"),
    ChatUsers( "Hicham maghraoui",  "hey !! ", "images/default.jpg",  "31 Mar"),
    ChatUsers( "Ayoub Khadrani",  "merci Cordialement",  "images/default.jpg",  "28 Mar"),
    ChatUsers( "Aabidi MyHafid", "Thankyou, It's awesome", "images/default.jpg",  "23 Mar"),
    ChatUsers( "Reda Bouissali",  "will update you in evening", "images/default.jpg", "17 Mar"),
    ChatUsers( "Mouad moustahcine",  "Can you please share the file?", "images/default.jpg", "24 Feb"),
    ChatUsers( "Alaoui Belghiti Hanaa", "How are you?",  "images/default.jpg", "18 Feb"),
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 16,right: 16,top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Conversations",style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),
                    Container(
                      padding: EdgeInsets.only(left: 8,right: 8,top: 2,bottom: 2),
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.pink[50],
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.add,color: Colors.pink,size: 20,),
                          SizedBox(width: 2,),
                          Text("Add New",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16,left: 16,right: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  prefixIcon: Icon(Icons.search,color: Colors.grey.shade600, size: 20,),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                          color: Colors.grey.shade100
                      )
                  ),
                ),
              ),
            ),
            ListView.builder(
              itemCount: chatUsers.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 16),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index){
                return ConversationList(
                  name: chatUsers[index].name,
                  messageText: chatUsers[index].messageText,
                  imageUrl: chatUsers[index].imageURL,
                  time: chatUsers[index].time,
                  isMessageRead: (index == 0 || index == 3)?true:false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

}

