import 'package:clean_architecture/user/repository/auth_api.dart';

//aqui se manda llamar el archivo que tiene los metodos que consultan los servicios web o las bd embebidas en el telefono
class AuthRepository {
  AuthApi api;
  AuthRepository(this.api);

  Future<String?> login(String email, String password) => api.login(email, password);
  Future<void> logOut() => api.logout();
}
