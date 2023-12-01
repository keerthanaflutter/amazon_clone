import 'package:amazon_clone/util/constance.dart';
import 'package:amazon_clone/widgets/catageory_widget.dart';
import 'package:amazon_clone/widgets/search_bar_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Searchbarwidget(isReadonly: true, hasBarButton: false),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, 
            childAspectRatio: 2.2 / 3.5, 
            mainAxisSpacing: 15, 
            crossAxisSpacing: 15,), 
            itemCount: categoriesList.length, 
            itemBuilder: (context, Index)=> CatageoryWidget(Index: Index),
        ),
      ),
    );
  }
}