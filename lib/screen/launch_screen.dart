import 'package:e_commerce/Theme/style.dart';
import 'package:e_commerce/screen/appNavigation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:e_commerce/screen/home.dart';
import 'package:e_commerce/screen/login.dart';
import 'package:provider/provider.dart';
import 'package:e_commerce/models/auth_provider.dart';

 class LaunchScreen extends StatefulWidget {
   
  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
 
 
final x=Provider.of<Auth>(context,listen: false);
 var route;
   Future.delayed(Duration(seconds:2),()async{
    x.getUser();
   User user =FirebaseAuth.instance.currentUser;
              
             if(x.user!=null&&user.emailVerified)
    route =MaterialPageRoute(builder: (context){
      print(x);
           return AppNaigation();
         });
         else{
           route =MaterialPageRoute(builder: (context){
                   print(x.toString());

           return Login();
         });
         }

   });

 

  Future.delayed(Duration(seconds:2),(){
                     Navigator.pushReplacement(context, route);


   }) ;


      
    super.initState();
  }
   
  @override
   Widget build(BuildContext context) {
 

     

       return Scaffold(
              body: Center(
                child: Container(
         child: Text("Welcome",)

        
         
     ),
              ),
      );
   }
}

