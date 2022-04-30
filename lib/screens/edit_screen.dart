import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/controller/todo_controller.dart';
import 'package:todo_app/model/todo.dart';

class UpdateScreen extends StatelessWidget {
  final int index;
  final TodoController todos = Get.find<TodoController>();

  UpdateScreen({required this.index});

  @override
  Widget build(BuildContext context) {
    TextEditingController _title =
        TextEditingController(text: todos.todo[index].title);
    TextEditingController _subtitle =
        TextEditingController(text: todos.todo[index].description);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Tasks'),
        backgroundColor: Colors.green[400],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              controller: _title,
              obscureText: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Task Name',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              obscureText: false,
              controller: _subtitle,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Task Description',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 4,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.4),
                    ),
                    child: Center(child: Text('Cancel')),
                  ),
                ),
                SizedBox(width: 20),
                InkWell(
                  child: Container(
                    width: MediaQuery.of(context).size.width / 4,
                    height: 50,
                    color: Colors.green[300],
                    child: Center(child: Text('Update Task')),
                  ),
                  onTap: () {
                    var editing = todos.todo[index];
                    editing.title = _title.text;
                    editing.description = _subtitle.text;
                    todos.todo[index] = editing;

                    Get.back();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
