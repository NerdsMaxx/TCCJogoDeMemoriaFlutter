import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:memory_game_web/injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => getIt.init();
