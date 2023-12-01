import 'package:amazon_clone/util/constance.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CatageoryHorizontalListViewBar extends StatelessWidget {
  const CatageoryHorizontalListViewBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kAppBarHeight,
      width: double.infinity,
      color: Colors.white,
      child: ListView.builder(
          itemCount: categoriesList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, Index) {
            return GestureDetector(
              onTap: (){},
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: Center(
                  child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(backgroundImage: NetworkImage(
                      categoryLogos[Index],
                    ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(categoriesList[Index]),
                    )
                  ],
                            
                  ),
                ),
              ),
            );
          }),
    );
  }
}
