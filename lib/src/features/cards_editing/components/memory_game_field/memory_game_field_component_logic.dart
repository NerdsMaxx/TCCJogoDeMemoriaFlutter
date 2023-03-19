part of 'memory_game_field_component.dart';

class _MemoryGameFieldComponentLogic {
  _MemoryGameFieldComponentLogic(BuildContext context) {
    memoryGameName = MemoryGameEditingContext.of(context)!.memoryGameName;
    subjects = MemoryGameEditingContext.of(context)!.subjectList.join(', ');
  }

  final formKey = GlobalKey<FormState>();

  late String memoryGameName;
  late String subjects;

  void Function(String value) onChangedMemoryGameName(BuildContext context) => (String value) {
        MemoryGameEditingContext.of(context)!.memoryGameName = value;
      };

  void Function(String value) onChangedSubject(BuildContext context) => (String value) {
        subjects = value;
        MemoryGameEditingContext.of(context)!.subjectList = value.split(', ').toList();
      };
}
