import 'package:flutter/material.dart';

class ToDoListPage extends StatelessWidget {
  const ToDoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: TextField(
          decoration: InputDecoration(
              labelText: 'E-mail',
              hintText: 'exemplo@gmail.com',
              errorText: 'Campo Obrigatorio0'),
          obscureText: true,
        ),
      ),
    ));
  }
}
