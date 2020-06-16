

import 'package:plasma/pagination.dart';
import 'package:plasma/user.dart';

class UserList{
  List<User> items;
  Pagination pagination;

  UserList.fromJson(Map<String, dynamic> json)
      : items = User.fromList(json["items"]),
        pagination = Pagination.fromJson(json["pagination"]);

}