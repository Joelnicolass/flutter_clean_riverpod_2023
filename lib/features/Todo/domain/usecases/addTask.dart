import 'package:socialgeneric/features/ToDo/domain/entities/task.dart';
import 'package:socialgeneric/features/Todo/domain/repositories/todo_repository.dart';

class AddTask {
  final TodoRepository repository;

  AddTask(this.repository);

  Future<void> call(Task task) async {
    return await repository.addTask(task);
  }
}
