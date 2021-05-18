 
import 'package:flutter/material.dart';

Widget custmoButton(Text txt,Function function,Decoration v,BuildContext context){



  return SizedBox(
    width: 150,
    child: ElevatedButton(onPressed:function, child: txt,style:  ElevatedButton.styleFrom(
      primary: Theme.of(context).buttonColor,
 
elevation: 3,
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))


    ),
    
    
    
    ),
  );
}