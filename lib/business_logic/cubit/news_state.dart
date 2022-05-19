part of 'news_cubit.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsLoaded extends NewsState{
  final List<NewsApi> news;

  NewsLoaded(this.news);
}

