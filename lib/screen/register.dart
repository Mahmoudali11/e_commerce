import 'package:e_commerce/screen/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:e_commerce/models/auth_provider.dart';
import 'package:e_commerce/widget/custom_button.dart';
import 'package:e_commerce/screen/home.dart';
import 'package:e_commerce/widget/custom_form_filed.dart';
import 'package:e_commerce/generated/l10n.dart';

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
  TextEditingController phone=TextEditingController();
  final sk = GlobalKey<ScaffoldState>();
  bool isviv = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authState = Provider.of<Auth>(context);
    final lang = S.of(context);
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
                  CustomeFormField(name, false, "name required", lang.name,
                      Icons.person, TextInputType.emailAddress),
                  CustomeFormField(email, false, "email required", lang.email,
                      Icons.email, TextInputType.emailAddress),
                  CustomeFormField(pass, false, "pass required", lang.pass,
                  Icons.enhanced_encryption, TextInputType.visiblePassword),
                  CustomeFormField(
                      confirmPass,
                      false,
                      "confirm pass",
                      lang.confirmp,
                      Icons.enhanced_encryption,
                      TextInputType.visiblePassword),
                       CustomeFormField(phone, false, "phone no required", lang.phone,
                      Icons.phone, TextInputType.phone),
                      Text("we'll send email verf link"),

                  custmoButton(Text(lang.signup), () async {
                    if (formkey.currentState.validate()) {
                      if (pass.text != confirmPass.text) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text("")));
                        return;
                      }
                      try {
                        authState
                            .signUp(email.text, pass.text, name.text,phone.text)
                            .then((value) async {
                           if (value != null) {
                            await authState.logIn(email.text, pass.text);
                       User user=     FirebaseAuth.instance.currentUser;

                            if(!user.emailVerified){

                        await user.sendEmailVerification();
                         Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return Login();
                            }));
                            return;
                            }

                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return MyHomePage();
                            }));
                          }
                          print(
                              " @@@@@@@@@Successfull process !user id is $value");
                          //   return ;
                        });
                      } catch (e) {
                        print(e.toString());
                      }
                    }
                  }, null, context)
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
