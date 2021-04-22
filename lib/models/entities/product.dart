

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Product{
  String id;
  String name;
  String price;
  String imgurl;
  String desc;
  List size;
  Product({this.imgurl,this.desc,this.name,this.price});
  Product.fromJson(DocumentSnapshot json){
    id=json.id;
    name=json["name"];
    price=json["price"];
    imgurl=json["img"];
    desc=json["desc"];
    size=json["size"];

  }
  Map toJson(){
return {"name":name,"price":price,"imgurl":imgurl,"desc":desc,"id":id,"size":size};


  }



}
class Products extends ChangeNotifier{
  List<Product> plst=[];
Products(){
  print("ds");
  //getProducts();
}

  FirebaseFirestore firebaseFirestore=FirebaseFirestore.instance;
  Future getProducts()async{

   var query=  await firebaseFirestore.collection("products").get();

   var  qlist=query.docs;


       plst=qlist.map((e) {
         
         print(e.toString());
         return Product.fromJson(e); }).toList();


       notifyListeners();

  }






}