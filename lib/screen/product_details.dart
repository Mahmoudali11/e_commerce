import 'package:e_commerce/Theme/style.dart';
import 'package:e_commerce/models/auth_provider.dart';
import 'package:e_commerce/models/entities/orders.dart';
import 'package:e_commerce/models/entities/product.dart';
import 'package:e_commerce/models/entities/user.dart';
import 'package:e_commerce/widget/custom_button.dart';
import 'package:e_commerce/models/entities/cart.dart';
import 'package:e_commerce/widget/custom_form_filed.dart';
import 'package:place_picker/entities/localization_item.dart';
import 'package:place_picker/place_picker.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:geolocator/geolocator.dart';

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


   bool isinMyCart(List<MyCart> a,Product b){

for( var i in a){

  if(i.id==b.id){
  return true;
  }
}
  return false;
 
  }
  
  
  @override
  Widget build(BuildContext context) {

      final mycards=Provider.of<MyCarts>(context);
      final lang=S.of(context);
     return Scaffold(
        appBar: AppBar(
        title: Text("product details"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
      
    
      Image.network(
      product.imgurl,
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 2,
      fit: BoxFit.fill,
    ),
    
    
         Text(lang.name+product.name,style: style2,),

            // Spacer(),
    Text(lang.desc+product.desc,style: style2,),
        //   Spacer(),
    Text(lang.price+product.price,style: style2,),
    
               Text(lang.availablesizes+":"+product.size.toString()),

                Center(
      child: custmoButton(Text(lang.buy), ()async {



      if( isinMyCart(mycards.carts, product)){
          // show toast
          print("cant't add it it is allready in your card");
          Fluttertoast.showToast(
          msg: lang.allreadyinyourcard,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
           backgroundColor: Colors.black45,
          textColor: Colors.white,
          fontSize: 16.0
    );
           

          return;
      }
      print("...");
  showDialog(context: context, builder: (context){
    return       AddotCardAlert(product: product,);

  });

      },
            BoxDecoration(color: Colors.orangeAccent),context,
            ),)],
            ),
          ),
          ),
    );
  }
}
class AddotCardAlert extends StatefulWidget {
  Product product;
  AddotCardAlert({
    this.product
  });
  @override
  _AddotCardAlertState createState() => _AddotCardAlertState(product: product);
}

class _AddotCardAlertState extends State<AddotCardAlert> {
      final k=GlobalKey<FormState>();
      TextEditingController addres =TextEditingController();
      
   //   Order s;
     Product product ;
     var size;
     

_AddotCardAlertState({this.product});
Future<Position> _getUserLocation() async {
    LocationPermission permission;
    bool serviceEnabled;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error("@@@@@@@@@@@@@@@location sevice is disabled");
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      /// this show ui to get user permission
      print("enter permission");
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    ///if no one of apove return current location
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
  }
  Position p;
@override
void initState() {
_getUserLocation().then((value) {p=value;

setState(() {
  
});
}

);
    size=product.size[0];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
          final lang=S.of(context);

      final addtocard=Provider.of<Orders>(context);
      final userinf=Provider.of<UserProfiles>(context);
    var dropdownButton = DropdownButton(
              elevation: 10,
                isExpanded: false,
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
              );
        return SingleChildScrollView(
                  child: AlertDialog(
              title: Text("please fill this info!"),
              content:Form(
                  key: k,
                  child: Column(children: [
     //  CustomeFormField(addres,true,"required",lang.adress,Icons.location_on_outlined,TextInputType.streetAddress),
     TextFormField(
       
       onTap: ()async{


         Position m=await _getUserLocation();
 LocationResult result = await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>
            PlacePicker("AIzaSyC3FEo_7bksnMhiBfGiZ9ruvW7c3bxRf2Y",
                        displayLocation: LatLng(m.latitude,m.longitude),
                        
                        )));
addres.text= "${result.name },${result.city.name}";

    // Handle the result in your way
    print(result.name);
    setState(() {
  
});

       },
       readOnly: true,
       controller: addres,
       decoration: InputDecoration(prefixIcon: Icon(Icons.location_on_outlined)
       ),



     ),
       Row(
           mainAxisAlignment: MainAxisAlignment.center,
             children: [Text(lang.size),
             SizedBox(width:50),
               dropdownButton,
             ],
       ),




              ],


              
              
              ),



            ),
      actions: [SizedBox(
        width: 100,
        child: custmoButton(Text(lang.add), ()async{


              if(k.currentState.validate()){
    final date=DateFormat.yMd().add_jm().format(DateTime.now()).toString(); 
              await userinf.getUserProfile(Provider.of<Auth>(context,listen: false).user.uid);

    final order=Order(phone: userinf.userProfile.phone,size:size.toString(),price: product.price,desc: product.desc,name: product.name,pid: product.id,imgurl: product.imgurl,address:addres.text ,uid: userinf.userProfile.uid,date: date,who: userinf.userProfile.name);

         await addtocard.addOrder(order);

    print("data added");
     Provider.of<MyCarts>(context,listen: false).getCarts(Provider.of<Auth>(context,listen: false).user);

         Navigator.of(context).pop();





              }



        }, null,context),
      ),SizedBox(
        width: 100,
        child: custmoButton(Text(lang.cancel), (){
                     Navigator.of(context).pop();

        }, null,context),
      )],
      
    ),
        );
  }
}