import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/view_model/task_cubit.dart';

class Dialogbox extends StatelessWidget {
  const Dialogbox({
    super.key,
    required this.textController,
  });

  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: 100,
        child: Column(
          children: [
            TextField(
              controller: textController,
              decoration: const InputDecoration(hintText: 'add task'),
          onSubmitted: (value) {
                      if (value.isNotEmpty) {
                       context.read<TaskCubit>().addTask(value);
                      }
                    },
            ),
            Row(
              children: [
                MaterialButton(
                  onPressed: () {
                    final tasktitle = textController.text;
                    if (tasktitle.isNotEmpty) {
                      context.read<TaskCubit>().addTask(tasktitle);
                      textController.clear();
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('add'),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('cancel'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
