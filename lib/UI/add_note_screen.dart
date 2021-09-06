import 'package:flutter/material.dart';
import 'package:notes_app/widgets.dart';

class AddNoteScreen extends StatelessWidget {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: Icon(Icons.done),
                  onPressed: () {
                    //addNote()
                    Navigator.pop(context);
                  },
                ),
              ),
              TextField(
                style: titleStyle(),
                controller: titleController,
                decoration: InputDecoration(
                  focusedBorder: InputBorder.none,
                  border: InputBorder.none,
                  hintText: 'Title',
                  hintStyle: titleStyle(),
                ),
              ),
              Expanded(
                child: TextField(
                  style: contentStyle(),
                  controller: contentController,
                  maxLines: null,
                  expands: true,
                  decoration: InputDecoration(
                    focusedBorder: InputBorder.none,
                    border: InputBorder.none,
                    hintText: 'Add note here...',
                    hintStyle: contentStyle(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
