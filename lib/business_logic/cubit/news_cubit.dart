import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../data/model/news_model.dart';
import '../../data/repository/news_repository.dart';
import '../../data/wep_services/news_api.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit(NewsRepository newsRepository) : super(NewsInitial());
  NewsRepository newsRepository = NewsRepository(NewsApi());


  List<NewsModel> news = [];

   List<dynamic> getAllNews() {
     newsRepository.getNewsRepository().then((news) {
      emit(NewsLoaded(news.cast()));
       this.news = news.map((e) => NewsModel.fromJson(e)).toList();
    });
    return news;
  }
}
