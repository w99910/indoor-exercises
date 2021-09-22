import 'dart:ui';

import 'package:indoor_exercises/models/category.dart';

class Exercise {
  String name;
  Category category;
  String imageUrl;
  int level;
  String duration;
  Color? color;
  Exercise({required this.name,required this.category,required this.imageUrl, required this.level,required this.duration,this.color});
}
