import 'package:flutter_test/flutter_test.dart';

// Diese Imports werden erst funktionieren,
// wenn die Klassen später implementiert werden.
// import 'package:todo_app/models/todo.dart';

void main() {
  group('Todo Creation', () {
    test('gültiges Todo kann erstellt werden', () {
      final todo = Todo(
        name: 'Einkaufen',
        description: 'Milch und Brot kaufen',
        dueDate: DateTime.now().add(const Duration(days: 1)),
        interval: RepeatInterval.weekly,
      );

      expect(todo.isValid(), isTrue);
    });

    test('Todo ohne Beschreibung kann erstellt werden', () {
      final todo = Todo(
        name: 'Einkaufen',
        description: '',
        dueDate: DateTime.now().add(const Duration(days: 1)),
        interval: RepeatInterval.none,
      );

      expect(todo.isValid(), isTrue);
    });

    test('Name darf nicht leer sein', () {
      expect(
        () => Todo(
          name: '',
          description: 'Test',
          dueDate: DateTime.now().add(const Duration(days: 1)),
          interval: RepeatInterval.none,
        ),
        throwsA(isA<ArgumentError>()),
      );
    });

    test('Name darf nicht nur Leerzeichen enthalten', () {
      expect(
        () => Todo(
          name: '     ',
          description: 'Test',
          dueDate: DateTime.now().add(const Duration(days: 1)),
          interval: RepeatInterval.none,
        ),
        throwsA(isA<ArgumentError>()),
      );
    });

    test('Name mit einem Zeichen ist gültig', () {
      final todo = Todo(
        name: 'A',
        description: '',
        dueDate: DateTime.now().add(const Duration(days: 1)),
        interval: RepeatInterval.none,
      );

      expect(todo.isValid(), isTrue);
    });

    test('Name mit maximaler Länge ist gültig', () {
      final todo = Todo(
        name: 'A' * 100,
        description: '',
        dueDate: DateTime.now().add(const Duration(days: 1)),
        interval: RepeatInterval.none,
      );

      expect(todo.isValid(), isTrue);
    });

    test('Name mit mehr als 100 Zeichen ist ungültig', () {
      expect(
        () => Todo(
          name: 'A' * 101,
          description: '',
          dueDate: DateTime.now().add(const Duration(days: 1)),
          interval: RepeatInterval.none,
        ),
        throwsA(isA<ArgumentError>()),
      );
    });

    test('Fälligkeitsdatum heute ist gültig', () {
      final todo = Todo(
        name: 'Einkaufen',
        description: '',
        dueDate: DateTime.now(),
        interval: RepeatInterval.none,
      );

      expect(todo.isValid(), isTrue);
    });

    test('Fälligkeitsdatum in der Zukunft ist gültig', () {
      final todo = Todo(
        name: 'Einkaufen',
        description: '',
        dueDate: DateTime.now().add(const Duration(days: 30)),
        interval: RepeatInterval.none,
      );

      expect(todo.isValid(), isTrue);
    });

    test('Fälligkeitsdatum in der Vergangenheit ist ungültig', () {
      expect(
        () => Todo(
          name: 'Einkaufen',
          description: '',
          dueDate: DateTime.now().subtract(const Duration(days: 1)),
          interval: RepeatInterval.none,
        ),
        throwsA(isA<ArgumentError>()),
      );
    });

    test('ID wird automatisch vergeben', () {
      final todo = Todo(
        name: 'Einkaufen',
        description: '',
        dueDate: DateTime.now().add(const Duration(days: 1)),
        interval: RepeatInterval.none,
      );

      expect(todo.id, isNotNull);
    });

    test('Name wird getrimmt', () {
      final todo = Todo(
        name: '   Einkaufen   ',
        description: '',
        dueDate: DateTime.now().add(const Duration(days: 1)),
        interval: RepeatInterval.none,
      );

      expect(todo.name, equals('Einkaufen'));
    });
  });
}