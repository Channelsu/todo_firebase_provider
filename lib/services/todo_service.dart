import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:todofirebaseprovider/models/todo.dart';

class TodoService with ChangeNotifier {

  // todoの空配列を作成
  List<Todo> todos = [];

  addTodo(Todo todo) {
    todos.add(todo);
    notifyListeners();  // UIの再描画
  }

  removeTodo() {
    notifyListeners();  // UIの再描画
  }

  updTodo() {
    notifyListeners();  // UIの再描画
  }
}