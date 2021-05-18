import 'package:flutter/material.dart';

// textFormWidget(TextEditingController a, String errormsg, String hint,
//     IconData m, TextInputType textInputType, bool isviv) {
//   //  bool isviv=false;

//   return Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: TextFormField(
//       controller: a,
//       keyboardType: textInputType,
//       decoration: InputDecoration(
//           icon: Icon(
//             m,
//             color: Colors.grey,
//           ),
//           hintText: hint,
//           suffixIcon: textInputType == TextInputType.visiblePassword
//               ? IconButton(
//                   icon: Icon(isviv ? Icons.visibility : Icons.visibility_off),
//                   onPressed: () {})
//               : null),
//       validator: (text) {
//         if (text.isEmpty) {
//           return errormsg;
//         } else {
//           return null;
//         }
//       },
//     ),
//   );
// }

class CustomeFormField extends StatefulWidget {
  TextEditingController a;
  String errormsg;
  String hint;
  IconData m;
  TextInputType textInputType;
  bool isviv;
  Function function;
  CustomeFormField(
      this.a,
      this.isviv,
      this.errormsg,
      this.hint,
      this.m,
      this.textInputType,
      );
  @override
  _CustomeFormFieldState createState() => _CustomeFormFieldState(
      this.a,
      this.isviv,
      this.errormsg,
      this.hint,
      this.m,
      this.textInputType,
      );
}

class _CustomeFormFieldState extends State<CustomeFormField> {
  TextEditingController a;
  String errormsg;
  String hint;
  IconData m;
  TextInputType textInputType;
  bool isviv;
   _CustomeFormFieldState(this.a, this.isviv, this.errormsg, this.hint, this.m,
      this.textInputType,);
  @override
  Widget build(BuildContext context) {
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
              color: Theme.of(context).iconTheme.color,
            ),
            hintText: hint,
            suffixIcon: textInputType == TextInputType.visiblePassword
                ? IconButton(
                    icon: Icon(isviv ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        print("dsf");
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
