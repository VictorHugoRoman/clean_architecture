abstract class IAuthApi {
  Future<String?> createUser(String email, String password);
  Future<String?> login(String email, String password);
  Future<void> logout();
  Future<String> readToken();
}
