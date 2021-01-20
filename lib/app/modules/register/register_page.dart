import 'package:flutter/material.dart';
import 'package:softagon_auth/app/modules/home/home_module.dart';
import 'package:softagon_auth/app/modules/login/login_module.dart';
import 'package:softagon_auth/app/modules/login/repositories/auth_repository.dart';
import 'package:softagon_auth/app/shared/components/buttom.dart';
import 'package:softagon_auth/app/shared/components/input_icon.dart';

class RegisterPage extends StatefulWidget {
  final String title;
  const RegisterPage({Key key, this.title = "Register"}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final userControler = new TextEditingController();
  final emailControler = new TextEditingController();
  final passwordControler = new TextEditingController();

  var _auth = LoginModule.to.getDependency<AuthRepository>();

  _login(){
    var data = {
      "username": userControler.text,
      "password": passwordControler.text,
      "email": emailControler.text,
      "confirmed": true,
      "blocked": false,
    };

    _auth.register(data).then((value){
      _auth.setToken(value['jwt']);
      _auth.setProfile(value['user']);

      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
          HomeModule()), (Route<dynamic> route) => false);
    }, onError: (error){
      print(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Container(
              width: 300.0,
              child: Column(children: [
                Image.asset("softagon-logo.png"),
                SizedBox(height: 40.0,),
                InputIcon(userControler, "Usuario", Icons.people_alt, showLabel: false, colorIcon: Colors.orange,),
                SizedBox(height: 10.0,),
                InputIcon(emailControler, "E-mail", Icons.email, showLabel: false, colorIcon: Colors.orange,),
                SizedBox(height: 10.0,),
                InputIcon(passwordControler, "Senha", Icons.security, showLabel: false, obscureText: true, colorIcon: Colors.orange,),
                SizedBox(height: 20.0,),

                Buttom(
                  'CADASTRAR',
                  false,
                  onPressed: _login,
                  background: Color(0xFF26AEDB),
                  background2: Color(0xFF102cf0),
                ),

                GestureDetector(
                  onTap: (){
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                          LoginModule()), (Route<dynamic> route) => false);
                  },
                  child: Container(child: Text("Voltar"), padding: EdgeInsets.all(20.0),),
                )
              ],),
            ),
          )
        ],
      ),
    );
  }
}
