import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future navigetFinsh({
  context,
  required Widget navig,
}) =>
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => navig), (route) => false);

Future navigatTo({
  context,
  required Widget navig,
}) =>
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => navig,
        ));

Widget defaultTextFormField({
  required String? Function(String?)? validator,
  required void Function(String) onChanged,
  required void Function() ontad,
  required IconData icon,
  required String label,
  IconData? suffixIcon,
  required bool obscureText,
  required TextEditingController control,
  required TextInputType Type,
}) =>
    TextFormField(
      onTap: ontad,
      keyboardType: Type,
      controller: control,
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        prefixIcon: Icon(
          icon,
        ),
        label: Text(
          label,
        ),
        suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
      ),
      obscureText: obscureText,
    );

Future<bool?> tost({
  required text,
  required ToastStae state,
}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: chooseColor(state),
      textColor: Colors.white,
      fontSize: 16.0,
    );

enum ToastStae { succes, eror, waring }

Color chooseColor(ToastStae state) {
  Color? color;
  switch (state) {
    case ToastStae.succes:
      color = Colors.green;
      break;
    case ToastStae.eror:
      color = Colors.red;
      break;
    case ToastStae.waring:
      color = Colors.amber;
      break;
  }
  return color;
}

AppBar deafautAddBar() {
  return AppBar(
    leading: IconButton(
      onPressed: () {},
      icon: const Icon(
        Icons.arrow_back_ios_new_outlined,
      ),
    ),
    titleSpacing: 5,
    title: const Text("Edit Profial "),
    actions: [
      MaterialButton(
        onPressed: () {},
        child: const Text(
          "Udate",
          style: TextStyle(color: Colors.blue),
        ),
      ),
      const SizedBox(
        width: 5,
      ),
    ],
  );
}
