class Student {
  int _id;
  String _name;
  double _score;
  String _image;

  Student(this._id, this._name, this._score, this._image);

  set studentId(int id) {
    _id = id;
  }

  set studentName(String name) {
    _name = name;
  }

  set studentScore(double score) {
    _score = score;
  }

  set studentImage(String image) {
    _image = image;
  }

  int get studentId => _id;
  String get studentName => _name;
  double get studentScore => _score;
  String get studentImage => _image;
}
