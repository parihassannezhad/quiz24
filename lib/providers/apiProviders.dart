import 'package:dio/dio.dart';

import '../core/api_status.dart';

class ApiProvider {
  final Dio dio = Dio();

  Future LoadProduct() async {
    final response =
        await dio.get('https://json.xstack.ir/api/v1/posts');

    if (response.statusCode != 200) {
      return FailedStatus(errore: 'Error is ${response.statusCode}');
    } else {
      return SuccessStatus(data: response.data);
    }
  }
}
