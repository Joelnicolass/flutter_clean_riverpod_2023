import 'package:socialgeneric/features/ToDo/domain/entities/task.dart';
import 'package:socialgeneric/features/Todo/domain/datasources/todo_datasources.dart';
import 'package:socialgeneric/features/Todo/domain/repositories/todo_repository.dart';

class TodoRepositoryImplements implements TodoRepository {
  final TodoDataSource dataSource;

  TodoRepositoryImplements(
    this.dataSource,
  );

  @override
  Future<Task> getTask(String id) {
    return dataSource.getTask(id);
  }

  @override
  Future<List<Task>> getTasks() {
    return dataSource.getTasks();
  }

  @override
  Future<void> deleteTask(String id) {
    return dataSource.deleteTask(id);
  }

  @override
  Future<void> addTask(Task task) {
    return dataSource.addTask(task);
  }

  @override
  Future<void> editTask(Task task) {
    return dataSource.editTask(task);
  }
}
