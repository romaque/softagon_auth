import 'package:softagon_auth/app/modules/login/repositories/auth_repository.dart';
import 'package:softagon_auth/app/modules/login/components/card_login/card_login_bloc.dart';
import 'package:softagon_auth/app/modules/login/login_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:softagon_auth/app/modules/login/login_page.dart';

class LoginModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => CardLoginBloc()),
        Bloc((i) => LoginBloc()),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency((i) => AuthRepository()),
      ];

  @override
  Widget get view => LoginPage();

  static Inject get to => Inject<LoginModule>.of();
}
