import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:softagon_auth/app/modules/register/register_bloc.dart';
import 'package:softagon_auth/app/modules/register/register_module.dart';

void main() {
  initModule(RegisterModule());
  RegisterBloc bloc;

  // setUp(() {
  //     bloc = RegisterModule.to.bloc<RegisterBloc>();
  // });

  // group('RegisterBloc Test', () {
  //   test("First Test", () {
  //     expect(bloc, isInstanceOf<RegisterBloc>());
  //   });
  // });
}
