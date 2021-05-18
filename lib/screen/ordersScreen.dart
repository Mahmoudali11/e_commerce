import 'package:e_commerce/Theme/style.dart';
import 'package:e_commerce/models/entities/user.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:e_commerce/models/entities/orders.dart';

class OrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("caled");
    final order = Provider.of<Orders>(context,);
     //    final v= Provider.of<UserProfiles>(context);


         
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<List<Order>>(
          future: order.getOrders(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasData) {
              final lst = getOrder(snapshot,context);

              return ListView(
                children: lst,
              );
            }
          }),
    );
  }

  List<Widget> getOrder(AsyncSnapshot<List<Order>> snapshot,BuildContext context) {
    final lst = snapshot.data;
    List<Widget> widgets = [];

    for (var v in lst) {
      widgets.add(Card(
        child:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          
              children: [
                Text(v.name,style:style2.copyWith(fontSize:25,color: Colors.purple)),
                Text(v.desc),

                Text(v.price,style: style2.copyWith(fontSize:25),),

              
                Text(v.date),
                Text(v.size),
                Text(v.who),
                Text(v.phone),
                Text(v.address),

                Align(alignment: Alignment.centerRight,child: IconButton(icon: Icon(Icons.delete_forever_outlined,color: Colors.red,size: 30,), onPressed: ()async{
                await   Provider.of<Orders>(context,listen: false).deleteOrder(v.oid);
//await   Provider.of<UserProfiles>(context).getUserProfile("dsx");
                    Fluttertoast.showToast(msg: "order deleted",gravity: ToastGravity.BOTTOM);
                  



                }))
                

              ],
            ),
        ),
      ));
    }
    return widgets;
  }
}
