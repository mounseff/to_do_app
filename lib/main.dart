import 'package:flutter/material.dart';
import 'package:to_do_app/widgets/cont.dart';
import 'package:to_do_app/widgets/to-do-card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: Todo(),
    );
  }
}

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class Task {
  String title;
  bool status;
  Task({required this.title, required this.status});
}

List allTasks = [
  Task(title: "HTML", status: false),
  Task(title: "CSS", status: true),
  Task(title: "DART", status: true),
];



cont() {
  int contDone = 0;
  allTasks.forEach((task) {
    if (task.status == true) {
      contDone += 1;
    }
  });
  return contDone;
}

class _TodoState extends State<Todo> {
  @override
  Widget build(BuildContext context) {
    String ttext = "";
    final mycontroller = TextEditingController();
    myfunction() {
      setState(() {
        ttext = mycontroller.text;
      });
    }
 changeStatus(int i) {
 setState(() {
 allTasks[i].status = !allTasks[i].status;
 });
}
    addnewtast() {
      allTasks.add(Task(title: ttext, status: false));
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                child: Container(
                  padding: EdgeInsets.all(40),
                  height: 200,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextField(
                        cursorColor: Colors.blueAccent[700],
                        controller: mycontroller,
                        autofocus: true,
                        maxLength: 20,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blueAccent[700]!,
                              width: 2.0,
                            ),
                          ),
                          labelText: "ADD NEW TASK",
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          myfunction();
                          ttext.isEmpty ? null : addnewtast();
                          Navigator.pop(context);
                        },
                        child: Text(
                          "ADD",
                          style: TextStyle(
                            color: Colors.blueAccent[700],
                            fontSize: 18,
                          ),
                        ),
                      ),
                      // Text("text is :  $ttext "),
                    ],
                  ),
                ),
              );
            },

            // isScrollControlled: true
          );
        },
        backgroundColor: Colors.blueAccent[700],
        shape: CircleBorder(),
        child: Icon(Icons.add, color: Colors.white),
      ),
      backgroundColor: Color.fromRGBO(58, 66, 86, 0.7),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(58, 66, 86, 1),
        elevation: 0,
        title: Text(
          "To Do APP",
          style: TextStyle(
            color: const Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Cont(alltodo: allTasks.length, allcompleted: cont()),

            Container(
              height: 600,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return card(
                    varTiltle: allTasks[index].title,
                    varStatus: allTasks[index].status,
                    changeStatus: changeStatus,
                    i: index,
                  );
                },
                itemCount: allTasks.length,
              ),
            ),

            // ...allTasks.map(
            //   (e) => card(varTiltle: e.title, varStatus: e.status),
            // ),
          ],
        ),
      ),
    );
  }
}
