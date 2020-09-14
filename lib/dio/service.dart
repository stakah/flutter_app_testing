import 'package:dio/dio.dart';
import 'package:flutter_app_testing/dio/model/model.dart';

class Service {
  Dio _dio;

  Service([Dio dio]):this._dio = dio;

  Dio get dio {
    print("[get] _dio: $_dio");
    if (_dio == null) _dio = Dio();
    return _dio;
  }

  Future<List<User>> users() async {
    var url = "https://jsonplaceholder.typicode.com/users";

    Response response = await dio.get(url);

    var list = User.fromList(response.data);

    return list;
  }
}