import 'package:flutter/material.dart';
import 'package:indoor_exercises/api/api.dart';
import 'package:indoor_exercises/configurations/styles.dart';
import 'package:indoor_exercises/models/category.dart';
import 'package:indoor_exercises/models/exercise.dart';
import 'package:indoor_exercises/widgets/category_widget.dart';
import 'package:indoor_exercises/widgets/exercise_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String input = '';
  List<Category> categories = [];
  List<Exercise> exercises = [];
  int _currentBottomNavigationIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        // type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.work),label: 'Exercises'),
          BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Settings')
        ],
        currentIndex: _currentBottomNavigationIndex,
        onTap: (index){
          setState(() {
            _currentBottomNavigationIndex = index;
          });
        },),
      appBar: AppBar(
        title: const Text(
          'Hello Jane',
          style: AppStyle.title,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_active_outlined,
                color: Colors.black87,
              ))
        ],
      ),
      body: Container(
        color: Colors.white,
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          // physics: const BouncingScrollPhysics(),
          // physics: const NeverScrollableScrollPhysics(),
          // physics: const AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Welcome back",
                style: AppStyle.header,
              ),
              const SizedBox(
                height: 14,
              ),
              Material(
                  borderRadius: BorderRadius.circular(32),
                  elevation: 0.5,
                  child: TextField(
                      controller: TextEditingController(text: input),
                      decoration: const InputDecoration(
                        hintText: 'Search Exercise',
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 12.0),
                        suffixIcon: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.search),
                        ),
                        border: InputBorder.none,
                      ))),
              const SizedBox(
                height: 22,
              ),
              const Text('Categories', style: AppStyle.title),
              FutureBuilder(
                future: Api.getData(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  categories = snapshot.data[0];
                  exercises = snapshot.data[1];
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: size.height * 0.13,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return CategoryWidget(
                                  category: categories[index]);
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                width: 14,
                              );
                            },
                            itemCount: categories.length),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text('Exercises',style:AppStyle.title),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        // width:double.infinity,
                        child: ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return ExerciseWidget(exercise: exercises[index]);
                          },
                          separatorBuilder: (context, int index) {
                            return const SizedBox(
                              height: 12,
                            );
                          },
                          itemCount: exercises.length,
                        ),
                      )
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
