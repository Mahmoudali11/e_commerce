
import 'package:e_commerce/models/entities/cart.dart';
import 'package:e_commerce/models/entities/product.dart';
import 'package:e_commerce/screen/productmoredetail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:e_commerce/models/auth_provider.dart';
import 'package:e_commerce/Theme/style.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
 class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     final w=MediaQuery.of(context).size.width;
        final h=MediaQuery.of(context).size.height;
         final lang=S.of(context);
         MediaQueryData mediaQueryData = MediaQuery.of(context);

    final auth=Provider.of<Auth>(context);
final product=Provider.of<MyCarts>(context);
     print("hi");
    return SafeArea(
          child: Scaffold(
        appBar: AppBar(
         
          title: Text(lang.products),
          
        ),
        body:product.carts.isEmpty?Center(child:Text(lang.noproducts)):GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    crossAxisCount: 1,
                    childAspectRatio: .9),
                itemCount: product.carts.length,
                itemBuilder: (context, index) {
                    return GestureDetector(

                      onTap: (){
final route=MaterialPageRoute(builder: (context){
  return ProductMoreDetails(product: product.carts[index],);
});
Navigator.push(context, route);



                      },
                                          child: Card(

          
      // color: Colors.grey,
 
           child: Column(
crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,           children:[



              Image.network(product.carts[index].img,width:w/2,height: h/3,fit: BoxFit.fill,),
              Row(

                
                children: [
                  Text(lang.name),
                  Text(product.carts[index].name,style:style2,),
                ],
              ),
              Row(
                children: [
                      Text(lang.price),

                  Text(product.carts[index].price,style:style2,),
                ],
              ),
              Row(
                children: [
                       Text(lang.size),

                  Text(product.carts[index].size,style:style2,),
                ],
              ),
               Row(
                 children: [
                        Text(lang.buyingdate),

                   Text(product.carts[index].orderdate,overflow: TextOverflow.ellipsis,style:style2,),
                 ],
               ),
             Row(
               children: [
                      Text(lang.desc),

                 Flexible(child: Text(product.carts[index].desc,overflow: TextOverflow.ellipsis,style:style2,)),
               ],
             ),




  


               ]


             )),
                    );
                }),
        ),
    );

      
  
  }

  List<Widget>  mo(MyCarts mm,BuildContext context){
    
  List<Card> x=[];

  x=mm.carts.map((product) {


return Card(

          
      // color: Colors.grey,
 
           child: Column(
crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,           children:[



              Image.network(product.img,),
              Row(

                
                children: [
               //   Text(lang.name),
                  Text(product.name,style:style2,),
                ],
              ),
              Row(
                children: [
                //    Text(lang.price),

                  Text(product.price,style:style2,),
                ],
              ),
              Row(
                children: [
                  //   Text(lang.size),

                  Text(product.size,style:style2,),
                ],
              ),
               Row(
                 children: [
                    //  Text(lang.buyingdate),

                   Text(product.orderdate,overflow: TextOverflow.ellipsis,style:style2,),
                 ],
               ),
             Row(
               children: [
                  //  Text(lang.desc),

                 Flexible(child: Text(product.desc,overflow: TextOverflow.ellipsis,style:style2,)),
               ],
             ),




  


               ]


             ));  }).toList();


return x;


  }




}
