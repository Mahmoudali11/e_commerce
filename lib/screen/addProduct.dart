 
import 'package:e_commerce/Theme/style.dart';
import 'package:e_commerce/widget/custom_form_filed.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/models/entities/product.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:e_commerce/widget/custom_button.dart';
import 'package:e_commerce/generated/l10n.dart';
class AddProductScreen extends StatelessWidget {
    TextEditingController name=TextEditingController();
        TextEditingController desc=TextEditingController();
        TextEditingController price=TextEditingController();
        TextEditingController sizefrom=TextEditingController();
        TextEditingController sizeto=TextEditingController();

    final formstate=GlobalKey<FormState>();

    List generateSize(int from ,int to){

      List gl=[];
      for(int i=from ;i<=to;i++)
      gl.add(i);



      return gl;




    }

  
  @override
  Widget build(BuildContext context) {
    final x=MediaQuery.of(context).size.width;
        final y=MediaQuery.of(context).size.height;
        final lan=S.of(context);

   print("hi from buil of add product");
      



    final p=Provider.of<Products>(context);

    return Scaffold(
      appBar: AppBar(title: Text("add"),),
          body: SingleChildScrollView(

            child: Column(mainAxisSize: MainAxisSize.min,children: [
              Stack(
 
                            children:[ Container(width:x ,
                
                child:p.img!=null? Image.file(p.img): Image.asset("assets/pick1.PNG",fit: BoxFit.fill,) ,
                decoration: BoxDecoration(color: Colors.grey),
                
                
                ),
              
              Positioned(  bottom: 3,left: x/2,
                              child: Row(mainAxisSize: MainAxisSize.min,mainAxisAlignment: MainAxisAlignment.center,children: [IconButton(icon: Icon(Icons.camera_alt), onPressed:()async{

      await p.chooseImage(ImageSource.camera);

                
                }),
                IconButton(icon: Icon(Icons.image), onPressed:()async{

      await p.chooseImage(ImageSource.gallery);

                
                })
                
                
                
                ],),

                
              ),

              






            ],),
            Form(
              key: formstate,
              
              
              child: Column(
              children: [
                CustomeFormField(name,false,"required","enter name of product",Icons.details,TextInputType.name),
                CustomeFormField(desc,false,"required","enter desc of product",Icons.details,TextInputType.name),
                  CustomeFormField(price,false,"required","enter price of product",Icons.details,TextInputType.name),
                CustomeFormField(sizefrom,false,"required","enter min size",Icons.details,TextInputType.number),
                CustomeFormField(sizeto,false,"required","enter max size ",Icons.details,TextInputType.number),


   custmoButton(Text(lan.add), 

   ()async{
                     int minsize=int.parse(sizefrom.text);
                     int maxsize=int.parse(sizeto.text);
                  final size=generateSize(minsize, maxsize);

    Product product=Product(name:name.text,desc: desc.text,price: price.text,size: size);


            await      p.addProduct(product);
            await p.getProducts();

                },  null, context)



              ],
            ))
            
            
            
            ])




          ),
    );
  }
}