import 'package:amazon_clone/model/product_model.dart';
import 'package:amazon_clone/model/review_model.dart';
import 'package:amazon_clone/model/user_details_model.dart';
import 'package:amazon_clone/util/color_themes.dart';
import 'package:amazon_clone/util/constance.dart';
import 'package:amazon_clone/widgets/cost_widget.dart';
import 'package:amazon_clone/widgets/custom_main_button.dart';
import 'package:amazon_clone/widgets/custom_simple_rounted_button.dart';
import 'package:amazon_clone/widgets/rating_star_widget.dart';
import 'package:amazon_clone/widgets/review_dialog.dart';
import 'package:amazon_clone/widgets/review_widget.dart';
import 'package:amazon_clone/widgets/search_bar_widget.dart';
import 'package:amazon_clone/widgets/user_details_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  final Productmodel productmodel;
  const ProductScreen({super.key, required this.productmodel});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  Expanded Spacethingy = Expanded(child: Container());
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: Searchbarwidget(isReadonly: true, hasBarButton: true),
        body: Stack(
          children: [
            SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: screenSize.height -
                        (kAppBarHeight + (kAppBarHeight / 2)),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: kAppBarHeight / 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Text(
                                      widget.productmodel.sellername,
                                      style: const TextStyle(
                                          color: activeCyanColor, fontSize: 15),
                                    ),
                                  ),
                                  Text(widget.productmodel.sellername),
                                ],
                              ),
                              RatingStarWidget(
                                rating: widget.productmodel.rating,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Container(
                            height: screenSize.height / 3,
                            constraints: BoxConstraints(
                                maxHeight: screenSize.height / 3),
                          ),
                        ),
                        Spacethingy,
                        CostWidget(
                            color: const Color.fromARGB(255, 105, 67, 67),
                            cost: widget.productmodel.cost),
                        Spacethingy,
                        CustomMianButton(
                            child: const Text(
                              "Buy now",
                              style: TextStyle(color: Colors.black),
                            ),
                            color: Colors.orange,
                            isloading: false,
                            onpressed: () {}),
                        Spacethingy,
                        CustomMianButton(
                            child: const Text(
                              "Add to cart",
                              style: TextStyle(color: Colors.black),
                            ),
                            color: Colors.yellow,
                            isloading: false,
                            onpressed: () {
                            }
                            ),
                        Spacethingy,
                        CustomSimpleRountedButton(
                            onpressed: () {
                               showDialog(
                                  context: context,
                                  builder: (context) => const ReviewDialog());
                            },
                            text: "Add a review for this product"),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenSize.height,
                    child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, Index) {
                          return RevewWidget(
                              review: ReviewModel(
                                  sendername: "keerthi",
                                  description: "Very good product",
                                  rating: 3));
                        }),
                  ),
                ],
              ),
            )),
            UserDetailsBar(
              offset: 0,
              userDetails:
                  UserDetailsModel(name: "keerthi", address: "on the erth"),
            )
          ],
        ),
      ),
    );
  }
}
