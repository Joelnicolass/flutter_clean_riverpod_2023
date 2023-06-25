import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socialgeneric/features/ToDo/data/repositories/todo_repository_implements.dart';
import 'package:socialgeneric/features/Todo/data/datasources/local_datasource.dart';

final todosRepositoryProvider = Provider((ref) {
  return TodoRepositoryImplements(TodoLocalDataSource());
});
