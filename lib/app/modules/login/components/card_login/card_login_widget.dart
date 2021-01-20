import 'package:flutter/material.dart';
import 'package:softagon_auth/app/modules/home/home_module.dart';
import 'package:softagon_auth/app/modules/login/login_module.dart';
import 'package:softagon_auth/app/modules/login/repositories/auth_repository.dart';
import 'package:softagon_auth/app/modules/register/register_module.dart';
import 'package:softagon_auth/app/shared/components/buttom.dart';
import 'package:softagon_auth/app/shared/components/input_icon.dart';

class CardLoginWidget extends StatefulWidget {
  @override
  _CardLoginWidgetState createState() => _CardLoginWidgetState();
}

class _CardLoginWidgetState extends State<CardLoginWidget> {
  final emailControler = new TextEditingController();
  final passwordControler = new TextEditingController();

  var _auth = LoginModule.to.getDependency<AuthRepository>();

  _login(){
    var data = {
      "identifier": emailControler.text,
      "password": passwordControler.text
    };

    _auth.login(data).then((value){
      
      _auth.setToken(value['jwt']);
      _auth.setProfile(value['user']);
      _auth.permissions();

      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
          HomeModule()), (Route<dynamic> route) => false);
          
    }, onError: (error){
      print(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300.0,
        child: Column(children: [
          Image.asset("softagon-logo.png"),
          SizedBox(height: 40.0,),
          InputIcon(emailControler, "E-mail", Icons.email, showLabel: false, colorIcon: Colors.orange,),
          SizedBox(height: 10.0,),
          InputIcon(passwordControler, "Senha", Icons.security, showLabel: false, obscureText: true, colorIcon: Colors.orange,),
          SizedBox(height: 20.0,),

          Row(
            children: <Widget>[
              Expanded(
                child: Buttom(
                  'CADASTRAR',
                  false,
                  onPressed: (){
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                          RegisterModule()), (Route<dynamic> route) => false);
                  },
                  background2: Color(0xFF1cd11c),
                  background: Color(0xFF16CD6F),
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Buttom(
                  'ENTRAR',
                  false,
                  onPressed: _login,
                  background: Color(0xFF26AEDB),
                  background2: Color(0xFF102cf0),
                ),
              ),
            ],
          ),
        ],),
      ),
    );
  }
}
