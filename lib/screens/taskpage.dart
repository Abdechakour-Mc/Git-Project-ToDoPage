import 'package:flutter/material.dart';
import 'package:todo_one/databas_helper.dart';
import 'package:todo_one/models/task.dart';
import 'package:todo_one/widgets.dart';
class TaskPage extends StatefulWidget {
  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  Task _newTask = Task();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                              right: 25,
                            ),
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color(0xff26104A), width: 2.2),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Icon(
                              Icons.arrow_back,
                              color: Color(0xff26104A),
                              size: 30,
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            onSubmitted: (value) async {
                              if (value != "") {
                                Task(title: value,);
                                await DatabaseHelper.instance.insertTask(_newTask);
                                List<Map<String, dynamic>> queryRows = await DatabaseHelper.instance.queryAllTasks();
                                print(queryRows);
                              }
                            },
                            decoration: InputDecoration(
                              hintText: "Enter Task Title",
                              border: InputBorder.none,
                            ),
                            style: TextStyle(
                              fontSize: 26.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Task description",
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                      ),
                    ),
                  ),
                  ToDoWidget(
                    colorType: 0,
                    text: "Create Your First ToDo",
                    isDone: false,
                  ),
                  ToDoWidget(
                    colorType: 1,
                    text: "Create Another ToDo As Well ",
                    isDone: false,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 24,
              right: 24,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Color(0xffFE3577),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 1.0,
                          spreadRadius: -1.0,
                          offset: Offset(
                              2.0, 2.0), // shadow direction: bottom right
                        )
                      ],
                      borderRadius: BorderRadius.circular(100.0)),
                  child: Icon(Icons.delete, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
