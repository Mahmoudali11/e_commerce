import 'package:e_commerce/Theme/style.dart';
import 'package:e_commerce/screen/addProduct.dart';
import 'package:e_commerce/screen/ordersScreen.dart';
import 'package:flutter/material.dart';

class ManageMentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            child: Card(
              elevation: 3,
                           child: Container(

                width: w* 0.4,
                height: h / 5,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(30),color: Theme.of(context).backgroundColor),
                child: Center(child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("addProducts",style: style2,),
                    Icon(Icons.add,size: 30,)
                  ],
                )),
               ),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return AddProductScreen();
              }));
            },
          ),
            GestureDetector(
            child: Card(
              elevation: 3,
                           child: Container(

                width: w*0.4,
                height: h / 5,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(30),color: Theme.of(context).backgroundColor),
                child: Center(child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("ShowProducts",style: style2,),
                    Icon(Icons.list_rounded)
                  ],
                )),
               ),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return OrderScreen();
              }));
            },
          ),


         
        ],
      )),
    );
  }
}
