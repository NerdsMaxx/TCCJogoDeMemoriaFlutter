import 'package:flutter/material.dart';

class CustomOutlineInputBorder extends OutlineInputBorder {
   const CustomOutlineInputBorder()
      : super(
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          borderSide: const BorderSide(
            color: Color(0xff342f27),
            width: 5,
          ),
        );
}
