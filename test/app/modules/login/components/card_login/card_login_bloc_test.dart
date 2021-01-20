import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:softagon_auth/app/modules/login/components/card_login/card_login_bloc.dart';
import 'package:softagon_auth/app/modules/login/login_module.dart';

void main() {
  initModule(LoginModule());
  CardLoginBloc bloc;

  // setUp(() {
  //     bloc = LoginModule.to.bloc<CardLoginBloc>();
  // });

  // group('CardLoginBloc Test', () {
  //   test("First Test", () {
  //     expect(bloc, isInstanceOf<CardLoginBloc>());
  //   });
  // });
}
