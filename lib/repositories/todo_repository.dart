import 'package:shared_preferences/shared_preferences.dart';

import 'dart:convert';
import '../models/todo.dart';

const todoListKey = 'todo_list';

class TodoRepository {
  TodoRepository() {
    SharedPreferences.getInstance().then((value) => sharedPreferences = value);
  }

  late SharedPreferences sharedPreferences;

  Future<List<Todo>> getToDoList() async {
    sharedPreferences = await SharedPreferences.getInstance();
    final String jsonString = sharedPreferences.getString(todoListKey) ?? '';
    if (jsonString.isNotEmpty) {
      final List jsonDecoder = json.decode(jsonString) as List;
      return jsonDecoder.map((e) => Todo.fromJson(e)).toList();
    }
    return [];
  }

  clearList() async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }

  void saveToDoList(List<Todo> todos) {
    final String jsonString = json.encode(todos);
    sharedPreferences.setString(todoListKey, jsonString);
  }
}
