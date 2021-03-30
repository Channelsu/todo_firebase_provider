import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todofirebaseprovider/pages/todo_list.dart';
import 'package:todofirebaseprovider/services/todo_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // アプリのルートにTodoServiceを追加
    return ChangeNotifierProvider<TodoService>(
      create: (context) => TodoService(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'todo_firebase_provider',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: TodoList(),
      ),
    );
  }
}

