import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notes_app/Provider/firebase_provider.dart';

class Repository {
  final _firestoreProvider = FirestoreProvider();

  Future<void> addNote(String title, String content) =>
      _firestoreProvider.addNote(title, content);

  Stream<DocumentSnapshot> myNotesList() => _firestoreProvider.getNotes();

  void deleteNote() => _firestoreProvider.deleteNote();

  Future<void> updateNote(String title, String content) =>
      _firestoreProvider.updateNote(title, content);
}
