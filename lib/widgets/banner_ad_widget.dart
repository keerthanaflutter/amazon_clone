//import 'dart:ffi';

import 'package:amazon_clone/util/color_themes.dart';
import 'package:amazon_clone/util/constance.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BannerAdWidget extends StatefulWidget {
  const BannerAdWidget({super.key});

  @override
  State<BannerAdWidget> createState() => _BannerAdWidgetState();
}

class _BannerAdWidgetState extends State<BannerAdWidget> {
  int currentad = 0;
  //double smallAdHeight = 100;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double smallAdHeight = screenSize.width / 4;

    return GestureDetector(
      onHorizontalDragEnd: (_) {
        if (currentad == (largeAds.length - 1)) {
          currentad = -1;
        }
        setState(() {
          currentad++;
        });
      },
      child: Column(
        children: [
          //image with gradient
          Stack(
            children: [
              Image.network(
                largeAds[currentad],
                width: double.infinity,
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: screenSize.width,
                  height: 100,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        backgroundColor,
                        backgroundColor.withOpacity(0),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          Container(
            color: backgroundColor,
            width: screenSize.width,
            height: smallAdHeight,
            child: Expanded(
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  getSmallAdsfromIndex(0, smallAdHeight),
                  getSmallAdsfromIndex(1, smallAdHeight),
                  getSmallAdsfromIndex(2, smallAdHeight),
                  getSmallAdsfromIndex(3, smallAdHeight)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget getSmallAdsfromIndex(int index, double height) {
    return Container(
      height: height,
      width: height,
      decoration: ShapeDecoration(
        color: Colors.white,
        shadows: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 5,
            spreadRadius: 5,
          ),
        ],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(smallAds[index]),
            const SizedBox(
              height: 1,
            ),
            Text(adItemNames[index])
          ],
        ),
      ),
    );
  }
}
