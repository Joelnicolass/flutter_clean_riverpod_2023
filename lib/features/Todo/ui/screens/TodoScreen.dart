import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socialgeneric/core/external/storage/local_storage.dart';
import 'package:socialgeneric/features/ToDo/domain/entities/task.dart';
import 'package:socialgeneric/features/Todo/ui/providers/todo_state.dart';

class TodoScreen extends StatelessWidget {
  static String name = 'TodoScreen';

  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TODO'),
      ),
      body: const Center(
        child: TodoList(),
      ),
    );
  }
}

class TodoList extends ConsumerStatefulWidget {
  const TodoList({super.key});

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends ConsumerState<TodoList> {
  @override
  void initState() {
    super.initState();

    ref.read(todosProvider.notifier).get();
  }

  @override
  Widget build(BuildContext context) {
    final tasks = ref.watch(todosProvider);

    if (tasks.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return Container(
        child: Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];
              return ListTile(
                title: Text(task.createdAt.toString()),
                subtitle: Text(task.updatedAt.toString()),
              );
            },
          ),
        ),
        ElevatedButton(
          onPressed: () {
            ref.read(todosProvider.notifier).add(
                  Task(
                    id: 1,
                    title: 'TITULOOOO',
                    description: 'description',
                    image: 'image',
                    isDone: false,
                    createdAt: DateTime.now(),
                    updatedAt: DateTime.now(),
                    deletedAt: DateTime.now(),
                  ),
                );
          },
          child: const Text('ADD'),
        ),
      ],
    ));
  }
}
