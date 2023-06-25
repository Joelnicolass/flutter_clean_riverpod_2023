import 'package:socialgeneric/features/ToDo/domain/entities/task.dart';
import 'package:socialgeneric/features/Todo/domain/repositories/todo_repository.dart';

class EditTask {
  final TodoRepository repository;

  EditTask(this.repository);

  Future<void> call(Task task) async {
    return await repository.editTask(task);
  }
}
