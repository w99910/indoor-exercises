import 'dart:convert';
import 'dart:developer';
import 'dart:ui';

import 'package:indoor_exercises/models/category.dart';
import 'package:indoor_exercises/models/exercise.dart';
import 'package:flutter/services.dart' show rootBundle;

class Api {
  static getData() async {
    // File f = File('data');
    String contents = await rootBundle.loadString('assets/data/data.json');
    List<Category> categories = [];
    List<Exercise> exercises = [];
    var data = json.decode(contents);
    for (var d in data['categories']) {
      Category category = Category.fromJson(d);
      if (d['exercises'].length != 0) {
        for (var exercise in d['exercises']) {
          exercises.add(Exercise(
              name: exercise['name'],
              category: category,
              imageUrl: exercise['image'],
              level: exercise['level'],
              duration: exercise['video_length'],
              color: Color(int.parse(exercise['color']))));
        }
      }
      categories.add(category);
    }
    return [categories, exercises];
  }
}
