import '/path.dart';

class AuthLocalDatasource {
  // get, update, remove token
  final BaseStorage storage;

  AuthLocalDatasource({required this.storage});
  Future<String?> getToken() async {
    return await storage.getString("token");
  }

  Future<void> saveToken(String token) async {
    return await storage.setString("token", token);
  }

  Future<void> removeToken() async {
    return await storage.remove("token");
  }

  Future<String?> getTokenId() async {
    return await storage.getString("tokenId");
  }

  Future<void> saveTokenId(String tokenId) async {
    return await storage.setString("tokenId", tokenId);
  }

  Future<void> removeTokenId() async {
    return await storage.remove("tokenId");
  }

  Future<String?> getRefreshToken() async {
    return await storage.getString("refreshToken");
  }

  Future<void> saveRefreshToken(String token) async {
    return await storage.setString("refreshToken", token);
  }

  Future<void> removeRefreshToken() async {
    return await storage.remove("refreshToken");
  }

  // get, update, remove identifier
  Future<String?> getIdentifier() async {
    return await storage.getString("identifier");
  }

  Future<void> saveIdentifier(String identifier) async {
    return await storage.setString("identifier", identifier);
  }

  Future<void> removeIdentifier() async {
    return await storage.remove("identifier");
  }

  // get, update, remove isLogin
  Future<bool?> getIsLogin() async {
    return await storage.getBool("isLogin");
  }

  Future<void> saveIsLogin(bool isLogin) async {
    return await storage.setBool("isLogin", isLogin);
  }

  Future<void> removeIsLogin() async {
    return await storage.remove("isLogin");
  }

  // get, update, remove isBinding
  Future<bool?> getIsBinding() async {
    return await storage.getBool("isBinding");
  }

  Future<void> saveIsBinding(bool isBinding) async {
    return await storage.setBool("isBinding", isBinding);
  }

  Future<void> removeIsBinding() async {
    return await storage.remove("isBinding");
  }

  // get, update, remove comment
  Future<String?> getComment() async {
    return await storage.getString("comment");
  }

  Future<void> saveComment(String comment) async {
    return await storage.setString("comment", comment);
  }

  Future<void> removeComment() async {
    return await storage.remove("comment");
  }

  // get, update, remove rating
  Future<int?> getRating() async {
    return await storage.getInt("rating");
  }

  Future<void> saveRating(int rating) async {
    return await storage.setInt("rating", rating);
  }

  Future<void> removeRating() async {
    return await storage.remove("rating");
  }

  // get, update, last login
  Future<String?> getLastLogin() async {
    return await storage.getString("lastLogin");
  }

  Future<void> saveLastLogin(String lastLogin) async {
    return await storage.setString("lastLogin", lastLogin);
  }

  Future<void> removeLastLogin() async {
    return await storage.remove("lastLogin");
  }

  // get, update, name
  Future<String?> getName() async {
    return await storage.getString("name");
  }

  Future<void> saveName(String lastLogin) async {
    return await storage.setString("name", lastLogin);
  }

  Future<void> removeName() async {
    return await storage.remove("name");
  }
}
