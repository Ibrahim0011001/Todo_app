import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/view_model/task_cubit.dart';

class TodoList extends StatelessWidget {
  const TodoList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskCubit, List<Task>>(
      builder: (context, tasks) {
         if (tasks.isEmpty) {
            return const Center(
              child: Text('No tasks yet!'),
            );}
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];
          
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: ListTile(
                  tileColor: Colors.yellow[200],
                  title: Text(
                    task.title,
                    style: TextStyle(
                      decoration: task.isCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: () => context.read<TaskCubit>().deleteTask(index),
                  ),
                      leading: Checkbox(value: task.isCompleted, onChanged: (value)=>
                        context.read<TaskCubit>().toggleTaskCompletion(index)
                      ,activeColor:Colors.red ,),
                ),
              );
            },
          ),
        );
      },
    );
  }
}