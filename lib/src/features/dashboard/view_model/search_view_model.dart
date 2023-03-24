import 'dart:async';

import 'package:flutter/material.dart';
import 'package:memory_game_web/injection.dart';
import 'package:memory_game_web/src/features/dashboard/contexts/dashboard_context.dart';
import 'package:memory_game_web/src/services/memory_game_service.dart';

class SearchViewModel {
  SearchViewModel({
    required this.context,
  });

  final MemoryGameService memoryGameService = getIt<MemoryGameService>();
  final BuildContext context;

  String search = '';
  Timer? _timer;

  void onChangedSearch(String value) {
    search = value;

    if (_timer == null) {
      _timer = Timer(const Duration(milliseconds: 20), () {
        if (search.isEmpty) {
          DashboardContext.of(context)!.futureMemoryGameList = memoryGameService.getAllMemoryGame();
        } else {
          DashboardContext.of(context)!.futureMemoryGameList =
              memoryGameService.getAllMemoryGameBySearch(search);
        }

        DashboardContext.of(context)!.reloadSearch();

        _timer = null;
      });
    } else if (_timer != null && !_timer!.isActive) {
      _timer = null;
    }
  }
}
