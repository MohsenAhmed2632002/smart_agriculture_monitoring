import 'package:dio/dio.dart';


class ApiService {
  final Dio dio = Dio();
Future
<Map<String, dynamic>>
 get({required String Url}) async {
    var res = await dio.get("$Url");
    return res.data;
  }
}

