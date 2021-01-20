import 'package:softagon_auth/app/modules/register/register_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:softagon_auth/app/modules/register/register_page.dart';

class RegisterModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => RegisterBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => RegisterPage();

  static Inject get to => Inject<RegisterModule>.of();
}
