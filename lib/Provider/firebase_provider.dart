import 'dart:js';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirestoreProvider {
  final _firestoreProvider = FirestoreProvider();

  CollectionReference ref = FirebaseFirestore.instance.collection('notes');

  //firestore related function to be added here.
  Future<void> addNote(String title, String content) {
    ref.add({
      'title': title,
      'content': content,
    });
  }

  Stream<DocumentSnapshot> getNotes() {
    ref.snapshots();
  }

  void deleteNote() {
    //logic to delete note.
  }

  Future<void> updateNote(String title, String content){
    
  }
}
