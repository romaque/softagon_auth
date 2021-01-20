import 'package:flutter_modular/flutter_modular.dart';
import 'package:softagon_auth/app/app_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:softagon_auth/app/app_widget.dart';
import 'package:softagon_auth/app/modules/login/login_module.dart';

import 'modules/home/home_module.dart';
import 'modules/login/repositories/auth_repository.dart';

class AppModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => AppBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  //@override
  //Widget get view => AppWidget();
  
  
 @override
  List<ModularRouter> get routers => [
        ModularRouter('/', module: LoginModule()),
        ModularRouter('/home', module: HomeModule(), guards: [AppGuard()]),
      ];
  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}

class AppGuard implements RouteGuard {
  var _auth = LoginModule.to.getDependency<AuthRepository>();

  @override
  Future<bool> canActivate(String url) async => _auth.isLoggedIn;

  @override
  List<GuardExecutor> get executors => throw UnimplementedError();
}


