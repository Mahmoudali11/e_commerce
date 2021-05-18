 
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Auth extends ChangeNotifier{
  FirebaseAuth _firebaseAuth=FirebaseAuth.instance;
   FirebaseFirestore firebaseFirestore=FirebaseFirestore.instance;
  User user;
// static final internal=Auth.init();
// Auth.init();
// factory Auth(){

//   return internal;

// }
// Auth(){
//   getUser();
// }


 getUser(){
 user= _firebaseAuth.currentUser;

      notifyListeners();
 

  }
 Future<String> logIn(String u,String p)async{
UserCredential authuser;

   try{
  authuser=await  _firebaseAuth.signInWithEmailAndPassword(email: u, password: p);}
catch(e){
print("error");
}


notifyListeners();
return authuser.user.uid;


}
Future<void> sendPasswordResetEmail(String email) async {
     _firebaseAuth.sendPasswordResetEmail(email: email);
    notifyListeners();
  }
Future<String> signUp(String u,String p,String name,String phone)async{
UserCredential authuser;
//use await is useful to sure if statement complet or not
   await _firebaseAuth.createUserWithEmailAndPassword(email: u, password: p).then((value){
  firebaseFirestore.collection("users").add({"uid":value.user.uid,"name":name,"email":u,"phone":phone});


authuser=value;
print(111111111111);
});
print("2222222");
notifyListeners();


return authuser.user.uid;


}
Future<void> signOut()async{

await  _firebaseAuth.signOut();
notifyListeners();
print("sign out process completed");
}



}