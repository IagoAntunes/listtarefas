import 'package:flutter/material.dart';

import '../Widgets/todo_list_item.dart';

class ToDoListPage extends StatefulWidget {
  ToDoListPage({super.key});

  @override
  State<ToDoListPage> createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage> {
  List<String> todos = [];

  TextEditingController todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: todoController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Adicione uma tarefa"),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                ElevatedButton(
                  onPressed: () {
                    String text = todoController.text;
                    setState(() {
                      todos.add(text);
                    });
                    todoController.clear();
                  },
                  child: Icon(
                    Icons.add,
                    size: 30,
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff00d7f3),
                      padding: const EdgeInsets.all(20)),
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
                  for (String todo in todos) TodoListItem(),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                    child:
                        Text("Você possui ${todos.length} tarefas pendentes")),
                const SizedBox(width: 8),
                ElevatedButton(
                    onPressed: () {},
                    child: Text("Limpar Tudo"),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff00d7f3),
                        padding: EdgeInsets.all(20)))
              ],
            )
          ],
        ),
      )),
    );
  }
}
