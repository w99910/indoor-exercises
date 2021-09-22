import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indoor_exercises/screens/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title:'',
        theme:ThemeData(
          primaryColor: Colors.black,
          textTheme: GoogleFonts.poppinsTextTheme(
      Theme.of(context).textTheme,
    ),
        ),
        home: const HomePage(),
    );
  }
}