import 'package:e_commerce/models/auth_provider.dart';
import 'package:e_commerce/screen/appNavigation.dart';
import 'package:e_commerce/screen/home.dart';
import 'package:e_commerce/screen/register.dart';
import 'package:e_commerce/screen/resetpassword.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/widget/custom_form_filed.dart';
import 'package:e_commerce/widget/custom_button.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:e_commerce/Theme/style.dart';
import 'package:e_commerce/generated/l10n.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formkey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  bool isviv = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authState = Provider.of<Auth>(context);
    final lang=S.of(context);
    return  SafeArea(
          child: Scaffold(
        
        body: Center(
          child: SingleChildScrollView(
                    child: Container(
              child: Form(
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  
                  children: [
                    SizedBox(height: 50,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(

                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
                        color:Theme.of(context).backgroundColor ),
                        child: CustomeFormField(email, false, "email required", lang.email,
                            Icons.email, TextInputType.emailAddress),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
                        color:Theme.of(context).backgroundColor ),
                        child: CustomeFormField(pass, false, "pass required", lang.pass,
                            Icons.enhanced_encryption, TextInputType.visiblePassword),
                      ),
                    ),
                    SizedBox(height: 30,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: custmoButton(Text(lang.login), () async {
                        if (formkey.currentState.validate()) {
                          try {
                            String id = await authState.logIn(email.text, pass.text);
                            User user=FirebaseAuth.instance.currentUser;

                            if(!user.emailVerified){
                          Fluttertoast.showToast(msg: "verfiy your email");
                          return;


                            }
                            if (id != null)
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return AppNaigation();
                              }));
                          } catch (e) {}
                        } else {}
                      }, null,context),
                    ),

                    TextButton(onPressed: (){
                      Navigator.push(context,
                           MaterialPageRoute(builder: (context) {
                         return Rergister();
                       }));

                        }, child: Text(lang.createaccount,)),
                     TextButton(onPressed: (){
                       Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ResetPassword();
                        }));

                    }, child: Text(lang.forget))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

//   Widget textFormWidget(TextEditingController a, String errormsg, String hint,
//       IconData m, TextInputType textInputType) {

//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: TextFormField(
//         obscureText: textInputType == TextInputType.visiblePassword?!isviv:false,
//         controller: a,
//         keyboardType: textInputType,
//         decoration: InputDecoration(
//             icon: Icon(
//               m,
//               color: Colors.grey,
//             ),
//             hintText: hint,
//             suffixIcon: textInputType == TextInputType.visiblePassword
//                 ? IconButton(
//                     icon: Icon(isviv ? Icons.visibility : Icons.visibility_off),
//                     onPressed: () {

// setState(() {
//   isviv=!isviv;
// });

//                     })
//                 : null),
//         validator: (text) {
//           if (text.isEmpty) {
//             return errormsg;
//           } else {
//             return null;
//           }
//         },
//       ),
//     );
//   }
}
