 
import 'dart:ui';

import 'package:e_commerce/Theme/style.dart';
import 'package:e_commerce/models/appLang.dart';
import 'package:e_commerce/models/entities/cart.dart';
import 'package:e_commerce/models/entities/messeages.dart';
import 'package:e_commerce/models/entities/orders.dart';
import 'package:e_commerce/models/entities/product.dart';
import 'package:e_commerce/models/entities/user.dart';
import 'package:e_commerce/screen/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screen/launch_screen.dart';
import 'package:provider/provider.dart';
import 'models/auth_provider.dart';
import 'models/entities/cart.dart';
import 'package:e_commerce/models/entities/orders.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:e_commerce/models/entities/messeages.dart';
import 'generated/l10n.dart';
void main()async {


WidgetsFlutterBinding.ensureInitialized();

await Firebase.initializeApp();
print("Dsd");
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  statusBarColor: Colors.black,
));

  runApp(

    ChangeNotifierProvider(create: (_)=>AppLang(),child:   MyApp())
 );
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
         ChangeNotifierProvider(create: (context)=>UserProfiles()),
        ChangeNotifierProvider(create: (context)=>Messages()),

         
    //     ChangeNotifierProvider(create: (context)=>AppLang())

    ],
            child: MaterialApp(

          
          
          debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
          theme:them, 


          locale:Provider.of<AppLang>(context).n,
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
          home:  LaunchScreen(),
    ),
     );
  }
}
