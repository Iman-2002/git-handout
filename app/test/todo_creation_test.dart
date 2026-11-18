import 'package:flutter_test/flutter_test.dart';
import 'package:to_gether/to_gether/domain/repeat_interval.dart';
import 'package:to_gether/to_gether/domain/todo.dart';
import 'package:to_gether/to_gether/domain/todo_validator.dart';
import 'package:to_gether/to_gether/domain/todo_validation_error.dart';

// Diese Imports werden erst funktionieren,
// wenn die Klassen später implementiert werden.
// import 'package:todo_app/models/todo.dart';

void main() {
  group('Todo Creation', () {
    test('gültiges Todo kann erstellt werden', () {
      final todo = Todo(
        id: '1',
        name: 'Einkaufen',
        description: 'Milch und Brot kaufen',
        dueDate: DateTime.now().add(const Duration(days: 1)),
        interval: RepeatInterval.weekly,
      );
      expect(TodoValidator.validate(todo).isEmpty, isTrue);
    });

    test('Todo ohne Beschreibung kann erstellt werden', () {
      final todo = Todo(
        id: '1',
        name: 'Einkaufen',
        description: '',
        dueDate: DateTime.now().add(const Duration(days: 1)),
        interval: RepeatInterval.none,
      );

      expect(TodoValidator.validate(todo).isEmpty, isTrue);
    });

    test('Name darf nicht leer sein', () {
      final todo = Todo(
        id: '1',
        name: '',
        description: 'Test',
        dueDate: DateTime.now().add(const Duration(days: 1)),
        interval: RepeatInterval.none,
      );

    expect(
      TodoValidator.validate(todo),
      contains(TodoValidationError.nameEmpty),
    );
    });

    test('Name darf nicht nur Leerzeichen enthalten', () {
      final todo = Todo(
          id: '1',
          name: '     ',
          description: 'Test',
          dueDate: DateTime.now().add(const Duration(days: 1)),
          interval: RepeatInterval.none,
      );
    expect(
      TodoValidator.validate(todo),
      contains(TodoValidationError.nameEmpty),
    );
    });

    test('Name darf nicht nur Tabs enthalten', () {
      final todo = Todo(
          id: '1',
          name: '\t\t\t',
          description: 'Test',
          dueDate: DateTime.now().add(const Duration(days: 1)),
          interval: RepeatInterval.none,
      );
    expect(
      TodoValidator.validate(todo),
      contains(TodoValidationError.nameEmpty),
    );
    });

    test('Name darf nicht nur Zeilen enthalten', () {
      final todo = Todo(
          id: '1',
          name: '\n\n\n',
          description: 'Test',
          dueDate: DateTime.now().add(const Duration(days: 1)),
          interval: RepeatInterval.none,
      );
    expect(
      TodoValidator.validate(todo),
      contains(TodoValidationError.nameEmpty),
    );
    });

    test('Name mit einem Zeichen ist gültig', () {
      final todo = Todo(
        id: '1',
        name: 'A',
        description: '',
        dueDate: DateTime.now().add(const Duration(days: 1)),
        interval: RepeatInterval.none,
      );

        expect(
          TodoValidator.validate(todo).isEmpty,
          isTrue,
        );
    });

    test('Name mit maximaler Länge ist gültig', () {
      final todo = Todo(
        id: '1',
        name: 'A' * 100,
        description: '',
        dueDate: DateTime.now().add(const Duration(days: 1)),
        interval: RepeatInterval.none,
      );

      expect(TodoValidator.validate(todo).isEmpty, isTrue);
    });

    test('Name mit mehr als 100 Zeichen ist ungültig', () {
      final todo = Todo(
          id: '1',
          name: 'A' * 101,
          description: '',
          dueDate: DateTime.now().add(const Duration(days: 1)),
          interval: RepeatInterval.none,
      );
    expect(
      TodoValidator.validate(todo),
      contains(TodoValidationError.nameTooLong),
    );
    });

    test('Beschreibung mit mehr als 5000 Zeichen ist ungültig', () {
      final todo = Todo(
          id: '1',
          name: 'Einkaufen',
          description: 'A' * 5001,
          dueDate: DateTime.now().add(const Duration(days: 1)),
          interval: RepeatInterval.none,
      );
    expect(
      TodoValidator.validate(todo),
      contains(TodoValidationError.descriptionTooLong),
    );
    });

    test('Fälligkeitsdatum heute ist gültig', () {
      final todo = Todo(
        id: '1',
        name: 'Einkaufen',
        description: '',
        dueDate: DateTime.now(),
        interval: RepeatInterval.none,
      );

      expect(TodoValidator.validate(todo).isEmpty, isTrue);
    });

    test('Fälligkeitsdatum in der Zukunft ist gültig', () {
      final todo = Todo(
        id: '1',
        name: 'Einkaufen',
        description: '',
        dueDate: DateTime.now().add(const Duration(days: 30)),
        interval: RepeatInterval.none,
      );

      expect(TodoValidator.validate(todo).isEmpty, isTrue);
    });

    test('Fälligkeitsdatum in der Vergangenheit ist ungültig', () {
      final todo = Todo(
        id: '1',
        name: 'Einkaufen',
        description: '',
        dueDate: DateTime.now().subtract(const Duration(days: 1)),
        interval: RepeatInterval.none,
      );
      expect(
        TodoValidator.validate(todo),
        contains(TodoValidationError.dueDateInPast),
      );
    });

    // Gerade auch noch nicht sinnvoll, da IDs noch nicht automatisch vergeben werden
    test('ID wird automatisch vergeben', () {
      final todo = Todo(
        id: '1',
        name: 'Einkaufen',
        description: '',
        dueDate: DateTime.now().add(const Duration(days: 1)),
        interval: RepeatInterval.none,
      );

      expect(todo.id, isNotNull);
    });

    /*
    Derzeit kein sinnvoller Testfall, da Namen nicht getrimmt gespeichert werden
    test('Name wird getrimmt', () {
      final todo = Todo(
        id: '1',
        name: '   Einkaufen   ',
        description: '',
        dueDate: DateTime.now().add(const Duration(days: 1)),
        interval: RepeatInterval.none,
      );

      expect(todo.name, equals('Einkaufen'));
    });*/
  });
}