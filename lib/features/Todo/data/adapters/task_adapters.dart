import 'package:socialgeneric/features/ToDo/domain/entities/task.dart';

List<Map<String, dynamic>> taskToJson(List<Task> data) =>
    List<Map<String, dynamic>>.from(data.map((x) => {
          "id": x.id,
          "title": x.title,
          "description": x.description,
          "image": x.image,
          "isDone": x.isDone,
          "createdAt": x.createdAt,
          "updatedAt": x.updatedAt,
          "deletedAt": x.deletedAt,
        }));

List<Task> taskFromJson(List<Map<String, dynamic>> data) =>
    List<Task>.from(data.map((x) => Task(
          id: x["id"],
          title: x["title"],
          description: x["description"],
          image: x["image"],
          isDone: x["isDone"],
          createdAt: x["createdAt"],
          updatedAt: x["updatedAt"],
          deletedAt: x["deletedAt"],
        )));
