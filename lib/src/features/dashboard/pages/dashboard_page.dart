import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:memory_game_web/src/features/dashboard/components/code_entry_component.dart';
import 'package:memory_game_web/src/features/dashboard/components/code_generator_component.dart';
import 'package:memory_game_web/src/features/dashboard/components/main_dashboard_component.dart';
import 'package:memory_game_web/src/features/dashboard/contexts/dashboard_context.dart';
import 'package:memory_game_web/src/widgets/app_bar_widget.dart';
import 'package:memory_game_web/src/widgets/value_listenable_builder_2_widget.dart';

@RoutePage(name: 'DashboardRoute')
class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  
  @override
  void dispose() {
    DashboardContext.of(context)!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBarWidget(
      body: Center(
        child: DashboardContext(
          child: Builder(
            builder: (internalContext) => ValueListenableBuilder2Widget(
              valueListenable1: DashboardContext.of(internalContext)!.codeEntry,
              valueListenable2: DashboardContext.of(internalContext)!.codeGenerator,
              builder: (context, codeEntry, codeGenerator) => Stack(
                children: [
                  AbsorbPointer(
                    absorbing: codeEntry || codeGenerator,
                    child: const MainDashboardComponent(),
                  ),
                  Visibility(
                    visible: codeEntry,
                    child: const CodeEntryComponent(),
                  ),
                  Visibility(
                    visible: codeGenerator,
                    child: const CodeGeneratorComponent(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
