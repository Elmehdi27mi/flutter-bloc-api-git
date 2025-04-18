import 'dart:convert';

import '../model/users.model.dart';
import 'package:http/http.dart' as http;

class UsersRepository {
  Future<ListUsers> searcheUsers(String keyword, int page, int pageSize) async {
    String url =
        "https://api.github.com/search/users?q=${keyword}&page=$page&perpage=$pageSize";
    try {
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        Map<String, dynamic> listUsersMap = json.decode(response.body);
        ListUsers listUsers = ListUsers.fromJson(listUsersMap);
        return listUsers;
      } else {
        return throw ("Error => ${response.statusCode}");
      }
    } catch (ex) {
      return throw ("Error =>" + ex.toString());
    }
  }
}
