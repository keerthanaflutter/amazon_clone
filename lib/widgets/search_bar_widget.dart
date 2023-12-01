import 'package:amazon_clone/screens/result_screen.dart';
import 'package:amazon_clone/screens/search_screen.dart';
import 'package:amazon_clone/util/constance.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../util/color_themes.dart';

class Searchbarwidget extends StatelessWidget implements PreferredSizeWidget {
  // const Searchbarwidget({super.key}): preferredsize = const Size.fromHeight(kAppBarHeight);
  late final bool isReadonly;
  late final bool hasBarButton;

  Searchbarwidget(
      {super.key,
      PreferredSize,
      required this.isReadonly,
      required this.hasBarButton});
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kAppBarHeight);

  OutlineInputBorder border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(7),
    borderSide: const BorderSide(
      color: Colors.grey,
      width: 1,
    ),
  );

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      height: kAppBarHeight,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: backgroundGradient,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        hasBarButton
            ? IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back))
            : Container(),
        SizedBox(
          // height: screenSize.height* 0.9,
          width: screenSize.width * 0.7,
          child: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 8,
                  spreadRadius: 1,
                  offset: const Offset(0, 5))
            ]),
            child: TextField(
              onSubmitted: (String Query) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultScreen(query: Query)));
                // print("submitted ${Query}");
              },
              readOnly: isReadonly,
              onTap: () {
                if (isReadonly) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Searchscreen()));
                }
              },
              decoration: InputDecoration(
                  hintText: "Search for something in amazon",
                  fillColor: Colors.white,
                  filled: true,
                  border: border,
                  focusedBorder: border),
            ),
          ),
        ),
        IconButton(onPressed: () {}, icon: const Icon(Icons.mic_none_outlined))
      ]),
    );
  }
}
