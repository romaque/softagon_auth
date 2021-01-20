import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:softagon_auth/app/modules/home/home_module.dart';
import 'package:softagon_auth/app/modules/home/repositories/notas_repository.dart';

class HomeBloc extends BlocBase {
  var _notas = HomeModule.to.getDependency<NotasRepository>();

  //dispose will be called automatically by closing its streams
  @override
  void dispose() {
    super.dispose();
  }
}
