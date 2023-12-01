import 'package:amazon_clone/util/color_themes.dart';
import 'package:amazon_clone/widgets/cost_widget.dart';
import 'package:flutter/material.dart';

class ProductInformationWidget extends StatelessWidget {
  final String productname;
  final double cost;
  final String sellername;
  const ProductInformationWidget(
      {super.key,
      required this.productname,
      required this.cost,
      required this.sellername});

 

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
     SizedBox spaceThingy = const SizedBox(
    height: 7,
  );
    return SizedBox(
      width: screenSize.width / 2,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              productname,
              maxLines: 3,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                letterSpacing: 0.9,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          spaceThingy,

          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 7),
              child: CostWidget(color: Colors.black, cost: cost),
            ),
          ),
           
           spaceThingy,

          Align(
            alignment: Alignment.centerLeft,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text: "Sold by",
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 14,
                      )),
                  TextSpan(
                    text: sellername,
                    style:
                        const TextStyle(color: activeCyanColor, fontSize: 14),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
