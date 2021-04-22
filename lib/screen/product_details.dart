import 'package:e_commerce/Theme/style.dart';
import 'package:e_commerce/models/auth_provider.dart';
import 'package:e_commerce/models/entities/orders.dart';
import 'package:e_commerce/models/entities/product.dart';
import 'package:e_commerce/models/entities/user.dart';
import 'package:e_commerce/widget/custom_button.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {
  Product product;
  ProductDetails({this.product});

  @override
  _ProductDetailsState createState() => _ProductDetailsState(product: product);
}

class _ProductDetailsState extends State<ProductDetails> {

  Product product = Product();
  var size;

  _ProductDetailsState({
    this.product,
  });
  
  @override
  Widget build(BuildContext context) {
      final addtocard=Provider.of<Orders>(context);
      final userinf=Provider.of<UserProfiles>(context);

     final height= MediaQuery.of(context).size.height;
          final width=MediaQuery.of(context).size.width ;
    return Scaffold(
      appBar: AppBar(
        title: Text("product details"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
      
    
      Image.network(
      product.imgurl,
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 2,
      fit: BoxFit.fill,
    ),
    
    Row(
      children: [
          Text("name:", style: style),
          Spacer(),
          Text(product.name,style: style2,),
      ],
    ),
    Row(
      children: [
          Text("describtion:", style: style),
          Spacer(),
          Text(product.desc,style: style2,),
      ],
    ),
    Row(
      children: [
          Text("Price:", style: style),
          Spacer(),
          Text(product.price,style: style2,),
      ],
    ),
    Row(
      children: [
          Text("Selct  size:", style: style),
          Spacer(
        flex: 2,
          ),
          Container(
        width: 100,
        decoration: BoxDecoration(
           
            borderRadius: BorderRadius.circular(20),
            color: Colors.green),
        child: DropdownButton(
        elevation: 10,
          isExpanded: true,
          items: product.size.map((e) {
            return DropdownMenuItem(
              child: Text(e.toString()),
              value: e,
            );
          }).toList(),
          onChanged: (selectv) {
            setState(() {
              size = selectv;
            });
          },
          value: size ?? product.size[0],
        ),
          ),
      ],
    ),
              Center(
      child: custmoButton(Text("AddToCard"), ()async {

        
            





    await userinf.getUserProfile(Provider.of<Auth>(context,listen: false).user.uid);


    




      
    final order=Order(price: product.price,desc: product.desc,name: product.name,pid: product.id,imgurl: product.imgurl,address:"sohage" ,uid: userinf.userProfile.uid,date: DateTime.now().toString(),who: userinf.userProfile.name);

await addtocard.addOrder(order);



      },
          BoxDecoration(color: Colors.orangeAccent)),
          ),],
          ),
        ),
          ),
    );
  }
}
