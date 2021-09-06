import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/UI/home_screen.dart';
import 'package:notes_app/UI/view_note_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: GoogleFonts.nunito().fontFamily,
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
