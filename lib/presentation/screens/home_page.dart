import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/cubit/news_cubit.dart';
import '../widget/widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String id = '/';

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List news = [];

  @override
  initState() {
    super.initState();
    BlocProvider.of<NewsCubit>(context).getAllNews();
  }

  Widget buildBLocWidget() {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
      if (state is NewsLoaded) {
        return buildLoadedListWidgets();
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }

  Widget buildLoadedListWidgets() {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            buildItemList(),
          ],
        ),
      ),
    );
  }

  Widget buildItemList() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 1,
        mainAxisExtent: 1,
      ),
      shrinkWrap: true,
      physics: const PageScrollPhysics(),
      itemCount: news.length,
      padding: EdgeInsets.zero,
      itemBuilder: (ctx, index) {
        return NewsItem(
          news: news[index],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text('News', style: TextStyle(color: Colors.black)),
      ),
      body: buildBLocWidget(),
    );
  }

}
