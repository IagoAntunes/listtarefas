import 'package:flutter/material.dart';

class ToDoListPage extends StatelessWidget {
  ToDoListPage({super.key});

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'E-mail',
              ),
            ),
            ElevatedButton(onPressed: login, child: Text(emailController.text))
          ],
        ),
      ),
    ));
  }

  void login() {
    String text = emailController.text;
    print(text);
  }
}
