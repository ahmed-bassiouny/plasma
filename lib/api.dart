import 'package:dio/dio.dart';
import 'package:plasma/user.dart';
import 'package:plasma/user_list.dart';

class Api{
  static Dio dio;

  static String BASE_URL = "http://esameisa.com/demo/blazma/public/api/users";

  static Future<BaseResponse<User>> createUser(User user) async {
    Response response = await Dio().post(BASE_URL, data: user.toJson());
    BaseResponse<User> result = BaseResponse<User>.fromJson(response.data);
    if (result.success) {
      User item = User.fromJson(result.temp);
      result.data = item;
    }
    return result;
  }

  static Future<BaseResponse<User>> editUser(User user) async {
    Response response =
        await Dio().post("$BASE_URL/${user.id}", data: user.toJson());
    BaseResponse<User> result = BaseResponse<User>.fromJson(response.data);
    if (result.success) {
      User item = User.fromJson(result.temp);
      result.data = item;
    }
    return result;
  }

  static Future<BaseResponse<UserList>> search(int citId,
      int bloodType,int page) async {
    String url = BASE_URL + "?page=$page";
    if (citId >= 0) {
      url += "&city_index=$citId";
    }

    if (bloodType >= 0) {
      url += "&blood_specie_index=$bloodType";
    }
    print(url);
    Response response = await Dio().get(url);
    BaseResponse<UserList> result =
    BaseResponse<UserList>.fromJson(response.data);
    if (result.success) {
      UserList item = UserList.fromJson(result.temp);
      result.data = item;
    }
    return result;
  }


}

class BaseResponse<T> {

  bool success;
  String message;
  dynamic temp;
  T data;
  var errors = [];

  BaseResponse.fromJson(Map json)
      : success = json["success"],
        message = json["message"],
        errors = json["errors"],
        temp = json["data"] == null ? "" : json["data"];

  BaseResponse();
}