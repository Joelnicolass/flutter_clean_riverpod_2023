import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socialgeneric/features/ToDo/domain/entities/task.dart';
import 'package:socialgeneric/features/Todo/ui/providers/todo_provider.dart';

class TodoState {
  final List<Task> tasks;
  final bool isLoading;

  TodoState({
    required this.tasks,
    this.isLoading = false,
  });

  TodoState copyWith({
    List<Task>? tasks,
    bool? isLoading,
  }) {
    return TodoState(
      tasks: tasks ?? this.tasks,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

final todosProvider = StateNotifierProvider<TodoNotifier, TodoState>((ref) {
  final getTasks = ref.watch(getTasksProvider).call;
  final addTask = ref.watch(addTaskProvider).call;
  final deleteTask = ref.watch(deleteTaskProvider).call;

  return TodoNotifier(
    getTasks: getTasks,
    addTask: addTask,
    deleteTask: deleteTask,
  );
});

class TodoNotifier extends StateNotifier<TodoState> {
  final getTasks;
  final addTask;
  final deleteTask;

  TodoNotifier({
    required this.getTasks,
    required this.addTask,
    required this.deleteTask,
  }) : super(TodoState(tasks: []));

  add({
    required String title,
    required String description,
  }) async {
    final randomIndex = Random().nextInt(1000);
    final task = Task(
      id: state.tasks.length + 1,
      title: title,
      description: description,
      image: 'https://picsum.photos/id/${randomIndex}/500/300',
      isDone: false,
      createdAt: DateTime.now(),
    );

    state = state.copyWith(isLoading: true);
    await addTask(task);
    state = state.copyWith(tasks: [...state.tasks, task], isLoading: false);
  }

  get() async {
    state = state.copyWith(isLoading: true);
    final tasks = await getTasks();
    state = state.copyWith(tasks: tasks, isLoading: false);
  }

  delete(String id) async {
    state = state.copyWith(
      tasks: state.tasks.where((task) => task.id.toString() != id).toList(),
    );
    await deleteTask(id);
  }
}
