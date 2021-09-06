import 'package:flutter/material.dart';
import 'package:notes_app/widgets.dart';

class ViewNoteScreen extends StatefulWidget {
  @override
  _ViewNoteScreenState createState() => _ViewNoteScreenState();
}

class _ViewNoteScreenState extends State<ViewNoteScreen> {
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
              Row(
                children: [
                  Spacer(),
                  IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        //delete note logic
                        Navigator.pop(context);
                      }),
                  IconButton(
                      icon: Icon(Icons.done),
                      onPressed: () {
                        //update note logic
                        Navigator.pop(context);
                      }),
                ],
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
                  controller: contentController,
                  maxLines: null,
                  expands: true,
                  style: contentStyle(),
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
