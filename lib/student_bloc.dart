import 'dart:async';

import 'package:students_bloc/student.dart';

class StudentBloc {
  final List<Student> _studentList = [
    Student(1, 'Mohamed', 96.5,
        'https://www.pngall.com/wp-content/uploads/8/Man-PNG-Image-HD.png'),
    Student(2, 'Ahmed', 86.5,
        'https://i.graphicmama.com/uploads/2019/3/5c822b0ee4340-stylish-man-cartoon-vector-character.png'),
    Student(3, 'Samir', 92,
        'https://www.pngall.com/wp-content/uploads/8/Man-PNG-Image-HD.png'),
    Student(4, 'Magdy', 97,
        'https://static.vectorcharacters.net/uploads/2013/08/Casual_Guy_Vector_Character_Preview.jpg'),
  ];

  // step #1 Stream Controller

  final _studentListStreamController = StreamController<List<Student>>();
  final _studentScoreIncrementStreamController = StreamController<Student>();
  final _studentScoreDecrementStreamController = StreamController<Student>();

  // step #2 Strean & Sink => get

  Stream<List<Student>> get studentListStream =>
      _studentListStreamController.stream;

  StreamSink<List<Student>> get studentListSink =>
      _studentListStreamController.sink;

  StreamSink<Student> get studentScoreIncrementSink =>
      _studentScoreIncrementStreamController.sink;

  StreamSink<Student> get studentScoreDecrementSink =>
      _studentScoreDecrementStreamController.sink;

  // step #3 Constructor => Add data and listen to changes

  StudentBloc() {
    _studentListStreamController.add(_studentList);
    _studentScoreIncrementStreamController.stream.listen(_incrementScore);
    _studentScoreDecrementStreamController.stream.listen(_decrementScore);
  }

  // step #4 Core Function

  _incrementScore(Student student) {
    double score = student.studentScore;
    double incrementValue = 0.5;
    if (student.studentScore < 100) {
      _studentList[student.studentId - 1].studentScore = score + incrementValue;
    }
    studentListSink.add(_studentList);
  }

  _decrementScore(Student student) {
    double score = student.studentScore;
    double decrementValue = 0.5;
    if (student.studentScore > 0) {
      _studentList[student.studentId - 1].studentScore = score - decrementValue;
    }
    studentListSink.add(_studentList);
  }

  // step #5  Dispode

  void dispose() {
    _studentListStreamController.close();
    _studentScoreIncrementStreamController.close();
    _studentScoreDecrementStreamController.close();
  }
}
