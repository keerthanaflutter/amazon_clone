import 'package:amazon_clone/model/product_model.dart';
import 'package:amazon_clone/widgets/result_widget.dart';
import 'package:amazon_clone/widgets/search_bar_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final String query;
  const ResultScreen({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Searchbarwidget(isReadonly: false, hasBarButton: true),
      body: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: RichText(
                  text: TextSpan(children: [
                const TextSpan(
                  text: "Showing result for ",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                  ),
                ),
                TextSpan(
                  text: query,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontStyle: FontStyle.italic),
                ),
              ])),
            ),
          ),
          Expanded(
            child: GridView.builder(
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 2/3
                ),
                itemBuilder: (context, Index) {
                  return ResultWidget(
                    product: Productmodel(
                        url:
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4iY6dz6wWdzxEMY2wWff5Rboh9pGOFzmcfg&usqp=CAU",
                        productname: "rick  s dfv gbh  nj",
                        cost: 999,
                        discount: 0,
                        uid: "toy",
                        sellername: "ricky seller",
                        smalleruid: "4523cvbn",
                        rating: 3,
                        noofRating: 1),
                  );
                }),
          )
        ],
      ),
    );
  }
}
