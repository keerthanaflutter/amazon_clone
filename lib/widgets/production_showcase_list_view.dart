import 'package:amazon_clone/util/color_themes.dart';
import 'package:flutter/material.dart';

class ProductsShowcaseListView extends StatefulWidget {
  final String title;
  final List<Widget> children;
  const ProductsShowcaseListView(
      {super.key, required this.title, required this.children});

  @override
  State<ProductsShowcaseListView> createState() =>
      _ProductsShowcaseListViewState();
}

class _ProductsShowcaseListViewState extends State<ProductsShowcaseListView> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double height = screenSize.height / 4;
    double titleHeight = 25;
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      height: height,
      width: screenSize.width,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: titleHeight,
            child: Row(
              children: [
               Text(widget.title, style: const TextStyle(fontSize: 17, 
               fontWeight: FontWeight.bold
               ),
               ),
              const Padding(
                 padding:  EdgeInsets.only(left: 14),
                 child:  Text(
                  "Show mored", 
                  style: TextStyle(color: activeCyanColor),),
               )
              ],
            ),
          ),
          SizedBox(
            height: height -(titleHeight + 26),
            width: screenSize.width,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: widget.children,
            ),
          ),
        ],
      ),
    );
  }
}
