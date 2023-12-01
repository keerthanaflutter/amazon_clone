import 'package:amazon_clone/model/product_model.dart';
import 'package:amazon_clone/util/color_themes.dart';
import 'package:amazon_clone/widgets/cost_widget.dart';
import 'package:amazon_clone/widgets/rating_star_widget.dart';
import 'package:flutter/material.dart';

class ResultWidget extends StatelessWidget {
  final Productmodel product;
  const ResultWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
     Size screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: screenSize.width / 3,
                child: Image.network(
                  product.url,
                  ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5, ),
                    child: Text(product.productname, 
                    maxLines: 3, 
                    overflow: TextOverflow.ellipsis,
                    ),
                  ),
            
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Row(
                     
                      children: [
                        SizedBox(
                          width: screenSize.width / 5,
                          child: 
                          FittedBox(
                            child: RatingStarWidget(rating: product.rating))),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(product.noofRating.toString(), 
                          style: const TextStyle(
                            color: activeCyanColor
                          ),),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                    child: FittedBox(
                      child: CostWidget(
                        color: const Color.fromARGB(255, 255, 73, 60), 
                        cost: product.cost,
                                
                        ),
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
