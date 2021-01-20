import 'dart:convert';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository extends Disposable {
  String _urlApi = "http://192.168.0.102:1337";
  Dio client = new Dio();
  String token;

  Future login(data) async {

    final response =
        await client.post('${_urlApi}/auth/local', data: data);
    return response.data;
  }

  Future<dynamic> register(data) async {
    final response = await client.post('${_urlApi}/auth/local/register', data: data);
    return response.data;
  }

  Future<dynamic> forgotPassword(var data) async {
    final response = await client.post("${_urlApi}/auth/reset-password", data: data);
    return response.data;
  }

  void permissions() async {
    client.get("${_urlApi}/users-permissions").then((value){
      this.setPermissions(value.toString());
    });
  }

  void setProfile(var user) {
    String str = json.encode(user);

    SharedPreferences.getInstance().then((instance) {
      instance.setString('user', str);
    });
  }

  void setToken(String token) {
    SharedPreferences.getInstance().then((instance) {
      instance.setString('apiToken', token);
    });
  }

  void setPermissions(String token) {
    SharedPreferences.getInstance().then((instance) {
      instance.setString('permissions', token);
    });
  }

  removeAuthToken() {
    SharedPreferences.getInstance().then((instance) {
      instance.remove('apiToken');
    });
  }

  Future<bool> get isLoggedIn async {
    SharedPreferences.getInstance().then((instance) {
      return instance.containsKey('apiToken') && instance.getString('apiToken') != null ? true : false;
    });
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
