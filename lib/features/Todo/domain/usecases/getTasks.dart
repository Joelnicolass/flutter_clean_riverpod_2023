import 'package:socialgeneric/features/ToDo/domain/entities/task.dart';
import 'package:socialgeneric/features/Todo/domain/repositories/todo_repository.dart';

class GetTasks {
  final TodoRepository repository;

  GetTasks(this.repository);

  Future<List<Task>> call() async {
    return await repository.getTasks();
  }
}
