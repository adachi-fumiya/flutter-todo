import 'package:flutter/material.dart';
import 'package:todo/todo.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TodoScreen(),
    );
  }
}

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  List<String> todos = [];
  TextEditingController todoController = TextEditingController();
  int editingIndex = -1;

  void addTodo() {
    setState(() {
      todos.add(todoController.text);
      todoController.clear();
    });
  }

  void removeTodoAtIndex(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  void startEditing(int index) {
    setState(() {
      editingIndex = index;
      todoController.text = todos[index];
    });
  }

  void updateTodo() {
    setState(() {
      todos[editingIndex] = todoController.text;
      todoController.clear();
      editingIndex = -1;
    });
  }

  void cancelEditing() {
    setState(() {
      todoController.clear();
      editingIndex = -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        toolbarHeight: 50,
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          if (index == editingIndex) { // 編集中
            return ListTile(
              title: TextField(
                controller: todoController,
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: 'Edit Todo',
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.check),
                    onPressed: () {
                      updateTodo();
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      cancelEditing();
                    },
                  ),
                ],
              ),
            );
          } else { // 通常時
            final todoItem = todos[index];
            return Dismissible(
              key: Key(todoItem),
              onDismissed: (direction) {
                removeTodoAtIndex(index);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Deleted: $todoItem'),
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
              background: Container(
                color: Colors.red,
                child: const Icon(Icons.delete, color: Colors.white),
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 16.0),
              ),
              child: ListTile(
                title: Text(todoItem),
                onTap: () {
                  startEditing(index);
                },
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Add Todo'),
                content: TextField(
                  controller: todoController,
                  decoration: const InputDecoration(
                    hintText: 'Enter Todo',
                  ),
                ),
                actions: [
                  TextButton(
                    child: const Text('Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: const Text('Add'),
                    onPressed: () {
                      addTodo();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
