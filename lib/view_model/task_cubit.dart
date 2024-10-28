import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import '../models/task_model.dart';

class TaskCubit extends Cubit<List<Task>> {
  final Box<Task> taskBox;

  TaskCubit(this.taskBox) : super(taskBox.values.toList());

  void addTask(String title) {
    final newTask = Task(title: title);
    taskBox.add(newTask);
    emit(taskBox.values.toList());
  }

  void toggleTaskCompletion(int index) {
    final task = taskBox.getAt(index);
    if (task != null) {
      task.isCompleted = !task.isCompleted;
      task.save();
      emit(taskBox.values.toList());
    }
  }

  void deleteTask(int index) {
    taskBox.deleteAt(index);
    emit(taskBox.values.toList());
  }
}
