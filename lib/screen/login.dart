import 'package:e_commerce/models/auth_provider.dart';
import 'package:e_commerce/screen/home.dart';
import 'package:e_commerce/screen/register.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/widget/custom_form_filed.dart';
import 'package:e_commerce/widget/custom_button.dart';
import 'package:provider/provider.dart';
import 'package:e_commerce/Theme/style.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text("wlcome"),
      ),
      body: Container(
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: [
              CustomeFormField(email, false, "email required", "enter email",
                  Icons.email, TextInputType.emailAddress),
              CustomeFormField(pass, false, "pass required", "enter pass",
                  Icons.enhanced_encryption, TextInputType.visiblePassword),
              custmoButton(Text("Login"), () async {
                if (formkey.currentState.validate()) {
                  try {
                    String id = await authState.logIn(email.text, pass.text);
                    if (id != null)
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return MyHomePage();
                      }));
                  } catch (e) {}
                } else {}
              }, null),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Create Account?"),
                  TextButton(onPressed: (){
                     Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Rergister();
                      }));

                  }, child: Text("Yes",style: style,))
                ],
              )
            ],
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
