import 'package:amazon_clone/model/product_model.dart';
import 'package:amazon_clone/model/user_details_model.dart';
import 'package:amazon_clone/util/constance.dart';
import 'package:amazon_clone/widgets/cart_items_widget.dart';
import 'package:amazon_clone/widgets/custom_main_button.dart';
import 'package:amazon_clone/widgets/search_bar_widget.dart';
import 'package:amazon_clone/widgets/user_details_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Searchbarwidget(isReadonly: false, hasBarButton: true),
        body: Center(
          child: Stack(
            children: [
              Column(
                children: [
                 const SizedBox(
                  height:  kAppBarHeight/2,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomMianButton(
                        child: const Text(
                          "Proceed to by (n) item",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        color: Colors.yellow,
                        isloading: false,
                        onpressed: () {}),
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: (context, Index) {
                          return  CartItemWidget(
                            product: Productmodel(
                              url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4iY6dz6wWdzxEMY2wWff5Rboh9pGOFzmcfg&usqp=CAU", 
                              productname: "rick Astley", 
                              cost: 999, 
                              discount: 0, 
                              uid: "toy", 
                              sellername: "ricky seller", 
                              smalleruid: "4523cvbn", 
                              rating: 2, 
                              noofRating: 1
                              ),
                              );
                        }),
                  )
                ],
              ),
               UserDetailsBar(
                offset: 0,
                userDetails: UserDetailsModel(
                    name: "keerthi", address: "someones on the earth"),
              ),
            ],
          ),
        ));
  }
}
