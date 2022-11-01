import 'package:flutter/material.dart';

double getWidth(BuildContext context, double widthFactor) =>
    MediaQuery.of(context).size.width * widthFactor;

double getHeight(BuildContext context, double heightFactor) =>
    MediaQuery.of(context).size.height * heightFactor;
