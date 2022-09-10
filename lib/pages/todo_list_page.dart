import 'package:flutter/material.dart';

class ToDoListPage extends StatelessWidget {
  ToDoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            const Expanded(
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Adicione uma tarefa"),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            ElevatedButton(onPressed: () {}, child: Text("+"))
          ],
        ),
      )),
    );
  }
}
