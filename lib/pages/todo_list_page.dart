import 'package:flutter/material.dart';

class ToDoListPage extends StatelessWidget {
  ToDoListPage({super.key});

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
                ElevatedButton(
                  onPressed: () {},
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
            ListView(
              shrinkWrap: true,
              children: [
                Container(
                  color: Colors.red,
                  width: 50,
                  height: 50,
                ),
                Container(
                  color: Colors.yellow,
                  width: 50,
                  height: 50,
                ),
                Container(
                  color: Colors.red,
                  width: 50,
                  height: 50,
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                const Expanded(child: Text("Você possui 0 tarefas pendentes")),
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
