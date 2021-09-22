import 'package:flutter/material.dart';
import 'package:indoor_exercises/configurations/styles.dart';
import 'package:indoor_exercises/models/exercise.dart';

class ExerciseWidget extends StatelessWidget {
  final Exercise exercise;
  const ExerciseWidget({Key? key, required this.exercise}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 200,
      width: size.width,
      padding: const EdgeInsets.only(
         left: 20, right:10,top:10,bottom: 10
      ),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: exercise.color??Colors.lightBlueAccent),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            width: size.width * 0.35,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(exercise.name, style: AppStyle.exercise_title),
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white70
                  ),
                  child: Text(exercise.duration),
                )
              ],
            ),
          ),
          SizedBox(
            height: 100,
            width:100,
            child: Image.asset(exercise.imageUrl)),
        ],
      ),
    );
  }
}
