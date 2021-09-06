import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/UI/add_note_screen.dart';
import 'package:notes_app/widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: CircleAvatar(
          radius: 30,
          backgroundColor: Colors.white,
          child: Image.network(
            'https://i.ibb.co/vzSC8V0/man-head-avatar-beautiful-human-face-male-cartoon-vector-31176602.jpg',
            fit: BoxFit.fill,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(
              Icons.search,
              size: 30,
              color: Colors.black87,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddNoteScreen()),
            );
          }),
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            //ViewNote()
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: ListView.separated(
                separatorBuilder: (context, index) => Divider(
                      color: Colors.black38,
                    ),
                itemCount: 10,
                itemBuilder: (_, index) {
                  return Container(
                    height: 60,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Title',
                          style: titleStyle(),
                        ),
                        Text(
                          'Content of note',
                          style: contentStyle(),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
