import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration authInputDecoration(
      {required String hintText, required String labelText, IconData? prefixIcon}) {
    return InputDecoration(
        //enabledBorder, cuando este seleccionado
        //UnderlineInputBorder, border down
        enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.deepPurple)),
        //focusedBorder, cuando tenga el foco
        //UnderlineInputBorder, border down
        focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.deepPurple, width: 2)),
        //placeHolder
        hintText: hintText,
        //label arriba del input
        labelText: labelText,
        //color labelText
        labelStyle: const TextStyle(color: Colors.red),
        prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: Colors.deepPurple) : null);
  }
}
