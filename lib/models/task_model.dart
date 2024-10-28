import 'package:hive/hive.dart';

part 'task_model.g.dart'; // required for Hive code generation

@HiveType(typeId: 0)
class Task extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  bool isCompleted;

  Task({required this.title, this.isCompleted = false});
}
