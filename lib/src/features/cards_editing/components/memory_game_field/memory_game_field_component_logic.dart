part of 'memory_game_field_component.dart';

class _MemoryGameFieldComponentLogic {
  final formKey = GlobalKey<FormState>();
  String subject = '';

  void Function(String value) onChangedMemoryGameName(BuildContext context) => (String value) {
        MemoryGameEditingContext.of(context)!.memoryGameName = value;
      };

  void Function(String value) onChangedSubject(BuildContext context) => (String value) {
        subject = value;
        MemoryGameEditingContext.of(context)!.subjectList = value.split(', ').toList();
      };
}
