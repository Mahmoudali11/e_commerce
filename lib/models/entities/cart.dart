import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/models/auth_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class MyCart{
   String name;
  String desc;
  String  price;
  String img;
  String size;
  String orderdate;
  String id;

  MyCart({this.price,this.desc,this.size,this.name,this.img,this.orderdate});


  MyCart.fromJson(DocumentSnapshot json){
  id=json["productid"];
name=json["name"];
desc=json["desc"];
size=json["size"];
price=json["prices"];
img=json["img"];
orderdate=json["date"];






  }

}

class MyCarts extends ChangeNotifier{
 FirebaseFirestore firebaseFirestore=FirebaseFirestore.instance;

List<MyCart> carts=[];
//  MyCarts(String v){

 

// }

Future getCarts(User usr)async{
   var a= await firebaseFirestore.collection("orders").where("uid",isEqualTo: usr.uid).get();
   var b=a.docs;


carts=b.map((e) => MyCart.fromJson(e)).toList();


print("cartlen"+carts.length.toString());
notifyListeners();





}






}


