import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:e_commerce/models/auth_provider.dart';
import 'package:e_commerce/widget/custom_button.dart';
import 'package:e_commerce/screen/home.dart';
import 'package:e_commerce/widget/custom_form_filed.dart';

class Rergister extends StatefulWidget {
  @override
  _RergisterState createState() => _RergisterState();
}

class _RergisterState extends State<Rergister> {
  final formkey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController confirmPass = TextEditingController();
  TextEditingController name = TextEditingController();

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
        child: Center(
          child: Form(
            key: formkey,
            child: SingleChildScrollView(
                        child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                      CustomeFormField(name, false, "name required", "enter your full name",
                      Icons.person, TextInputType.emailAddress)
                  ,
                  CustomeFormField(email, false, "email required", "enter email",
                      Icons.email, TextInputType.emailAddress),
                  CustomeFormField(pass, false, "pass required", "enter pass",
                      Icons.enhanced_encryption, TextInputType.visiblePassword),
                      CustomeFormField(confirmPass, false, "confirm pass", "enter passl",
                      Icons.enhanced_encryption, TextInputType.visiblePassword),
                 
                  custmoButton(Text("signup"), () async {
                    if (formkey.currentState.validate()) {
                      try {
                       authState.signUp(email.text,pass.text,name.text).then((value) {
                           if (value!= null)
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return MyHomePage();
                          }));
                          print(" @@@@@@@@@Successfull process !user id is $value");
                     return ;
                        });

                       
                      } catch (e) {
                                              print(e.toString());

                      }


                    } 
                  }, null)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget textFormWidget(TextEditingController a, String errormsg, String hint,
      IconData m, TextInputType textInputType) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        obscureText:
            textInputType == TextInputType.visiblePassword ? !isviv : false,
        controller: a,
        keyboardType: textInputType,
        decoration: InputDecoration(
            icon: Icon(
              m,
              color: Colors.grey,
            ),
            hintText: hint,
            suffixIcon: textInputType == TextInputType.visiblePassword
                ? IconButton(
                    icon: Icon(isviv ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        isviv = !isviv;
                      });
                    })
                : null),
        validator: (text) {
          if (text.isEmpty) {
            return errormsg;
          } else {
            return null;
          }
        },
      ),
    );
  }
}
