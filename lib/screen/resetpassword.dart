import 'package:e_commerce/models/auth_provider.dart';
import 'package:e_commerce/widget/custom_button.dart';
import 'package:e_commerce/widget/custom_form_filed.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class ResetPassword extends StatelessWidget {

  TextEditingController reset=TextEditingController();
  @override
  Widget build(BuildContext context) {
    final auth=Provider.of<Auth>(context);
    return Scaffold(
      appBar: AppBar(),
          body: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center
              ,children: [
              

              CustomeFormField(reset, false, "enter valid email",S.of(context).email, Icons.email, TextInputType.emailAddress),
              custmoButton(Text("SendeResetEmail"), ()async{
          await    auth.sendPasswordResetEmail(reset.text);
          Fluttertoast.showToast(msg: "check your email");



              }, null, context)



            ],),
        
      ),
    );
  }
}