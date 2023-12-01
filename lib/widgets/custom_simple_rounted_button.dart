import 'package:flutter/material.dart';

class CustomSimpleRountedButton extends StatelessWidget {
final VoidCallback onpressed;
final String text;
  const CustomSimpleRountedButton({super.key, required this.onpressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(3),
          border: Border.all(
            color: Colors.grey, 
            width: 1, 
            )
        ),
        child: Text(text),
      ),
    );
  }
}
