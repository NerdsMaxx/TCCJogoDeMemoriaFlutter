part of 'title_component.dart';

class _TitleComponentLogic {
  VoidCallback onPressedAdding(BuildContext context) {
    return () {
      context.router.push(const CardAddingRoute());
    };
  }

  VoidCallback onPressedCodeEntry(BuildContext context) {
    return () {
      DashboardContext.of(context)!.showCodeEntry();
    };
  }

  VoidCallback onPressedGameplayManagement(BuildContext context) {
    return () {
      context.router.push(const GameplayManagementRoute());
    };
  }
}
