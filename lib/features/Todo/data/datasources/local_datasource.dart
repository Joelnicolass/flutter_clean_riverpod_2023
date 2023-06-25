// archivo de datasource

import 'package:socialgeneric/core/external/storage/local_storage.dart';
import 'package:socialgeneric/features/ToDo/domain/entities/task.dart';
import 'package:socialgeneric/features/Todo/data/adapters/task_adapters.dart';
import 'package:socialgeneric/features/Todo/domain/datasources/todo_datasources.dart';

class TodoLocalDataSource implements TodoDataSource {
  @override
  Future<void> addTask(Task task) {
    final data = taskToJson([task]);

    return Future.delayed(const Duration(seconds: 2)).then((value) {
      LocalDataBase.add(data.first);
    });
  }

  @override
  Future<void> editTask(Task task) {
    return Future.delayed(const Duration(seconds: 2)).then((value) {
      LocalDataBase.edit(taskToJson([task]).first);
    });
  }

  @override
  Future<void> deleteTask(String id) {
    return Future.delayed(const Duration(seconds: 2)).then((value) {
      LocalDataBase.delete(id);
    });
  }

  @override
  Future<Task> getTask(String id) {
    // TODO: implement getTask
    throw UnimplementedError();
  }

  @override
  Future<List<Task>> getTasks() {
    return Future.delayed(const Duration(seconds: 2)).then((value) {
      final data = LocalDataBase.get().then((value) => taskFromJson(value));
      return data;
    });
  }
}
