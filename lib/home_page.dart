import 'package:flutter/material.dart';
import 'package:students_bloc/student.dart';
import 'package:students_bloc/student_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final StudentBloc _studentBloc = StudentBloc();

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => StreamBuilder<List<Student>>(
          stream: _studentBloc.studentListStream,
          builder: ((context, snapshot) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: ((context, index) {
                  return Card(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              width: constraints.maxWidth * 0.33,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    '${snapshot.data![index].studentId}.',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.grey[300],
                                      radius: 30,
                                      child: Image.network(
                                        snapshot.data![index].studentImage,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: constraints.maxWidth * 0.33,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    snapshot.data![index].studentName,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  Text(
                                    '${snapshot.data![index].studentScore}',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: constraints.maxWidth * 0.33,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: IconButton(
                                      icon: Icon(Icons.remove),
                                      color: Colors.red,
                                      onPressed: () {
                                        _studentBloc.studentScoreDecrementSink
                                            .add(snapshot.data![index]);
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: IconButton(
                                      onPressed: () {
                                        _studentBloc.studentScoreIncrementSink
                                            .add(snapshot.data![index]);
                                      },
                                      icon: Icon(
                                        Icons.add,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }));
          }),
        ),
      ),
    );
  }
}
