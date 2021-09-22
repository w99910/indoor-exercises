import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:indoor_exercises/models/category.dart';

class CategoryWidget extends StatelessWidget {
  final Category category;
  const CategoryWidget({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[200]),
      child: Image.asset(category.categoryImage),
    );
  }
}
