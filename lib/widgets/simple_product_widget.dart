import 'package:amazon_clone/model/product_model.dart';
import 'package:amazon_clone/screens/product_screen.dart';
import 'package:flutter/material.dart';

class SimpleProductWidget extends StatelessWidget {
final Productmodel productModel;
  const SimpleProductWidget({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductScreen(productmodel: productModel)));
              },
      child: AspectRatio(
        aspectRatio: 1/1,
        child: Container(
          color: Colors.white,
          child: Padding(padding: const EdgeInsets.all(10),
                child: Image.network(productModel.url),
                
                ),
        ),
      ),
    );
  }
}
