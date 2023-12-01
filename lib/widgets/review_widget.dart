import 'package:amazon_clone/model/review_model.dart';
import 'package:amazon_clone/util/constance.dart';
import 'package:amazon_clone/widgets/rating_star_widget.dart';
import 'package:flutter/material.dart';

class RevewWidget extends StatelessWidget {
  final ReviewModel review;
  const RevewWidget({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
      Size screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text(review.sendername, 
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold
        ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Row(
            children: [
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(right: 10)),
                  SizedBox(
            width: screenSize.width/4,
            child: FittedBox(
                  child: RatingStarWidget(rating: review.rating),
            ),
          ),
                ],
              ),
          Text(KeysofRating[review.rating - 1], 
          style: TextStyle(fontWeight: FontWeight.bold),)
            ],
          ),
        ),
        Text(review.description, maxLines: 3, overflow: TextOverflow.ellipsis,)
        ],
      ),
    );
  }
}
