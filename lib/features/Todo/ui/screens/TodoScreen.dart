import 'dart:math';

import 'package:animate_do/animate_do.dart';
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
        //avatar
        title: FadeInDown(
          child: const Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
              ),
              SizedBox(
                width: 10,
              ),
              Text("Nombre de usuario", style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
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

    //cargar tareas
    ref.read(todosProvider.notifier).getTasks();
  }

  final _formNewTask = _FormNewTask(title: '', description: '');
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(todosProvider);

    return Column(
      children: [
        FormNewTask(
          formKey: _formKey,
          formNewTask: _formNewTask,
          ref: ref,
          tasks: provider.tasks,
          isLoading: provider.isLoading,
        ),

        // lista de tareas
        ListTasks(tasks: provider.tasks),
      ],
    );
  }
}

class _FormNewTask {
  String title;
  String description;

  _FormNewTask({required this.title, required this.description});

  reset() {
    title = '';
    description = '';
  }
}

class FormNewTask extends StatelessWidget {
  const FormNewTask({
    super.key,
    required GlobalKey<FormState> formKey,
    required _FormNewTask formNewTask,
    required this.ref,
    required this.tasks,
    required this.isLoading,
  })  : _formKey = formKey,
        _formNewTask = formNewTask;

  final GlobalKey<FormState> _formKey;
  final _FormNewTask _formNewTask;
  final WidgetRef ref;
  final List<Task> tasks;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          //form new task
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Title',
                ),
                onChanged: (value) {},
                onSaved: (value) {
                  _formNewTask.title = value!;
                }),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Description',
                ),
                onChanged: (value) {},
                onSaved: (value) {
                  _formNewTask.description = value!;
                }),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(MediaQuery.of(context).size.width, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      _formKey.currentState!.save();
                      ref.read(todosProvider.notifier).add(
                            title: '${_formNewTask.title}',
                            description: '${_formNewTask.description}',
                          );

                      _formKey.currentState!.reset();
                      _formNewTask.reset();
                    },
                    child: const Text('Add Task'),
                  ),
          ),
        ],
      ),
    );
  }
}

class ListTasks extends ConsumerWidget {
  const ListTasks({
    super.key,
    required this.tasks,
  });

  final List<Task> tasks;

  @override
  Widget build(BuildContext context, ref) {
    return Expanded(
      child: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return FadeInDown(
              duration: Duration(milliseconds: 400),
              delay: Duration(milliseconds: index * 100),
              child: TaskCard(
                task: task,
                cb: () =>
                    ref.read(todosProvider.notifier).delete(task.id.toString()),
              ));
        },
      ),
    );
  }
}

class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.task, required this.cb});

  final VoidCallback cb;
  final Task task;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(task.id.toString()),
      onDismissed: (_) => cb(),
      direction: DismissDirection.endToStart,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.2,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(task.image),
              fit: BoxFit.fill,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5),
                BlendMode.darken,
              ),
            ),
            borderRadius: BorderRadius.circular(10),
            color: task.isDone
                ? Colors.green
                : const Color.fromARGB(77, 255, 255, 255),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                task.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                task.description,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    task.createdAt!.toLocal().toString().split('.')[0],
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                    ),
                  ),

                  //boton de eliminar
                  IconButton(
                    onPressed: cb,
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
