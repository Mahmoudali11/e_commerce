
import 'package:e_commerce/models/entities/cart.dart';
import 'package:e_commerce/models/entities/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:e_commerce/models/auth_provider.dart';
import 'package:e_commerce/Theme/style.dart';
 class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     final w=MediaQuery.of(context).size.width;
        final h=MediaQuery.of(context).size.height;

    final auth=Provider.of<Auth>(context);
final product=Provider.of<MyCarts>(context);
     print("hi");
    return SafeArea(
          child: Scaffold(
        appBar: AppBar(
         
          title: Text("products "),
          
        ),
        body:product.carts.isEmpty?Center(child:CircularProgressIndicator()): GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
mainAxisSpacing: 5,
crossAxisSpacing: 5,
 crossAxisCount: 1,
 childAspectRatio: 1



        ), itemCount: product.carts.length,itemBuilder: (context,index){
          print(product.carts[index].name);
       return Padding(
         padding: const EdgeInsets.all(8.0),
         child: Card(

          
      // color: Colors.grey,
 
           child: Column(
crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,           children:[



            Image.network(product.carts[index].img,width:w/2,height: h/5,fit: BoxFit.fill,),
            Text(product.carts[index].name,style:style,),
            Text(product.carts[index].price,style:style,),
            Text(product.carts[index].size,style:style,),
             Text(product.carts[index].orderdate,style:style,),
                         Text(product.carts[index].desc,style:style,),




  


             ]


           )),
       );

       


       
       




        })
        
       
       






         
        ),
    );

      
  
  }
}