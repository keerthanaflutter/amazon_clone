import 'package:flutter/material.dart';

class CustomMianButton extends StatelessWidget {
  final Widget child;
  final Color color;
  final bool isloading;
  final VoidCallback onpressed;
  const CustomMianButton({super.key, required this.child,required this.color, required this.isloading,required this.onpressed});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: color,
        fixedSize: Size(screenSize.width * 0.5, 40)
      ),
      onPressed: onpressed,
      child: !isloading
       ? child : const Padding(
        padding: EdgeInsetsDirectional.symmetric(vertical: 5),
        child: AspectRatio(
          aspectRatio: 1/1,
           child: CircularProgressIndicator(color: Colors.white,))),
    );
  }
}
