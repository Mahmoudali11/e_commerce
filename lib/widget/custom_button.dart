import 'package:flutter/material.dart';

Widget custmoButton(Text txt,Function function,Decoration v){



  return ElevatedButton(onPressed:function, child: txt,style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.teal)),);
}