 
import 'package:e_commerce/models/entities/cart.dart';
import 'package:e_commerce/models/entities/orders.dart';
import 'package:e_commerce/models/entities/product.dart';
import 'package:e_commerce/models/entities/user.dart';
import 'package:e_commerce/screen/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screen/launch_screen.dart';
import 'package:provider/provider.dart';
import 'models/auth_provider.dart';
import 'models/entities/cart.dart';
import 'package:e_commerce/models/entities/orders.dart';
void main()async {


WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();

    

  runApp(
    MyApp());
}

class MyApp extends StatelessWidget {
 
 

  // This widget is the root of your application.
  // 
  // 
   
  @override
  Widget build(BuildContext context) {


 
     return MultiProvider(
       providers: [ChangeNotifierProvider(create: (context){
      return Auth();
    },)
    ,
    
    ChangeNotifierProvider(create: (context)=>Products(),),
        ChangeNotifierProvider(create: (context)=>MyCarts(),),
        
         ChangeNotifierProvider(create: (context)=>Orders()),
         ChangeNotifierProvider(create: (context)=>UserProfiles())

    
    
    
    ],
            child: MaterialApp(
          debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
          theme: ThemeData(
          
            primarySwatch: Colors.blue,
          ),
          home:  LaunchScreen(),
    ),
     );
  }
}
