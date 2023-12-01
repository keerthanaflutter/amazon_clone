import 'package:amazon_clone/util/color_themes.dart';
import 'package:amazon_clone/util/constance.dart';
import 'package:flutter/material.dart';

class AccountScreenAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  // late final Size prefferredSize;
  // ignore: prefer_const_constructors_in_immutables
  AccountScreenAppBar({super.key});

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kAppBarHeight);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      height: kAppBarHeight,
      width: screenSize.width,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: backgroundGradient,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Image.network(amazonLogoUrl, height: kAppBarHeight *0.7,),
                  ),
                  Row(
                    children: [
                      IconButton(onPressed: (){}, icon: const Icon(Icons.notifications_outlined)),
                      IconButton(onPressed: (){}, icon: const Icon(Icons.search_outlined, color: Colors.black,))
                    ],
                  )
                ],
              ),
    );
  }
}
