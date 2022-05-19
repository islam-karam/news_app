
import 'package:dio/dio.dart';

import '../../constants/constants.dart';

class NewsApi {
  late Dio dio;

  NewsApi() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 50 * 1000,
      receiveTimeout: 50 * 1000,
    );
    dio = Dio(options);
  }

    Future<List<dynamic>> getNews() async {
    try {
      Response response = await dio.get(
          '/v2/top-headlines',
          queryParameters: {
      'country': 'us',
      'apiKey': apiKey,}
      );
      print(response.toString());
      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

}


//v2/top-headlines?country=us&apiKey=600ac4caa7f649a694ea1147394de9ea