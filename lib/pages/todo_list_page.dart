import 'package:flutter/material.dart';
import 'package:listtarefas/repositories/todo_repository.dart';

import '../Widgets/todo_list_item.dart';
import '../models/todo.dart';

class ToDoListPage extends StatefulWidget {
  ToDoListPage({super.key});

  @override
  State<ToDoListPage> createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage> {
  List<Todo> todos = [];
  Todo? deletedTodo;
  int? deletedTodoPos;

  TextEditingController todoController = TextEditingController();
  final TodoRepository todoRepository = TodoRepository();

  void onDelete(Todo todo) {
    deletedTodo = todo;
    deletedTodoPos = todos.indexOf(todo);
    setState(() {
      todos.remove(todo);
    });
    todoRepository.saveToDoList(todos);
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        'Tarefa ${todo.title} foi removida com sucesso',
        style: const TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      duration: const Duration(seconds: 5),
      action: SnackBarAction(
        label: 'Desfazer',
        textColor: Colors.lightBlue,
        onPressed: () {
          setState(() {
            todos.insert(deletedTodoPos!, deletedTodo!);
            todoRepository.saveToDoList(todos);
          });
        },
      ),
    ));
  }

  void deleteAllTodos() {
    setState(() {
      todos.clear();
    });
    todoRepository.saveToDoList(todos);
  }

  void showDeleteTodosConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Limpar Tudo?'),
        content:
            const Text('Voce tem certeza que deseja apagar todas as tarefas ?'),
        actions: [
          TextButton(
              onPressed: () => {Navigator.of(context).pop()},
              style: TextButton.styleFrom(
                  foregroundColor: const Color(0xff00d7f3)),
              child: const Text('Cancelar')),
          TextButton(
              onPressed: () {
                setState(() {
                  todos.clear();
                });
                Navigator.of(context).pop();
              },
              style: TextButton.styleFrom(foregroundColor: Colors.red),
              child: const Text('Limpar Tudo'))
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    todoRepository.getToDoList().then((value) {
      setState(() {
        todos = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
            child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: todoController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Adicione uma tarefa"),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (todoController.text.isNotEmpty) {
                        String text = todoController.text;
                        setState(() {
                          Todo newTodo =
                              Todo(title: text, dateTime: DateTime.now());
                          todos.add(newTodo);
                          todoRepository.saveToDoList(todos);
                        });
                        todoController.clear();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff00d7f3),
                        padding: const EdgeInsets.all(20)),
                    child: const Icon(
                      Icons.add,
                      size: 30,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Flexible(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    for (Todo todo in todos)
                      TodoListItem(todo: todo, onDelete: onDelete),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                      child: Text(
                          "Você possui ${todos.length} tarefas pendentes")),
                  const SizedBox(width: 8),
                  ElevatedButton(
                      onPressed: showDeleteTodosConfirmationDialog,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff00d7f3),
                          padding: const EdgeInsets.all(20)),
                      child: const Text("Limpar Tudo"))
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
