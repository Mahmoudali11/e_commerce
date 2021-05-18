import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/models/entities/orders.dart';
import 'package:flutter/foundation.dart';

class UserProfile {


  String name;
  String phone;
  String email;
  String uid;
  UserProfile.formJson(DocumentSnapshot json){


name=json["name"];
phone=json["phone"];
email=json["email"];
uid=json["uid"];

  }
  




}
class UserProfiles extends ChangeNotifier{



  UserProfile userProfile;
  List<UserProfile> users;

  FirebaseFirestore firebaseFirestore=FirebaseFirestore.instance;
  Future getUserProfile(String  currentusrid)async{
   final a=   await firebaseFirestore.collection("users").where("uid",isEqualTo:currentusrid).get();
   final b=a.docs;
   final c=b.map((e) => UserProfile.formJson(e)).toList();
   userProfile=c[0];
   notifyListeners();

  }
 Future<List<UserProfile>> getUsersProfile()async{

   
   final a=   await firebaseFirestore.collection("users").get();
   final b=a.docs;
   final c=b.map((e) => UserProfile.formJson(e)).toList();
   users=c;
   
   notifyListeners();
   print("getusers");
   return users;

  }


}