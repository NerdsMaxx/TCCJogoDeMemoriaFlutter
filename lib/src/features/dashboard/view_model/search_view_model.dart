import 'dart:async';

import 'package:flutter/material.dart';
import 'package:memory_game_web/injection.dart';
import 'package:memory_game_web/src/features/dashboard/contexts/dashboard_context.dart';
import 'package:memory_game_web/src/services/memory_game_service.dart';

class SearchViewModel {
  SearchViewModel({
    required this.context,
  }) {
    dashboardContext = DashboardContext.of(context)!;
  }

  final MemoryGameService memoryGameService = getIt<MemoryGameService>();
  late final DashboardContext dashboardContext;
  final BuildContext context;

  String search = '';
  Timer? _timer;

  void onChangedSearch(String value) {
    search = value;

    if (_timer == null) {
      _timer = Timer(const Duration(milliseconds: 20), () {
        
        final bool searchForCreator = DashboardContext.of(context)!.searchForCreator;
        
        if (search.isEmpty) {
          dashboardContext.futureMemoryGameList =
              memoryGameService.getAllMemoryGame(searchForCreator);
        } else {
          dashboardContext.futureMemoryGameList = memoryGameService
              .getAllMemoryGameBySearch(search, searchForCreator);
        }

        dashboardContext.reloadSearch();

        _timer = null;
      });
    } else if (_timer != null && !_timer!.isActive) {
      _timer = null;
    }
  }
}
