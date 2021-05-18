import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Order{
  String oid;
String uid;
String pid;
String imgurl;
String who;
String address;
String date;
String price;
String phone;
String size;
String desc;
String name;

Order({this.size,this.imgurl,this.price,this.address,this.date,this.phone,this.pid,this.uid,this.who,this.desc,this.name});

Order.fromJson(DocumentSnapshot json){
  oid=json.id;
  uid=json["uid"];
  pid=json["productid"];
  who=json["who"];
  address=json["address"];
  phone=json["phone"];
  size=json["size"];
  price=json["price"];
  date=json["date"];
  imgurl=json["img"];
  desc=json["desc"];
  name=json["name"];
 

}


Map<String,dynamic>toJson(){
return{"uid":uid,"productid":pid,"size":size,"name":name,"phone":phone,"date":date,"img":imgurl,"address":address,"price":price,"who":who,"desc":desc};




}






}

class Orders extends ChangeNotifier{


  List<Order> orders=[];
  FirebaseFirestore firebaseFirestore =FirebaseFirestore.instance;
  Future addOrder(Order order)async{
    try{

   await firebaseFirestore.collection("orders").add(order.toJson());


   notifyListeners();
    }
    catch(e){
      print(e.toString());

    }

    




  }
  Future<List<Order>> getOrders()async{

    final fs=await  firebaseFirestore.collection("orders").get();
    final doc=fs.docs;
    orders=doc.map((e) => Order.fromJson(e)).toList();
   //notifyListeners();
    return orders;






  }
  Future deleteOrder(String id)async{


    await firebaseFirestore.collection("orders").doc(id).delete();
    notifyListeners();
  }






}