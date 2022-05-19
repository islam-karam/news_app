import 'package:flutter/material.dart';

import 'app_router.dart';
import 'business_logic/cubit/news_cubit.dart';
import 'data/repository/news_repository.dart';
import 'data/wep_services/news_api.dart';

void main() {
  runApp(MyApp(
    appRouter: AppRouter(
      NewsRepository(NewsApi()),
      NewsCubit(NewsRepository(NewsApi())),
    ),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({Key? key, required this.appRouter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
