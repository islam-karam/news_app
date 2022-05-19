import '../model/news_model.dart';
import '../wep_services/news_api.dart';

class NewsRepository {
   NewsApi newsApi;

  NewsRepository(this.newsApi);

   Future<List<dynamic>> getNewsRepository() async {
    final news = await newsApi.getNews();
    return news.map((e) => NewsModel.fromJson(e)).toList();
  }
}
