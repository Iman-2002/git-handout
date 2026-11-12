import 'todo.dart';

class TodoValidator {
  static const int maxNameLength = 100;
  static const int maxDescriptionLength = 5000;

  static List<String> validate(Todo todo) {
    final errors = <String>[];

    // Name
    if (todo.name.trim().isEmpty) {
      errors.add('NAME_EMPTY');
    }

    if (todo.name.length > maxNameLength) {
      errors.add('NAME_TOO_LONG');
    }

    // Beschreibung
    if (todo.description.length > maxDescriptionLength) {
      errors.add('DESCRIPTION_TOO_LONG');
    }

    // Fälligkeitsdatum
    final today = DateTime.now();

    final normalizedToday = DateTime(
      today.year,
      today.month,
      today.day,
    );

    final normalizedDueDate = DateTime(
      todo.dueDate.year,
      todo.dueDate.month,
      todo.dueDate.day,
    );

    if (normalizedDueDate.isBefore(normalizedToday)) {
      errors.add('DUE_DATE_IN_PAST');
    }

    return errors;
  }

  static bool isValid(Todo todo) {
    return validate(todo).isEmpty;
  }
}