// archivo de datasource

import 'package:socialgeneric/core/external/storage/local_storage.dart';
import 'package:socialgeneric/features/ToDo/domain/entities/task.dart';
import 'package:socialgeneric/features/Todo/domain/datasources/todo_datasources.dart';

class TodoLocalDataSource implements TodoDataSource {
  @override
  Future<void> addTask(Task task) {
    print("addTask");
    DataStorage state = DataStorage(id: task.id.toString(), data: task);

    return Future.delayed(const Duration(seconds: 2)).then((value) {
      LocalDataBase.addState(state);
    });
  }

  @override
  Future<void> editTask(Task task) {
    DataStorage state = DataStorage(id: task.id.toString(), data: task);

    return Future.delayed(const Duration(seconds: 2)).then((value) {
      return LocalDataBase.updateState(state);
    });
  }

  @override
  Future<void> deleteTask(String id) {
    // TODO: implement deleteTask
    throw UnimplementedError();
  }

  @override
  Future<Task> getTask(String id) {
    // TODO: implement getTask
    throw UnimplementedError();
  }

  @override
  Future<List<Task>> getTasks() {
    print("getTasks");
    List<Task> tasks =
        LocalDataBase.getStates().map((s) => s.data as Task).toList();

    return Future.delayed(const Duration(seconds: 2)).then((value) {
      return tasks;
    });
  }
}
