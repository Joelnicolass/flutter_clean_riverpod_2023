import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socialgeneric/core/external/storage/local_storage.dart';
import 'package:socialgeneric/features/ToDo/domain/entities/task.dart';
import 'package:socialgeneric/features/Todo/ui/providers/todo_provider.dart';

final todosProvider = StateNotifierProvider<TodoNotifier, List<Task>>((ref) {
  final addTask = ref.watch(todosRepositoryProvider).addTask;
  final getTasks = ref.watch(todosRepositoryProvider).getTasks;

  return TodoNotifier(addTask: addTask, getTasks: getTasks);
});

class TodoNotifier extends StateNotifier<List<Task>> {
  final addTask;
  final getTasks;

  TodoNotifier({required this.addTask, required this.getTasks})
      : super([
          Task(
              id: 1,
              title: 'Primera',
              description: 'description',
              image: 'image',
              isDone: false,
              createdAt: DateTime.now(),
              updatedAt: DateTime.now(),
              deletedAt: DateTime.now()),
        ]);

  void add(Task task) {
    addTask(task);
    state = [...state, task];
    print(state);
  }

  void get() async {
    final tasks = await getTasks();
    state = [...state, ...tasks];
  }
}
