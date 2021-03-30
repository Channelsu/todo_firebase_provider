import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
            title: Text('todo'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    // todoの更新
                    showDialog(
                      context: context, 
                      builder: (context) => AlertDialog(
                        title: TextField(),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('更新'),
                            onPressed: () {
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
                  onPressed: () {},
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
          // todo追加フォームを開く
          // todo更新フォームも同様の物を使用
          showDialog(
            context: context, 
            builder: (context) => AlertDialog(
              title: TextField(),
              actions: <Widget>[
                FlatButton(
                  child: Text('追加'),
                  onPressed: () {
                    // addTodoメソッドを呼び出す
                    
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