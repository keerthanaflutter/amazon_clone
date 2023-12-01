import 'package:amazon_clone/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';

class Searchscreen extends StatelessWidget {
  const Searchscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Searchbarwidget(isReadonly: false, hasBarButton: true),
    );
  }
}