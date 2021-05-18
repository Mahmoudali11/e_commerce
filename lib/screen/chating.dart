import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/Theme/style.dart';
import 'package:e_commerce/generated/intl/messages_ar.dart';
import 'package:e_commerce/models/entities/messeages.dart';
import 'package:e_commerce/models/entities/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:provider/provider.dart';
import 'package:e_commerce/models/entities/messeages.dart';

class ChatScreen extends StatelessWidget {
  final reciverid;
  final receivername;
  ChatScreen({this.reciverid, this.receivername});
  TextEditingController m = TextEditingController();
  final left = Alignment.centerLeft;
  final right = Alignment.centerRight;
  final s = Colors.blueAccent;
  final r = Colors.grey.shade300;

  @override
  Widget build(BuildContext context) {
    final messages = Provider.of<Messages>(context, listen: false);
    final curentuser = Provider.of<UserProfiles>(context);

    return Scaffold(
        // resizeToAvoidBottomInset: false,
        appBar: AppBar(),
        body: Stack(
          children: [
            Positioned(
              top: 1,
              left: 0,
              right: 0,
              bottom: 60,
                          child: Container(
                width: double.infinity,
                 child: StreamBuilder<QuerySnapshot>(
                    stream: messages.getMessages(
                        curentuser.userProfile.uid, reciverid),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text(
                          'Something went wrong',
                          style: style2,
                        );
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasData && snapshot.data.docs.length <= 0) {
                        return Text(
                          "no messages",
                          style: styleh,
                        );
                      }
                    

                      if (snapshot.hasData) {
                      
                         final lstms=getMessageList(snapshot,reciverid, curentuser);
                     
                         return ListView(reverse: true, children: lstms);
                      }
                    }),
              ),
            ),

            //    Positioned(bottom: 1,child: Text("dsd",style: style2,))
            // Spacer(),
            Positioned(
              bottom: 10,
              left: 10,
              right: 10,
              child: Container(
                height: 40,
                child: TextField(
                  
                  controller: m,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      hintText: "message",
                      suffixIcon: IconButton(
                        
                           icon: Icon(Icons.send,color: Colors.blue,),
                          onPressed: () async {
                            print("dsd");
                            final date = FieldValue.serverTimestamp();
                      

                            Message mese = Message(
                                content: m.text,
                                senderid: curentuser.userProfile.uid,
                                reciervername: receivername,
                                recieverid: reciverid,
                                sendername: curentuser.userProfile.name,
                                messagedate:date );
                   if(m.text.length>0)
                            await messages.addMessage(mese);
                                                          m.text = '';

                          })),
                ),
              ),
            )
          ],
        ));
  }


List<Widget> getMessageList(AsyncSnapshot<QuerySnapshot>snapshot,String recieverid,UserProfiles curentuser){


    final lst = snapshot.data.docs;

               List<Widget> ms=[];

                    for(var k in lst){
                      print("1");

    var  v;

    print(k["senderid"]);
  
                 if (k.data()["senderid"] == reciverid &&
                                 k.data()["recieverid"] == curentuser.userProfile.uid) {

      print("########");


                      v=  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                        padding: const EdgeInsets.all(10),
                                        margin: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            color: Colors.grey.shade400),
                                        child: Text(
                                          k["content"],
                                          style: style,
                                        )));


                                        ms.add(v);

                                  }



                                
                              else if (k["senderid"] ==
                                      curentuser.userProfile.uid &&
                                  k["recieverid"] == reciverid) {
                              v=  Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                        padding: const EdgeInsets.all(10),
                                        margin: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            color: Colors.blue),
                                        child: Text(
                                          k["content"],
                                          style: style,
                                        )));
                                        ms.add(v);

                                  }



                    }



                    print(ms.toList());



                     
                         final lstms=   ms.reversed.toList();
                     
return lstms;






}

}
