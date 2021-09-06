import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notes_app/Repoistry/repositry.dart';


class NotesBloc {
  final _repository = Repository();

  void submit(String email) {
    _showProgress.sink.add(true);
    _repository
        .uploadGoal(email, _title.value, _goalMessage.value)
        .then((value) {
      _showProgress.sink.add(false);
    });
  }

  Stream<DocumentSnapshot> myGoalsList(String email) {
    return _repository.myGoalList(email);
  }

  Stream<QuerySnapshot> othersGoalList() {
    return _repository.othersGoalList();
  }

  //dispose all open sink
  void dispose() async {
    await _goalMessage.drain();
    _goalMessage.close();
    await _title.drain();
    _title.close();
    await _showProgress.drain();
    _showProgress.close();
  }

  //Convert map to goal list
  List mapToList({DocumentSnapshot doc, List<DocumentSnapshot> docList}) {
    if (docList != null) {
      List<OtherGoal> goalList = [];
      docList.forEach((document) {
        String email = document.data[StringConstant.emailField];
        Map<String, String> goals =
            document.data[StringConstant.goalField] != null
                ? document.data[StringConstant.goalField].cast<String, String>()
                : null;
        if (goals != null) {
          goals.forEach((title, message) {
            OtherGoal otherGoal = OtherGoal(email, title, message);
            goalList.add(otherGoal);
          });
        }
      });
      return goalList;
    } else {
      Map<String, String> goals = doc.data[StringConstant.goalField] != null
          ? doc.data[StringConstant.goalField].cast<String, String>()
          : null;
      List<Goal> goalList = [];
      if (goals != null) {
        goals.forEach((title, message) {
          Goal goal = Goal(title, message);
          goalList.add(goal);
        });
      }
      return goalList;
    }
  }

  //Remove item from the goal list
  void removeGoal(String title, String email) {
    return _repository.removeGoal(title, email);
  }
}