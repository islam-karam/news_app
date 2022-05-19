import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'business_logic/cubit/news_cubit.dart';
import 'presentation/screens/home_page.dart';

import 'data/repository/news_repository.dart';
import 'data/wep_services/news_api.dart';

class AppRouter {
  NewsRepository newsRepository;
  NewsCubit newsCubit;
  AppRouter(
    this.newsRepository,
    this.newsCubit,
  );

  // ignore: missing_return
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomePage.id:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => NewsCubit (
              NewsRepository(NewsApi()),
            ),
            child: HomePage(),
          ),
        );
    }
  }

}