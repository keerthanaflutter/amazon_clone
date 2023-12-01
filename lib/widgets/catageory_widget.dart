import 'package:amazon_clone/util/constance.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CatageoryWidget extends StatelessWidget {
  final int Index;
  const CatageoryWidget({super.key, required this.Index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white, 
          borderRadius: BorderRadius.circular(7),
          boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 8,
              spreadRadius: 1)
        ]),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(
                categoryLogos[Index],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  categoriesList[Index], 
                  style: const TextStyle(
                    fontWeight: FontWeight.w500, 
                    letterSpacing: 0.5 
                    ),
                    ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
