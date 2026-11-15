import 'todo.dart';
import 'todo_validation_error.dart';

class TodoValidator {
  static const maxNameLength = 100;
  static const maxDescriptionLength = 5000;

  static List<TodoValidationError> validate(
  Todo todo,
) {
  final errors = <TodoValidationError>[];

    // Name
    if (todo.name.trim().isEmpty) {
      errors.add(TodoValidationError.nameEmpty);
    }

    if (todo.name.length > maxNameLength) {
      errors.add(TodoValidationError.nameTooLong);
    }

    // Beschreibung
    if ((todo.description?.length ?? 0) > maxDescriptionLength) {
      errors.add(TodoValidationError.descriptionTooLong);
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
      errors.add(TodoValidationError.dueDateInPast);
    }

    return errors;
  }

  static bool isValid(Todo todo) {
    return validate(todo).isEmpty;
  }
}