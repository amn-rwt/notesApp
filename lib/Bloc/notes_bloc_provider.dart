import 'package:flutter/material.dart';
import 'notes_bloc.dart';
export 'notes_bloc.dart';

class NotesBlocProvider extends InheritedWidget {
  final bloc = NotesBloc();

  NotesBlocProvider({Key key, Widget child}) : super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static NotesBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(NotesBlocProvider)
            as NotesBlocProvider)
        .bloc;
  }
}
