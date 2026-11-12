import '../repeat_interval.dart';

class Todo {
  final String id;
  final String name;
  final String description;
  final DateTime dueDate;
  final RepeatInterval interval;

  Todo({
    required this.id,
    required this.name,
    this.description,
    required this.dueDate,
    required this.interval,
  });
}