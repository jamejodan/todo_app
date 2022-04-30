import 'package:todo_app/model/todo.dart';
import 'package:get/get.dart';

class TodoController extends GetxController {
  final todo = <Todo>[].obs;

  List<Todo> get taskList => todo.value;
}
