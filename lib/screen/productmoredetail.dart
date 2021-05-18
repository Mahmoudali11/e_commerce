import 'package:e_commerce/Theme/style.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/models/entities/cart.dart';
import 'package:e_commerce/generated/l10n.dart';
class ProductMoreDetails extends StatelessWidget {

final MyCart product ;
ProductMoreDetails({this.product});
  @override
  Widget build(BuildContext context) {
    final h=MediaQuery.of(context).size.height;
    final lang =S.of(context);
    return Scaffold(
      appBar: AppBar(title: Text("..."),),
         body: Card(

            
        // color: Colors.grey,
 
             child: SingleChildScrollView(
                            child: Column(
crossAxisAlignment: CrossAxisAlignment.stretch,
                   verticalDirection: VerticalDirection.down,           children:[



                  Image.network(product.img,width:double.maxFinite,height:h/3,fit: BoxFit.fill,),
                  Row(

                    
                    children: [
                      Text(lang.name),
                      Text(product.name,style:style2,),
                    ],
                  ),
                  Row(
                    children: [
                        Text(lang.price),

                      Text(product.price,style:style2,),
                    ],
                  ),
                  Row(
                    children: [
                         Text(lang.size),

                      Text(product.size,style:style2,),
                    ],
                  ),
                   Row(
                     children: [
                          Text(lang.buyingdate),

                   
                     ],
                     
                   ),
                 Text(lang.desc),  
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Text(product.desc+"\n sdmf\n dlkfsdf\nd\nfd\nff\nfef\mfd\nf\nfedf\nfm\nm\nfd",style:style2,maxLines: 50,),
                 ),
     




  


                   ]


                 ),
             )),
    );
  }
}