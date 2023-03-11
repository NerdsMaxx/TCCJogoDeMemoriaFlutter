// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:memory_game_web/src/api/http_impl.dart' as _i4;
import 'package:memory_game_web/src/auth/auth.dart' as _i5;
import 'package:memory_game_web/src/interfaces/http_interface.dart' as _i3;
import 'package:memory_game_web/src/services/gameplay_service.dart' as _i6;
import 'package:memory_game_web/src/services/memory_game_service.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.HttpInterface>(
      () => _i4.HttpImpl(),
      instanceName: 'HttpImpl',
    );
    gh.factory<_i5.Auth>(
        () => _i5.Auth(gh<_i3.HttpInterface>(instanceName: 'HttpImpl')));
    gh.factory<_i6.GameplayService>(() => _i6.GameplayService(
          gh<_i5.Auth>(),
          gh<_i3.HttpInterface>(instanceName: 'HttpImpl'),
        ));
    gh.factory<_i7.MemoryGameService>(() => _i7.MemoryGameService(
          gh<_i5.Auth>(),
          gh<_i3.HttpInterface>(instanceName: 'HttpImpl'),
        ));
    return this;
  }
}
