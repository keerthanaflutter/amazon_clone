//import 'dart:ffi';

import 'package:amazon_clone/model/user_details_model.dart';
import 'package:amazon_clone/util/constance.dart';
import 'package:amazon_clone/widgets/banner_ad_widget.dart';
import 'package:amazon_clone/widgets/catagories_horizontal_list_view_bar.dart';
import 'package:amazon_clone/widgets/production_showcase_list_view.dart';
import 'package:amazon_clone/widgets/search_bar_widget.dart';
import 'package:amazon_clone/widgets/simple_product_widget.dart';
import 'package:amazon_clone/widgets/user_details_bar.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  ScrollController controller = ScrollController();
  double offset = 0;
 

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        offset = controller.position.pixels;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Searchbarwidget(
          isReadonly: true,
          hasBarButton: false,
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              controller: controller,
              child: Column(
                children: [
                  const SizedBox(height: kAppBarHeight /2,),
                  const CatageoryHorizontalListViewBar(),
                  const  BannerAdWidget(),
                  ProductsShowcaseListView(
                      title: "Upto 70% off", children: testchildren),
                  ProductsShowcaseListView(
                      title: "Upto 60% off", children: testchildren),
                  ProductsShowcaseListView(
                      title: "Upto 50% off", children: testchildren),
                  ProductsShowcaseListView(
                      title: "Explore", children: testchildren),
                ],
              ),
            ),
            UserDetailsBar(
              offset: offset, 
              userDetails: UserDetailsModel(
                name: "keerthi", 
                address: "on the erth"
                ),
                ),
          ],
        ));
  }
}
