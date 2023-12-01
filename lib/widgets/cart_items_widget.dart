//import 'dart:ffi';

import 'package:amazon_clone/model/product_model.dart';
import 'package:amazon_clone/util/color_themes.dart';
import 'package:amazon_clone/widgets/custom_simple_rounted_button.dart';
import 'package:amazon_clone/widgets/custom_square_button.dart';
import 'package:amazon_clone/widgets/product_information_widget.dart';
import 'package:flutter/material.dart';

class CartItemWidget extends StatelessWidget {
  final Productmodel product;
  const CartItemWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(25),
      height: screenSize.height / 2,
      width: screenSize.width,
      decoration: const BoxDecoration(
          color: backgroundColor,
          border: Border(
            bottom: BorderSide(color: Colors.grey, width: 1),
          )),
      child: Column(
        children: [
          Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: screenSize.width / 3,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Center(
                        child: Image.network(
                          product.url,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: ProductInformationWidget(
                        productname: product.productname,
                        cost: product.cost,
                        sellername: product.sellername),
                  ),
                ],
              ),
              flex: 3),
          Expanded(
              child: Row(
                children: [
                  CustomSquareButton(
                      child: const Icon(Icons.remove),
                      onpressed: () {},
                      color: backgroundColor,
                      dimention: 40),
                  CustomSquareButton(
                      child: Center(
                          child: const Text(
                        "0",
                        style: TextStyle(color: activeCyanColor),
                      )),
                      onpressed: () {},
                      color: Colors.white,
                      dimention: 40),
                  CustomSquareButton(
                      child: const Icon(Icons.add),
                      onpressed: () {},
                      color: backgroundColor,
                      dimention: 40),
                ],
              ),
              flex: 1),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        CustomSimpleRountedButton(
                            onpressed: () {}, text: "Deleted"),
                        const SizedBox(
                          width: 5,
                        ),
                        CustomSimpleRountedButton(
                            onpressed: () {}, text: "Save for later"),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "see more of this",
                          style: TextStyle(color: activeCyanColor),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              flex: 1),
        ],
      ),
    );
  }
}
