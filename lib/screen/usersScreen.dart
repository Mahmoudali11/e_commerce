





 
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:e_commerce/models/entities/user.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';


// class UsersScreen extends StatelessWidget {
    
    
    

//   @override
//   Widget build(BuildContext context) {
//     print("dsd");
//          final users=Provider.of<UserProfiles>(context,listen: false);
//          users.getUsersProfile();



//         return Scaffold(
//           appBar: AppBar(),

//    body: users.users!=null?Text(users.users[0].name):Text("no"),



//         );
        




        
  
      
    
//   }
// }







 
 
/////////////////////////////////////////////////////////////////////////////////////////////////
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/models/entities/user.dart';
import 'package:e_commerce/screen/chating.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class UsersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

   final users=Provider.of<UserProfiles>(context,listen: false);

   print("from users screeen");
final user=FirebaseFirestore.instance.collection("users");
    return Scaffold(
       body: FutureBuilder<List<UserProfile>>(future:users.getUsersProfile(),
      
      
      builder:(context,snapshot){
         if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if(snapshot.hasData)
        {

          return   ListView.builder(itemBuilder: (context,index){



            return Card(


              child:ListTile(

                      leading:CircleAvatar(child: Icon(Icons.person),),
                      title: Text(snapshot.data[index].name),
                      subtitle: Text(snapshot.data[index].email),
                      onTap: (){

     final route=MaterialPageRoute(builder: (context){

       return ChatScreen(reciverid: snapshot.data[index].uid,receivername: snapshot.data[index].name,);
     });
Navigator.push(context, route);


                      },



              )

            );
          },itemCount: snapshot.data.length);



       
        }



      }
      
      
      )
      
    );
  }
}