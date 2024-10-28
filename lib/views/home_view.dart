import 'package:flutter/material.dart';

import 'package:todo/views/widgets/dialog_box.dart';
import 'package:todo/views/widgets/todo_list.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Colors.yellow,
        title: const Center(child:  Text('Todo App')),),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return Dialogbox(textController: textController);
            },
          );
        },
      ),
      body: const TodoList()
        
      
    );
  }
}



