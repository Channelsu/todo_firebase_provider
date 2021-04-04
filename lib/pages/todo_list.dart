import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todofirebaseprovider/models/todo.dart';
import 'package:todofirebaseprovider/services/todo_service.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<TodoService>(
        builder: (context, value, child) => ListView.builder(
          itemBuilder: (context, index) => ListTile(
            title: Text(value.todos[index].title), // todoのタイトルを表示
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    TextEditingController _textController =
                      TextEditingController(
                        text: value.todos[index].title
                      );
                    // todoの更新
                    showDialog(
                      context: context, 
                      builder: (context) => AlertDialog(
                        title: TextField(
                          controller: _textController,
                        ),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('更新'),
                            onPressed: () {
                              // テストのため
                              var tempTodo = Todo(title: _textController.text);
                              // idを更新
                              tempTodo.id = value.todos[index].id;
                              // updTodoメソッドを呼び出す
                              context.read<TodoService>().updTodo(tempTodo);
                              Navigator.pop(context);  // ダイアログを閉じて元の画面に戻る
                            },
                          ),
                          FlatButton(
                            child: Text('キャンセル'),
                            onPressed: () {
                              Navigator.pop(context);  // ダイアログを閉じて元の画面に戻る
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    // 1を一時的に指定
                    context.read<TodoService>().removeTodo(value.todos[index].id);
                  },
                ),
              ],
            ),
          ),
          // valueはTodoServiceのインスタンス
          itemCount: value.todos.length,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          TextEditingController _textController = TextEditingController();
          // todo追加フォームを開く
          // todo更新フォームも同様の物を使用
          showDialog(
            context: context, 
            builder: (context) => AlertDialog(
              title: TextField(
                controller: _textController,
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text('追加'),
                  onPressed: () {
                    // addTodoメソッドを呼び出す
                    context.read<TodoService>().addTodo(
                      Todo(title: _textController.text ?? 'タイトルなし')
                    );
                    Navigator.pop(context);  // ダイアログを閉じて元の画面に戻る
                  },
                ),
                FlatButton(
                  child: Text('キャンセル'),
                  onPressed: () {
                    Navigator.pop(context);  // ダイアログを閉じて元の画面に戻る
                  },
                ),
              ],
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}