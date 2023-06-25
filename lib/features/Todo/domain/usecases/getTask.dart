import 'package:socialgeneric/features/ToDo/domain/entities/task.dart';
import 'package:socialgeneric/features/Todo/domain/repositories/todo_repository.dart';

class GetTask {
  final TodoRepository repository;

  GetTask(this.repository);

  Future<Task> call(String id) async {
    return await repository.getTask(id);
  }
}
