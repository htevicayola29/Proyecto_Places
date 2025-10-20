import 'package:flutter/material.dart';
import 'package:places/gradient_back.dart';
class homeAppBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    //appBar
    final appBar = Stack(
      children:<Widget> [
        GradientBack()
      ],
    );
    return appBar;
  }

}