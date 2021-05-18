import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/generated/intl/messages_ar.dart';
import 'package:flutter/material.dart';
class Message{
String id;
String senderid;
String sendername;
String recieverid;
String  reciervername;
FieldValue messagedate;
String content;
Message({this.content,this.messagedate,this.reciervername,this.senderid,this.sendername,this.recieverid});

Message.fromJson(DocumentSnapshot json){

this.id=json.id;
this.content=json["content"];
this.messagedate=json["messagedate"];
this.reciervername=json["reciervername"];
this.senderid=json["senderid"];
this.recieverid=json["recieverid"];
this.sendername=json["sendername"];


}
Map<String,dynamic> toJson(){



return {



  "content":this.content,"recieverid":this.recieverid,"messagedate":this.messagedate,"senderid":this.senderid,"sendername":this.sendername,
  "recievername":this.reciervername
};



}



}
class Messages extends ChangeNotifier{
List message;

Future addMessage(Message m)async{

     FirebaseFirestore firebaseFirestore=FirebaseFirestore.instance;
    await firebaseFirestore.collection("messages").add(m.toJson());
    notifyListeners();



}


 Stream<QuerySnapshot> getMessages(String senderid,String recieverid){
  
     FirebaseFirestore firebaseFirestore=FirebaseFirestore.instance;



 

  var v= firebaseFirestore.collection("messages").orderBy("messagedate").snapshots();
 

     return v;




}




}