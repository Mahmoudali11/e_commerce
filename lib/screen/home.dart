import 'package:e_commerce/Theme/style.dart';
import 'package:e_commerce/models/auth_provider.dart';
import 'package:e_commerce/models/entities/cart.dart';
import 'package:e_commerce/models/entities/product.dart';
import 'package:e_commerce/screen/cart.dart';
import 'package:e_commerce/screen/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart';
import 'product_details.dart';
class MyHomePage extends StatefulWidget {
 

 
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void dispose() {
    print("disposed");
  
    super.dispose();
  }

@override
  void initState() {
     Future.delayed(Duration.zero,(){
  Provider.of<Auth>(context,listen: false).getUser();
   final auth=Provider.of<Auth>(context,listen: false);
Provider.of<MyCarts>(context,listen: false).getCarts(auth.user);
Provider.of<Products>(context,listen: false).getProducts();
    

   });

     super.initState();
  }
  bool isinMyCart(List<MyCart> a,Product b){

for( var i in a){



  if(i.id==b.id){


    return true;
  }
}
  return false;








  }

  @override
  Widget build(BuildContext context){

    final w=MediaQuery.of(context).size.width;
        final h=MediaQuery.of(context).size.height;

     final auth=Provider.of<Auth>(context);
    final product=Provider.of<Products>(context,);
   final cartCount=Provider.of<MyCarts>(context);
   
  
        

    print("hi");



    return SafeArea(
          child: Scaffold(
        appBar: AppBar(
         
          title: Text("products "),
          actions: [IconButton(icon: Icon(Icons.exit_to_app_outlined), onPressed: (){
            auth.signOut().then((value) => 
            
            Navigator.pushReplacement(context,MaterialPageRoute(builder: (context){
              return Login();
            }))


            
            );



          }),Badge(
            position: BadgePosition(bottom: 1),
            badgeColor: Colors.red,
            badgeContent: Text(cartCount.carts.length.toString()??"0"),

              child: IconButton(icon: Icon(Icons.shopping_cart_outlined), onPressed: (){
              auth.signOut().then((value) => 
              
              Navigator.push(context,MaterialPageRoute(builder: (context){
                return CartScreen();
              }))


              
              );



            }),
          )],
        ),
        body:product.plst.isEmpty?Center(child:CircularProgressIndicator()): GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
mainAxisSpacing: 5,
crossAxisSpacing: 5,
 crossAxisCount: 2,
 childAspectRatio: .9

        ), itemCount: product.plst.length,itemBuilder: (context,index){
          print(product.plst[index].name);
       return Padding(
         padding: const EdgeInsets.all(8.0),
         child: GestureDetector(
           onTap: (){


             final route=MaterialPageRoute(builder: (context){
    return ProductDetails(product:product.plst[index]);
             });
         Navigator.push(context, route);



           },
                    child: Card(

            
      // color: Colors.grey,
 
             child: Column(
crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                verticalDirection: VerticalDirection.down,           children:[



                 Image.network(product.plst[index].imgurl,width:w/2,height: h/5,fit: BoxFit.fill,),
                 Text(product.plst[index].name,style:style,),
                Row(children:[ Text(product.plst[index].price,style:style,),Spacer(),isinMyCart(cartCount.carts, product.plst[index])?Badge(badgeColor: Colors.green,badgeContent:Icon(Icons.check),position: BadgePosition(bottom:4 ),):Text('')]),
                
 


                 ]


               )),
         ),
       );

       


       
       




        })
        
       
       






         
        ),
    );

      
  }
}
