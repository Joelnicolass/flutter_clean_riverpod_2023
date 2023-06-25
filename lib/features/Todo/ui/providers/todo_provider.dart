import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socialgeneric/features/ToDo/data/repositories/todo_repository_implements.dart';
import 'package:socialgeneric/features/Todo/data/datasources/local_datasource.dart';
import 'package:socialgeneric/features/Todo/domain/usecases/addTask.dart';
import 'package:socialgeneric/features/Todo/domain/usecases/deleteTask.dart';
import 'package:socialgeneric/features/Todo/domain/usecases/getTasks.dart';

final todosRepositoryProvider = Provider((ref) {
  return TodoRepositoryImplements(TodoLocalDataSource());
});

final getTasksProvider = Provider((ref) {
  final repository = ref.watch(todosRepositoryProvider);
  return GetTasks(repository);
});

final addTaskProvider = Provider((ref) {
  final repository = ref.watch(todosRepositoryProvider);
  return AddTask(repository);
});

final deleteTaskProvider = Provider((ref) {
  final repository = ref.watch(todosRepositoryProvider);
  return DeleteTask(repository);
});
