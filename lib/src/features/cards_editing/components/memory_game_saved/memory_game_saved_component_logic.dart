part of 'memory_game_saved_component.dart';

class _SavedMemoryGameComponentLogic {
  VoidCallback onPressedCreateOtherMemoryGame(BuildContext context) => () {
        context.router.push(const CardAddingRoute());
      };

  VoidCallback onPressedExitDashboard(BuildContext context) => () {
        context.router.push(const DashboardRoute());
      };
}
