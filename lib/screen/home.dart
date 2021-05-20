import 'package:e_commerce/Theme/style.dart';
import 'package:e_commerce/models/appLang.dart';
import 'package:e_commerce/models/auth_provider.dart';
import 'package:e_commerce/models/entities/cart.dart';
import 'package:e_commerce/models/entities/product.dart';
import 'package:e_commerce/models/entities/user.dart';
import 'package:e_commerce/screen/addProduct.dart';
import 'package:e_commerce/screen/cart.dart';
import 'package:e_commerce/screen/login.dart';
import 'package:e_commerce/screen/managementScreen.dart';
import 'package:e_commerce/screen/usersScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart';
import 'product_details.dart';
import 'package:e_commerce/generated/l10n.dart';

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
    print("hi");
    Future.delayed(Duration(seconds: 1), () {
      Provider.of<Auth>(context, listen: false).getUser();
      final auth = Provider.of<Auth>(context, listen: false);
      Provider.of<MyCarts>(context, listen: false).getCarts(auth.user);
      Provider.of<Products>(context, listen: false).getProducts();
      Provider.of<UserProfiles>(context,listen: false).getUserProfile(auth.user.uid);
    });

    super.initState();
  }

  bool isinMyCart(List<MyCart> a, Product b) {
    for (var i in a) {
      if (i.id == b.id) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final userdata=Provider.of<UserProfiles>(context,listen: false);
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    final lang=S.of(context);

    final auth = Provider.of<Auth>(context);
    final product = Provider.of<Products>(
      context,
    );
    final cartCount = Provider.of<MyCarts>(context);

    print("hi form build" + h.toString());

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(lang.products),
          actions: [
           
            Badge(
              position: BadgePosition(bottom: 1),
              badgeColor: Colors.red,
              badgeContent: Text(cartCount.carts.length.toString() ?? "0",style: style,),
              child: IconButton(
                  icon: Icon(Icons.shopping_cart_outlined),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return CartScreen();
                    }));
                  }),
            )
          ],
        ),
        drawer: Drawer(child: Container(child:userdata.userProfile!=null? Column
        (mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start
          
          ,children: [
          
           Container(
             padding: const EdgeInsets.only(top:50,left: 20,bottom: 50),
             
            width: double.maxFinite,
            decoration: BoxDecoration(
              boxShadow: [
BoxShadow(color:Colors.grey,blurRadius: 3,spreadRadius: 5)


              ],
                          color:Theme.of(context).primaryColor,


              borderRadius: BorderRadius.only(bottomRight: Radius.circular(100))
            ),
            
            
            child: Row(
              children: [
                CircleAvatar(backgroundImage: AssetImage("assets/pick.PNG"),radius: 30,),
                SizedBox(width:10), Flexible(child: Text( userdata.userProfile.name,style: styleh,overflow: TextOverflow.ellipsis,)),
          
        //  Text( userdata.userProfile.email,style: style2,),
              ],
            )),
  
       

         
       
           userdata.userProfile!=null&&userdata.userProfile.email=="mahmoudsaleam11@gmail.com"? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                
                Icon(Icons.settings_applications)
                ,
               TextButton(onPressed: () async {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ManageMentScreen();
          }));
        },child: Text(lang.productm,style: style2,),style: ButtonStyle(textStyle: MaterialStateProperty.all(style2)),)
              ],
            ),
          ):Text(''),
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                
                Icon(Icons.language)
                ,
                TextButton(onPressed: ()async{
               
               
                Provider.of<AppLang>(context,listen: false).changlan();

                }, child:Text(lang.language,style: style2,),style: ButtonStyle(textStyle: MaterialStateProperty.all(style2)),),
              ],
            ),
          ),
             Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                
                Icon(Icons.logout)
                ,
                TextButton(onPressed: ()async{
                 await auth.signOut();
                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                   return Login();
                 }));

                }, child:Text(lang.logout,style: style2,),style: ButtonStyle(textStyle: MaterialStateProperty.all(style2)),),
              ],
            ),
          ),


        ],):Center(child: CircularProgressIndicator()),),)
        ,
        body: product.plst.isEmpty
            ? Center(child: CircularProgressIndicator())
            : GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    crossAxisCount: 2,
                    childAspectRatio: 1),
                itemCount: product.plst.length,
                itemBuilder: (context, index) {
                  print(product.plst[index].name);
                  return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onLongPress: ()async{
if(userdata.userProfile.email=="mahmoudsaleam11@gmail.com"){

      await product.deleteProduct(product.plst[index].id);
     await  product.getProducts();



}






                        },
                          onTap: () {
                            final route = MaterialPageRoute(builder: (context) {
                              return ProductDetails(product: product.plst[index]);
                            });
                            Navigator.push(context, route);
                          },
                          child: Stack(
                              alignment: AlignmentDirectional.topEnd,
                              children: [
                                Container(
                                    
                                       decoration: BoxDecoration(              
                       color: Theme.of(context).backgroundColor,

                   borderRadius: BorderRadius.circular(15),
                   boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 6.0,
                    ),
                ],
                                       ),
                                     // color: Colors.grey,
                                      width: double.infinity,
                                      height: double.infinity),
                                Image.network(
                                  product.plst[index].imgurl,
                                ),
                                
                                Positioned(top: 1,left: 1,

                                          child: RotatedBox(
                                    quarterTurns: 3,
                                    child: Text(
                                      product.plst[index].name,
                                      style:styleh2,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 1,
                                  left: 1,
                                  child: Text(
                                    product.plst[index].price,
                                    style: style2,
                                  ),
                                ),


                                Positioned(
                                    right: 1,
                                    bottom: 1,
                                    child: isinMyCart(
                      cartCount.carts, product.plst[index])
                  ? Badge(
                       badgeColor: padgcolor,
                      badgeContent: Icon(Icons.check),
                      position: BadgePosition(bottom: 4),
                    )
                  : Text(''))
                              ],
                            )),
                    );
                }),
                
      
      ),
    );
  }
}
