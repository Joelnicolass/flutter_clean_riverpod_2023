import 'package:socialgeneric/features/Todo/domain/repositories/todo_repository.dart';

class DeleteTask {
  final TodoRepository repository;

  DeleteTask(this.repository);

  Future<void> call(String id) async {
    return await repository.deleteTask(id);
  }
}
