import 'dart:convert';
import 'package:clean_architecture/services/services.dart';
import 'package:injectable/injectable.dart';
import 'package:clean_architecture/user/repository/i_auth_api.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

//aqui va todo lo necesario para hacer los request
//se hacen las consultas a BD embebidas en el telefono o a servicios web.
@Injectable(as: IAuthApi)
class AuthApi extends IAuthApi {
  final String _baseUrl = 'identitytoolkit.googleapis.com';
  final String _firebaseToken = 'AIzaSyAzefJgFmYQfu5WJHybcGo3qrzc3ocpA7Y'; //token de acceso al api de firebase
  //final storage = const FlutterSecureStorage();
  // final FlutterSecureStorage _secureStorage;
  // final SharedPreferences _sharedPreferences;
  // final FirebaseService _firebaseService;

  AuthApi();

  //si no hay error return null
  @override
  Future<String?> createUser(String email, String password) async {
    //creamos info del post
    final Map<String, dynamic> authData = {'email': email, 'password': password, 'returnSecureToken': true};
    //creamos la url
    final url = Uri.https(_baseUrl, '/v1/accounts:signUp', {'key': _firebaseToken});
    //disparamos peticion http
    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodedResp = json.decode(resp.body);
    if (decodedResp.containsKey('idToken')) {
      //guardamos el token n un lugar seguro con el paquete flutter_secure_storage.
      //await _secureStorage.write(key: 'tokenUserAuth', value: decodedResp['idToken']);
      return null;
    } else {
      return decodedResp['error']['message'];
    }
  }

  //si no hay error return null
  @override
  Future<String?> login(String email, String password) async {
    //creamos info del post
    final Map<String, dynamic> authData = {'email': email, 'password': password, 'returnSecureToken': true};
    //creamos la url
    final url = Uri.https(_baseUrl, '/v1/accounts:signInWithPassword', {'key': _firebaseToken});
    //disparamos peticion http
    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodedResp = json.decode(resp.body);
    if (decodedResp.containsKey('idToken')) {
      //await _secureStorage.write(key: 'tokenUserAuth', value: decodedResp['idToken']);
      return null;
    } else {
      return decodedResp['error']['message'];
    }
  }

  @override
  Future logout() async {
    //eliminamos el token de la session
    //await _secureStorage.delete(key: 'tokenUserAuth');
    return;
  }

  @override
  Future<String> readToken() async {
    await Future.delayed(const Duration(seconds: 3));

    // final res = _sharedPreferences.getKeys();
    // final firebaseService = _firebaseService.toString();
    // return await _secureStorage.read(key: 'tokenUserAuth') ?? '';
    return '';
  }
}
