import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
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
                          child: Text('キャンセル'),
                          onPressed: () {
                            Navigator.pop(context);  // ダイアログを閉じて元の画面に戻る
                          },
                        ),
                        FlatButton(
                          child: Text('更新'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {},
              ),
            ],
          ),
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
                  child: Text('キャンセル'),
                  onPressed: () {
                    Navigator.pop(context);  // ダイアログを閉じて元の画面に戻る
                  },
                ),
                FlatButton(
                  child: Text('追加'),
                  onPressed: () {
                    Navigator.pop(context);
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