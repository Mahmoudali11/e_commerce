

 import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class Product{
  String id;
  String name;
  String price;
  String imgurl;
  String desc;
  List size;
  Product({this.imgurl,this.desc,this.name,this.price,this.size});
  Product.fromJson(DocumentSnapshot json){
    id=json.id;
    name=json["name"];
    price=json["price"];
    imgurl=json["img"];
    desc=json["desc"];
    size=json["size"];

  }
  Map<String,dynamic> toJson(){
return {"name":name,"price":price,"img":imgurl,"desc":desc,"size":size};


  }



}
class Products extends ChangeNotifier{
  String imgname;
 File img;

  List<Product> plst=[];
Products(){
  print("ds");
  //getProducts();
}

  FirebaseFirestore firebaseFirestore=FirebaseFirestore.instance;


  Future deleteProduct(String id)async{
await firebaseFirestore.collection("products").doc(id).delete();
notifyListeners();

print("deleted");
  }
  Future getProducts()async{

   var query=  await firebaseFirestore.collection("products").get();

   var  qlist=query.docs;


       plst=qlist.map((e) {
         
         print(e.toString());
         return Product.fromJson(e); }).toList();


       notifyListeners();

  }

  Future chooseImage(ImageSource imgsrc)async{
     PickedFile file;


    try{


      file=await  ImagePicker().getImage(source: imgsrc);


      if(file.path!=null){


        img=File(file.path);
      }
      else{
        print("no file selected");
        
      }

    }
    catch(e){
      print("error open gallary or camera");
      return;
    }

   imgname=file.path.split("/").last;
   notifyListeners();


  }


  Future addProduct(Product p)async{


    FirebaseStorage firebaseStorage=FirebaseStorage.instance;
   
   Reference ref= firebaseStorage.ref().child(imgname);

   UploadTask uploadTask=     ref.putFile(img);

   await uploadTask.whenComplete(()async{
print("task comp");

     String url=await uploadTask.snapshot.ref.getDownloadURL();




   //  Product p=Product(name: "aaa",desc:"dsadad",imgurl: url,size: [3,5,6],price: "232");
   p.imgurl=url;
   await  firebaseFirestore.collection("products").add(p.toJson());
   notifyListeners();

 });
  }









  






}