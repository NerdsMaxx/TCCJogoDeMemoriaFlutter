part of 'title_component.dart';

class _TitleComponentLogic {
  VoidCallback onPressedAdding(BuildContext context) => () {
        context.router.push(const CardAddingRoute());
      };

  VoidCallback onPressedCodeEntry(BuildContext context) => () {
        DashboardContext.of(context)!.showCodeEntry();
      };
}
