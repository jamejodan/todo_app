import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/controller/todo_controller.dart';
import 'package:todo_app/screens/edit_screen.dart';
import 'package:todo_app/screens/task.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TodoController todos = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo List'),
        backgroundColor: Colors.green[400],
        elevation: 0,
      ),
      body: Obx(
        () => todos.todo.length == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: todos.todo.length,
                itemBuilder: (context, index) => Dismissible(
                  key: UniqueKey(),
                  background: Container(
                    color: Colors.red,
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                  onDismissed: (_) {
                    todos.todo.removeAt(index);
                    Get.snackbar('Remove!', "Task was succesfully Delete",
                        duration: Duration(seconds: 2),
                        snackPosition: SnackPosition.BOTTOM);
                  },
                  child: ListTile(
                    title: Text(todos.taskList[index].title),
                    subtitle: Text(todos.taskList[index].description),
                    onTap: () => Get.to(
                      UpdateScreen(
                        index: index,
                      ),
                    ),
                  ),
                ),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green[300],
        onPressed: () {
          Get.to(
            Task(),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
