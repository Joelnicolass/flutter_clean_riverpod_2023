import 'package:socialgeneric/features/ToDo/domain/entities/task.dart';

abstract class TodoDataSource {
  Future<void> addTask(Task task);
  Future<void> editTask(Task task);
  Future<void> deleteTask(String id);
  Future<List<Task>> getTasks();
  Future<Task> getTask(String id);
}
