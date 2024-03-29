import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:todofirebaseprovider/models/todo.dart';

class TodoService with ChangeNotifier {

  // todoの空配列を作成
  List<Todo> todos = [];

  // firebaseを使用(インスタンス作成)
  Firestore firestore = Firestore.instance;

  addTodo(Todo todo) async {
    await firestore.collection('todos').add({
      'title': todo.title,
    }).then((value) {
      // documentIDをセット
      todo.id = value.documentID;
      // todos配列にtodoを追加
      todos.add(todo);
    });
    notifyListeners();  // UIの再描画
  }

  removeTodo(id) async {
    // idが合致したtodoを削除
    var index = todos.indexWhere((el) => el.id == id);
    if (index != -1) {
      // firebaseからtodoを削除
      await firestore.collection('todos').document(id).delete();
      // todos配列にtodoを追加
      todos.removeAt(index);
    }
    notifyListeners();  // UIの再描画
  }

  updTodo(Todo todo) async {
    // indexwhere : 引数に合致する最初のインデックスを返す
    var index = todos.indexWhere((el) => el.id == todo.id);
    // リストの中に対象のtodoが存在するかチェックし、あればそのtodoを更新する
    if(index != -1) {
      // firebaseのtodoを更新
      await firestore.collection('todos').document(todo.id).updateData({
        'title': todo.title,
      });
      todos[index] = todo;
    }
    notifyListeners();  // UIの再描画
  }
}